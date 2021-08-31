# Akuity Helm Charts

Akuity Helm is a collection of charts for Argo projects. The charts can be added using following command:

```
# TODO: Need a site to host
helm repo add argo https://akuityio.github.io/helm-builds
```

## Testing


### Argo CD

```
helm repo add redis-ha https://dandydeveloper.github.io/charts/
helm dependency update # TODO: Error: Chart.yaml file is missing
```

```
helm install charts/argo-cd -n argo --generate-name
helm uninstall argo-cd-xxxx
```
