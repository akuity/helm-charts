#!/bin/bash
# Script to compare against upstream version for differences

PROJECT_ROOT=$(cd $(dirname ${BASH_SOURCE})/..; pwd)
chart_root="${PROJECT_ROOT}/charts/argocd-image-updater"
upstream_version=v$(grep appVersion ${chart_root}/Chart.yaml | awk '{print $2}')

mytmpdir=$(mktemp -d 2>/dev/null || mktemp -d -t 'mytmpdir')

helm dependency update ${chart_root} 2>&1 >/dev/null
helm template \
    --include-crds \
    --set global.image.repository=argoprojlabs/argocd-image-updater \
    --set global.image.tag=${upstream_version} \
    --namespace argocd ${chart_root} | grep -v imagePullPolicy > $mytmpdir/helm.yaml

echo "Helm template output is located in: $mytmpdir"

echo """
apiVersion: kustomize.config.k8s.io/v1beta1
kind: Kustomization
resources:
- helm.yaml
""" > $mytmpdir/kustomization.yaml

helm_out=$(kustomize build $mytmpdir)

upstream_out=$(
    curl --silent https://raw.githubusercontent.com/argoproj-labs/argocd-image-updater/${upstream_version}/manifests/install.yaml | \
    grep -v imagePullPolicy | \
    grep -v "This is an auto-generated file"
)

diff <(echo "$helm_out") <(echo "$upstream_out")
