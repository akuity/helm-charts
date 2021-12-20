#!/bin/bash
# Script to compare against upstream version for differences

PROJECT_ROOT=$(cd $(dirname ${BASH_SOURCE})/..; pwd)
upstream_version=master

mytmpdir=$(mktemp -d 2>/dev/null || mktemp -d -t 'mytmpdir')

helm template \
    --include-crds \
    --set global.image.repository=quay.io/argoproj/argocd \
    --set global.image.tag=latest \
    --namespace argocd $PROJECT_ROOT/charts/argo-workflows | grep -v imagePullPolicy > $mytmpdir/helm.yaml

echo """
apiVersion: kustomize.config.k8s.io/v1beta1
kind: Kustomization
resources:
- helm.yaml
""" > $mytmpdir/kustomization.yaml

helm_out=$(kustomize build $mytmpdir)

upstream_out=$(
    curl --silent https://raw.githubusercontent.com/argoproj/argo-workflows/${upstream_version}/manifests/install.yaml | \
    grep -v imagePullPolicy | \
    grep -v "This is an auto-generated file"
)

diff <(echo "$helm_out") <(echo "$upstream_out")
