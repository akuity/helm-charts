#!/bin/bash
# Script to compare against upstream version for differences

set -euo pipefail

PROJECT_ROOT=$(cd $(dirname ${BASH_SOURCE})/..; pwd)
chart_root="${PROJECT_ROOT}/charts/argo-workflows"
upstream_version=v$(grep appVersion ${chart_root}/Chart.yaml | awk '{print $2}')
akuity_version=v$(grep version charts/argo-workflows/Chart.yaml | awk '{print $2}' | cut -d"." -f1-4)

helm_tmpdir=$(mktemp -d 2>/dev/null || mktemp -d -t 'helm')
helm dependency update ${chart_root} 2>&1 >/dev/null
helm template \
    --include-crds \
    --namespace argo ${chart_root} | grep -v imagePullPolicy > $helm_tmpdir/helm.yaml

echo """
apiVersion: kustomize.config.k8s.io/v1beta1
kind: Kustomization

namespace: argo
resources:
- helm.yaml
""" > $helm_tmpdir/kustomization.yaml


upstream_tmpdir=$(mktemp -d 2>/dev/null || mktemp -d -t 'upstream')
echo """
apiVersion: kustomize.config.k8s.io/v1beta1
kind: Kustomization

namespace: argo
resources:
- https://github.com/argoproj/argo-workflows/releases/download/${upstream_version}/install.yaml

images:
- name: quay.io/argoproj/argoexec
  newName: quay.io/akuity/argoexec
  newTag: ${akuity_version}
- name: quay.io/argoproj/workflow-controller
  newName: quay.io/akuity/workflow-controller
  newTag: ${akuity_version}
- name: quay.io/argoproj/argocli
  newName: quay.io/akuity/argocli
  newTag: ${akuity_version}

""" > $upstream_tmpdir/kustomization.yaml

diff_dir=$(mktemp -d 2>/dev/null || mktemp -d -t 'diff')
echo "Helm template output is located in: $diff_dir/helm.yaml"
echo "Upstream output is located in: $diff_dir/upstream.yaml"

helm_out=$(kustomize build $helm_tmpdir > $diff_dir/helm.yaml)
upstream_out=$(kustomize build $upstream_tmpdir \
    | grep -v imagePullPolicy \
    | grep -v "^data: null$" \
    > $diff_dir/upstream.yaml)
diff $diff_dir/upstream.yaml $diff_dir/helm.yaml
