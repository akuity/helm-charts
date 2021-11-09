# Argo CD Initial Install

This kustomization is used for an initial vanilla install of Argo CD using Akuity helm chart. It is installed using the following command:

```shell
kustomize build --enable-helm https://github.com/akuity/helm-charts//docs/argo-cd-install | kubectl apply -n argocd -f -
```

If you wish to change the version which is installed, or the namespace, you will need to clone the repo and edit the `kustomization.yaml`

```shell
git clone https://github.com/akuity/helm-charts
cd docs/argo-cd-install
# modify kustomization.yaml
```

```yaml
helmCharts:
- name: argo-cd
  repo: https://charts.akuity.io
  includeCRDs: true
  valuesFile: values.yaml
  namespace: argocd  # modify to different namespace
  # version: 0.0.20  # pin to specific version
```

Once modified run kustomize build from your local workspace to apply the changes:

```shell
kustomize build --enable-helm . | kubectl apply -n argocd -f -
```
