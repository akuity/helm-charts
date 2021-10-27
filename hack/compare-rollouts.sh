#!/bin/bash
# Script to compare against upstream version for differences

PROJECT_ROOT=$(cd $(dirname ${BASH_SOURCE})/..; pwd)
upstream_version=master

mytmpdir=$(mktemp -d 2>/dev/null || mktemp -d -t 'mytmpdir')

helm template \
    --include-crds=true \
    --set controller.image.repository=quay.io/argoproj/argo-rollouts \
    --set controller.image.tag=latest \
    --set controller.image.pullPolicy=Always \
    --set dashboard.image.repository=quay.io/argoproj/kubectl-argo-rollouts \
    --set dashboard.image.tag=latest \
    --set dashboard.image.pullPolicy=Always \
    --namespace argo-rollouts $PROJECT_ROOT/charts/argo-rollouts > $mytmpdir/helm.yaml

echo """
apiVersion: kustomize.config.k8s.io/v1beta1
kind: Kustomization
resources:
- helm.yaml
""" > $mytmpdir/kustomization.yaml

echo $mytmpdir
helm_out=$(kustomize build $mytmpdir)

upstream_out=$(
    curl --silent https://raw.githubusercontent.com/argoproj/argo-rollouts/${upstream_version}/manifests/install.yaml | \
    grep -v "This is an auto-generated file"
)

diff <(echo "$helm_out") <(echo "$upstream_out")
