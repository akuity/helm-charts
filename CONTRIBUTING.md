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

Installing Argo CD with k3d and Helm:

```
$ k3d cluster create argo-helm -a 3
$ kubectl create ns argocd
$ helm install argo-cd charts/argo-cd -n argocd
...
> NAME: argo-cd
LAST DEPLOYED: Thu Jul 14 18:29:32 2022
NAMESPACE: argocd
STATUS: deployed
REVISION: 1
TEST SUITE: None
NOTES:

$ kubectl get pods -n argocd
NAME                                       READY   STATUS    RESTARTS   AGE
argocd-redis-ha-haproxy-5b75bb98dc-2vgvp   1/1     Running   0          5m47s
argocd-redis-ha-haproxy-5b75bb98dc-hmrb5   1/1     Running   0          5m47s
argocd-redis-ha-haproxy-5b75bb98dc-kvhq8   1/1     Running   0          5m47s
argocd-redis-ha-server-0                   2/2     Running   0          5m47s
argocd-repo-server-779b547c5f-ffsfq        1/1     Running   0          5m47s
argocd-dex-server-6574d6b46b-7n8ms         1/1     Running   0          5m47s
argocd-repo-server-779b547c5f-j9l5t        1/1     Running   0          5m47s
argocd-application-controller-0            1/1     Running   0          5m47s
argocd-server-58b75bdd9c-b8brr             1/1     Running   0          5m47s
argocd-server-58b75bdd9c-g92bm             1/1     Running   0          5m47s
argocd-redis-ha-server-1                   2/2     Running   0          4m15s
argocd-redis-ha-server-2                   2/2     Running   0          2m59s

$ helm uninstall argo-cd
```

Installing Argo CD with k3d and chart-testing:

```
k3d cluster create argo-helm -a 3
ct install --config ./.github/configs/ct-install.yaml
..
Creating namespace 'argo-cd-ygkz4nt0fq'...
namespace/argo-cd-ygkz4nt0fq created
...
Deleting namespace 'argo-cd-ygkz4nt0fq'...
namespace "argo-cd-ygkz4nt0fq" deleted
..
Namespace 'argo-cd-ygkz4nt0fq' terminated.
------------------------------------------------------------------------------------------------------------------------
 ✔︎ argo-cd => (version: "2.4.7-ak.0.0", path: "charts/argo-cd")
------------------------------------------------------------------------------------------------------------------------
All charts installed successfully
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
