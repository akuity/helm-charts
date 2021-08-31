# Akuity Helm Charts

Akuity Helm is a collection of charts for Argo projects. The charts can be added using following command:

```
# TODO: Need a site to host
helm repo add argo https://akuityio.github.io/helm-builds
```

## Testing


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
