# Akuity Helm Charts

Akuity Helm Charts are a collection of simplified and opinionated Helm charts for the Argo and Argo Ecosystem projects. They are written and intended to be used in a GitOps workflow, where the Helm `values.yaml` and other customizations are stored in git, with last-mile modifications handled using kustomize's built-in [helm chart support](https://github.com/kubernetes-sigs/kustomize/blob/master/examples/chart.md).

## About

The goal of these charts are to remain as close as possible to the official upstream Argo install manifests (which are released and maintained as raw YAML files) and avoid the divergence that occurred with the Argoproj community maintained Helm charts. The Akuity charts also contain additional options to implement best practices as well as convenience options for common configurations.

These charts have been designed to be deployed from a git repo using Argo CD / kubectl apply, as opposed to `helm install`. Helm is used for packaging and templating, rather than lifecycle management of the apps.

## Why this approach?

Typical Helm charts provide dozens, sometimes hundreds of parameters to handle all conceivable options which the chart authors anticipate users might want to customize for their environment. For example, it is common to parameterize resource names, resource quotas, command line parameters, annotations, affinity rules, Ingress, prometheus stats, etc. Over time, the chart becomes unmaintainable and diverges from the official supported manifests. Additionally, helm charts have no ability to add additional resources which were not part of original chart (e.g. SealedSecrets, ExternalSecrets, alternative Ingress resources), which is a common requirement.

With the realization that there is no "one size fits all" set of install options, these charts take a different approach to Helm charts. Rather than parameterize all the options for every use case, these charts choose to only parameterize the commonly used options and leave last-mile modifications to be handled using kustomize. This keeps the charts simpler to maintain, and more accurate to the upstream manifests.

## Usage

### Initial Argo CD Installation

It is recommended and encouraged to use Argo CD to manage itself using GitOps. But before Argo CD can manage itself, Argo CD itself needs to be installed. To resolve this chicken-and-egg problem for the initial Argo CD installation, you can install Argo CD using normal `kubectl apply`:

```shell
kustomize build --enable-helm https://github.com/akuity/helm-charts//docs/argo-cd-install | kubectl apply -n argocd -f -
```

The default installation will install into the `argocd` namespace. If you wish to change this, see the instructions in [docs/argo-cd-install](docs/argo-cd-install).

### Managing Argo CD with Git

Once installed, you will likely want to customize Argo CD for your environment and use git to manage your changes. The following example install can be seen at [docs/argo-cd-example](docs/argo-cd-example). Create a directory in your own git repo with the following files:

```
.
├── kustomization.yaml
└── values.yaml
```

`kustomization.yaml`
```yaml
apiVersion: kustomize.config.k8s.io/v1beta1
kind: Kustomization

helmCharts:
- name: argo-cd
  repo: https://charts.akuity.io
  includeCRDs: true
  namespace: argocd
  version: 1.0.2            # pin to a specific version (see charts/argo-cd/Chart.yaml)
  valuesFile: values.yaml   # Helm values file in your git repo
```

Here might be a typical `values.yaml`:

`values.yaml`
```yaml
config:
  argocd:
    url: https://cd.example.com
    dex.config: |
      connectors:
      - type: github
        id: github
        name: GitHub
        config:
          clientID: $dex.github.clientID
          clientSecret: $dex.github.clientSecret
          orgs:
          - name: example-org
          teamNameField: slug
          useLoginAsID: true
    kustomize.buildOptions: --enable-helm
  rbac:
    policy.csv: |
      g, example-org:example-team, role:admin
    policy.default: role:readonly

server:
  insecure: true
  ingress:
    enabled: true
    className: contour
    host: cd.example.com
```

For other available Chart parameters see: [charts/argo-cd/values.yaml](charts/argo-cd/values.yaml).

## Last-mile Modifications

Since the Helm chart parameters will likely not contain all the parameterization options necessary for your environment, you will use kustomize to perform last-mile modifications to your installation. 

Using this approach, you can also use kustomize's `patchesStrategicMerge` field and put the configuration in patches instead of `values.yaml`. The following example manages the configuration as separate kubernetes objects instead of inlined fields in `values.yaml`. Additional resources can be added using the `resources` field:

`kustomization.yaml`:
```yaml
patchesStrategicMerge:
- argocd-cm.yaml

resources:
- argocd-ingress.yaml
```

`argocd-cm.yaml`:
```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: argocd-cmd-params-cm
data:
  url: https://cd.example.com
  kustomize.buildOptions: --enable-helm
```

`argocd-ingress.yaml`:
```yaml
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: argocd-server
...
```

For all Argo CD configuration options please refer the Argo CD documentation:
* [argocd-cm.yaml](https://github.com/argoproj/argo-cd/blob/master/docs/operator-manual/argocd-cm.yaml)
* [argocd-rbac-cm.yaml](https://github.com/argoproj/argo-cd/blob/master/docs/operator-manual/argocd-rbac-cm.yaml)
* [argocd-cmd-params-cm.yaml](https://github.com/argoproj/argo-cd/blob/master/docs/operator-manual/argocd-cmd-params-cm.yaml)
