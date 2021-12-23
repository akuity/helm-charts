#!/bin/bash
# Script to compare against upstream version for differences

PROJECT_ROOT=$(cd $(dirname ${BASH_SOURCE})/..; pwd)
chart_root="${PROJECT_ROOT}/charts/argo-rollouts"
upstream_version=v$(grep appVersion ${chart_root}/Chart.yaml | awk '{print $2}')

mytmpdir=$(mktemp -d 2>/dev/null || mktemp -d -t 'mytmpdir')

helm template \
    --include-crds=true \
    --set controller.image.repository=quay.io/argoproj/argo-rollouts \
    --set controller.image.tag=${upstream_version} \
    --set controller.image.pullPolicy=Always \
    --set dashboard.image.repository=quay.io/argoproj/kubectl-argo-rollouts \
    --set dashboard.image.tag=${upstream_version} \
    --set dashboard.image.pullPolicy=Always \
    --namespace argo-rollouts ${chart_root} > $mytmpdir/helm.yaml

echo """
apiVersion: kustomize.config.k8s.io/v1beta1
kind: Kustomization
resources:
- helm.yaml
""" > $mytmpdir/kustomization.yaml

echo $mytmpdir
helm_out=$(kustomize build $mytmpdir)

upstream_out=$(
    curl -L --silent https://github.com/argoproj/argo-rollouts/releases/download/${upstream_version}/install.yaml | \
    grep -v "This is an auto-generated file"
)

diff <(echo "$helm_out") <(echo "$upstream_out")
