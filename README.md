# Akuity Helm Charts

Akuity Helm is a collection of charts for Argo projects. The charts can be added using following command:

## User Installation

To install a published Helm Chart, run the following:

```
helm repo add akuity https://akuityio.github.io/helm-builds
helm install akuity/argo-cd -n argo --generate-name
```

## Local Development and Testing

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
