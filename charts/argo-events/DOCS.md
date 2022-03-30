# argo-events

![Version: 0.0.12](https://img.shields.io/badge/Version-0.0.12-informational?style=flat-square) ![AppVersion: 1.3.1](https://img.shields.io/badge/AppVersion-1.3.1-informational?style=flat-square)

A Helm chart to install Argo-Events in k8s Cluster

**Homepage:** <https://github.com/akuity/helm-charts>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| terrytangyuan |  |  |
| jessesuen |  |  |
| wanghong230 |  |  |

## Source Code

* <https://github.com/argoproj/argo-events>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| clusterRoles | object | `{"enabled":true}` | Installs necessary ClusterRoles to allow Argo Events to deploy to the same cluster Argo Events is installed in |
| eventbusController | object | `{"extraArgs":null,"image":{"pullPolicy":null,"repository":null,"tag":null},"replicas":1,"resources":null}` | Argo Event Bus configuration |
| eventbusController.extraArgs | string | `nil` | Additional command line arguments to pass |
| eventsourceController | object | `{"eventsourceImage":{"repository":null,"tag":null},"extraArgs":null,"image":{"pullPolicy":null,"repository":null,"tag":null},"replicas":1,"resources":null}` | Argo Event Source configuration |
| eventsourceController.extraArgs | string | `nil` | Additional command line arguments to pass |
| global.image.pullPolicy | string | `nil` | If defined, an image pull policy will be applied to all argo events deployments |
| global.image.repository | string | `"quay.io/argoproj/argo-events"` | If defined, a repository applied to all argo events deployments |
| global.image.tag | string | `"latest"` | If defined, a tag applied to all argo events deployments |
| sensorController | object | `{"extraArgs":null,"image":{"pullPolicy":null,"repository":null,"tag":null},"replicas":1,"resources":null,"sensorImage":{"repository":null,"tag":null}}` | Argo Sensor configuration |
| sensorController.extraArgs | string | `nil` | Additional command line arguments to pass |

