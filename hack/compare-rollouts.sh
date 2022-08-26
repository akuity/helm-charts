#!/bin/bash
# Script to compare against upstream version for differences

set -euo pipefail

PROJECT_ROOT=$(cd $(dirname ${BASH_SOURCE})/..; pwd)
chart_root="${PROJECT_ROOT}/charts/argo-rollouts"
upstream_version=v$(grep appVersion ${chart_root}/Chart.yaml | awk '{print $2}')

helm_tmpdir="$(mktemp -d 2>/dev/null || mktemp -d -t 'helm')"

helm template \
    --include-crds=true \
    --set controller.image.repository=quay.io/argoproj/argo-rollouts \
    --set controller.image.tag=${upstream_version} \
    --set controller.image.pullPolicy=Always \
    --set dashboard.enabled=true \
    --set dashboard.image.repository=quay.io/argoproj/kubectl-argo-rollouts \
    --set dashboard.image.tag=${upstream_version} \
    --set dashboard.image.pullPolicy=Always \
    --set notifications.enabled=true \
    --namespace argo-rollouts ${chart_root} > $helm_tmpdir/helm.yaml

echo """
apiVersion: kustomize.config.k8s.io/v1beta1
kind: Kustomization
resources:
- helm.yaml
""" > $helm_tmpdir/kustomization.yaml

upstream_tmpdir="$(mktemp -d 2>/dev/null || mktemp -d -t 'upstream')"
echo """
apiVersion: kustomize.config.k8s.io/v1beta1
kind: Kustomization

namespace: argo-rollouts
resources:
- https://github.com/argoproj/argo-rollouts/releases/download/${upstream_version}/install.yaml
- https://github.com/argoproj/argo-rollouts/releases/download/${upstream_version}/dashboard-install.yaml
- https://github.com/argoproj/argo-rollouts/releases/download/${upstream_version}/notifications-install.yaml
""" > "$upstream_tmpdir/kustomization.yaml"

diff_dir="$(mktemp -d 2>/dev/null || mktemp -d -t 'diff')"
kustomize build "$helm_tmpdir"     | grep -v "^data: null$"  > "$diff_dir/helm.yaml"
kustomize build "$upstream_tmpdir" | grep -v "^data: null$"  > "$diff_dir/upstream.yaml"

diff "$diff_dir/upstream.yaml" "$diff_dir/helm.yaml" && echo "No diff"

echo "Helm template output is located in: $diff_dir/helm.yaml"
echo "Upstream output is located in: $diff_dir/upstream.yaml"
