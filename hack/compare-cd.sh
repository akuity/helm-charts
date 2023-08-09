#!/bin/bash
# Script to compare against upstream version for differences

set -euo pipefail

PROJECT_ROOT="$(cd "$(dirname ${BASH_SOURCE})/.."; pwd)"
chart_root="${PROJECT_ROOT}/charts/argo-cd"
upstream_version="$(grep appVersion "$chart_root/Chart.yaml" | awk '{print $2}')"

helm_tmpdir="$(mktemp -d 2>/dev/null || mktemp -d -t 'helm')"
helm dependency update "$chart_root" 2>&1 >/dev/null
helm template \
    --include-crds \
    --set global.image.repository=quay.io/argoproj/argocd \
    --set global.image.tag="v$upstream_version" \
    --set global.image.pullPolicy=Always \
    --namespace foo "$chart_root" | grep -v imagePullPolicy > "$helm_tmpdir/helm.yaml"

echo """
apiVersion: kustomize.config.k8s.io/v1beta1
kind: Kustomization

# purposely do not use namespace override in helm version. This will detect places where we forgot to set it to {{ .Release.Namespace }}
# namespace: foo

resources:
- helm.yaml

patches:
# kustomize namespace override will add the namespace to subjects. mimic this behavior
- target:
    kind: RoleBinding
  patch: |-
    - op: add
      path: /subjects/0/namespace
      value: foo
""" > "$helm_tmpdir/kustomization.yaml"

upstream_tmpdir="$(mktemp -d 2>/dev/null || mktemp -d -t 'upstream')"
echo """
apiVersion: kustomize.config.k8s.io/v1beta1
kind: Kustomization

namespace: foo

images:
- name: redis
  newName: quay.io/akuity/redis

resources:
- https://raw.githubusercontent.com/argoproj/argo-cd/v${upstream_version}/manifests/ha/install.yaml

patches:
- patch: |-
    apiVersion: v1
    kind: ConfigMap
    metadata:
      name: argocd-cm
    data:
      application.resourceTrackingMethod: annotation
- target:
    kind: ClusterRoleBinding
  patch: |-
    - op: replace
      path: /subjects/0/namespace
      value: foo

""" > "$upstream_tmpdir/kustomization.yaml"

diff_dir="$(mktemp -d 2>/dev/null || mktemp -d -t 'diff')"
kustomize build "$helm_tmpdir"     | grep -v "^data: null$"                           > "$diff_dir/helm_$upstream_version.yaml"
kustomize build "$upstream_tmpdir" | grep -v "^data: null$" | grep -v imagePullPolicy > "$diff_dir/upstream_$upstream_version.yaml"

echo "----------------------------------------------------------"
echo "Helm and upstream output is located in: $diff_dir"
echo "----------------------------------------------------------"

set -x
diff "$diff_dir/helm_$upstream_version.yaml" "$diff_dir/upstream_$upstream_version.yaml"
set +x
