# Akuity Helm Charts

Akuity Helm is a collection of charts for Argo projects. The charts can be added using following command:

## User Installation

To install a published Helm Chart, run the following:

```
# Add/update Akuity Helm repository
helm repo add akuity https://charts.akuity.io
helm repo update

# Check available charts in the repo
helm search repo akuity

# Install Argo CD (latest version)
helm install argo-cd akuity/argo-cd -n argocd

# Install Argo CD (specific version)
helm install argo-cd akuity/argo-cd --version 0.0.9 -n argocd
```

Port-forwarding Argo CD UI and API server:
```
kubectl port-forward svc/argocd-server -n argocd 8080:443
```

Login [localhost:8080](localhost:8080) via username `admin` and the auto-generated password accessed via the following:
```
kubectl -n argo get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d
```

To uninstall Argo CD, run the following:
```
helm uninstall argo-cd
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
