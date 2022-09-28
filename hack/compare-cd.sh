#!/bin/bash
# Script to compare against upstream version for differences

set -euo pipefail

PROJECT_ROOT="$(cd "$(dirname ${BASH_SOURCE})/.."; pwd)"
chart_root="${PROJECT_ROOT}/charts/argo-cd"
upstream_version="v$(grep appVersion "$chart_root/Chart.yaml" | awk '{print $2}')"

helm_tmpdir="$(mktemp -d 2>/dev/null || mktemp -d -t 'helm')"
helm dependency update "$chart_root" 2>&1 >/dev/null
helm template \
    --include-crds \
    --set global.image.repository=quay.io/argoproj/argocd \
    --set global.image.tag="$upstream_version" \
    --set global.image.pullPolicy=Always \
    --set notificationsController.enabled=true \
    --set applicationsetController.enabled=true \
    --namespace argocd "$chart_root" | grep -v imagePullPolicy > "$helm_tmpdir/helm.yaml"

echo """
apiVersion: kustomize.config.k8s.io/v1beta1
kind: Kustomization

namespace: argocd
resources:
- helm.yaml
# Dropping our data (application.resourceTrackingMethod: annotation) from the argocd-cm ConfigMap before the diff
patchesJson6902:
- target:
    version: v1
    kind: ConfigMap
    name: argocd-cm
  patch: |-
    - op: replace
      path: /data
""" > "$helm_tmpdir/kustomization.yaml"

upstream_tmpdir="$(mktemp -d 2>/dev/null || mktemp -d -t 'upstream')"
echo """
apiVersion: kustomize.config.k8s.io/v1beta1
kind: Kustomization

namespace: argocd
resources:
- https://raw.githubusercontent.com/argoproj/argo-cd/${upstream_version}/manifests/ha/install.yaml
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
