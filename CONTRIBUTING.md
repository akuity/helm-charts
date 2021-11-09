# Contributing

## Local Development and Testing

### Pre-commit Hook

We use [helm-docs](https://github.com/norwoodj/helm-docs) to automatically generate reference for the charts and we use a [pre-commit](https://pre-commit.com/) hook to make sure we always update the docs when there are any changes in `values.yaml`.

To install `pre-commit`, run:

```
brew install pre-commit
pre-commit install
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
helm install argo-cd charts/argo-cd -n argo
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
