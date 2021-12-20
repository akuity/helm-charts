# Contributing

## Local Development and Testing

### Pre-commit Hook and Lint Checks

We use [helm-docs](https://github.com/norwoodj/helm-docs) to automatically generate reference for the charts and we use a [pre-commit](https://pre-commit.com/) hook to make sure we always update the docs when there are any changes in `values.yaml`.

To install `pre-commit`, run:

```
brew install pre-commit
pre-commit install
```

Install the lint checker tools via `brew install chart-testing yamllint` and then run:

```
ct lint --debug --config ./.github/configs/ct-lint.yaml --lint-conf ./.github/configs/lintconf.yaml
```

### Argo CD

Installing dependencies first:

```
cd charts/argo-cd
helm dependency update
```

Installing Argo CD:
```
cd -
helm install argo-cd charts/argo-cd -n argocd
```


```
> NAME: argo-cd
LAST DEPLOYED: Tue Aug 31 13:01:21 2021
NAMESPACE: argo
STATUS: deployed
REVISION: 1
TEST SUITE: None
```

Uninstalling Argo CD:

```
helm uninstall argo-cd
```

### Argo Workflows

Installing Argo Workflows:

```
helm install argo-workflows charts/argo-workflows -n argo
```

```
> NAME: argo-workflows
LAST DEPLOYED: Mon Dec 13 15:59:15 2021
NAMESPACE: argo
STATUS: deployed
REVISION: 1
TEST SUITE: None
NOTES:
1. Get Argo Server external IP/domain by running:

kubectl --namespace argo get services -o wide | grep argo-server

2. Submit the hello-world workflow by running:

argo submit https://raw.githubusercontent.com/argoproj/argo-workflows/master/examples/hello-world.yaml --watch
```

Accessing UI via https://localhost:2746/:
```
kubectl port-forward svc/argo-server 2746:2746 -n argo
```

Uninstalling Argo Workflows:

```
helm uninstall argo-workflows
```
