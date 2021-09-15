# Akuity Helm Charts

Akuity Helm is a collection of charts for Argo projects. The charts can be added using following command:

## User Installation

To install a published Helm Chart, run the following:

```
# Add/update Akuity Helm repository
helm repo add akuity https://akuityio.github.io/helm-builds
helm repo update

# Check available charts in the repo
helm search repo akuity

# Install Argo CD (latest version)
helm install akuity/argo-cd -n argo --generate-name

# Install Argo CD (specific version)
helm install akuity/argo-cd --version 0.0.8 -n argo --generate-name
```

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
helm install charts/argo-cd -n argo --generate-name
```


```
> NAME: argo-cd-1630429278
LAST DEPLOYED: Tue Aug 31 13:01:21 2021
NAMESPACE: argo
STATUS: deployed
REVISION: 1
TEST SUITE: None
```

Uninstalling Argo CD:

```
helm uninstall argo-cd-1630429278
```
