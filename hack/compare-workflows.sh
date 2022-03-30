#!/bin/bash
# Script to compare against upstream version for differences

PROJECT_ROOT=$(cd $(dirname ${BASH_SOURCE})/..; pwd)
chart_root="${PROJECT_ROOT}/charts/argo-workflows"
upstream_version=v$(grep appVersion ${chart_root}/Chart.yaml | awk '{print $2}')

helm_tmpdir=$(mktemp -d 2>/dev/null || mktemp -d -t 'helm')
helm dependency update ${chart_root} 2>&1 >/dev/null
helm template \
    --include-crds \
    --set controller.image.repository=quay.io/argoproj/workflow-controller \
    --set executor.image.repository=quay.io/argoproj/argoexec \
    --set server.image.repository=quay.io/argoproj/argocli \
    --set global.image.tag=${upstream_version} \
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
""" > $upstream_tmpdir/kustomization.yaml


diff_dir=$(mktemp -d 2>/dev/null || mktemp -d -t 'diff')
helm_out=$(kustomize build $helm_tmpdir > $diff_dir/helm.yaml)
upstream_out=$(kustomize build $upstream_tmpdir \
    | grep -v imagePullPolicy \
    | grep -v "^data: null$" \
    > $diff_dir/upstream.yaml)
diff $diff_dir/upstream.yaml $diff_dir/helm.yaml

echo "Helm template output is located in: $diff_dir/helm.yaml"
echo "Upstream output is located in: $diff_dir/upstream.yaml"
