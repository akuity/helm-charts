# argo-workflows

![Version: 0.0.5](https://img.shields.io/badge/Version-0.0.5-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 3.1.8](https://img.shields.io/badge/AppVersion-3.1.8-informational?style=flat-square)

A Helm chart for Argo Workflows

**Homepage:** <https://github.com/argoproj/argo-helm>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| terrytangyuan |  |  |
| jessesuen |  |  |
| wanghong230 |  |  |

## Source Code

* <https://github.com/argoproj/argo-workflows>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| artifactRepository.archiveLogs | bool | `false` |  |
| artifactRepository.s3.accessKeySecret.key | string | `"accesskey"` |  |
| artifactRepository.s3.insecure | bool | `true` |  |
| artifactRepository.s3.secretKeySecret.key | string | `"secretkey"` |  |
| controller.affinity | object | `{}` |  |
| controller.clusterWorkflowTemplates.enabled | bool | `true` |  |
| controller.containerRuntimeExecutor | string | `"docker"` |  |
| controller.extraArgs | list | `[]` |  |
| controller.extraContainers | list | `[]` |  |
| controller.extraEnv | list | `[]` |  |
| controller.image.registry | string | `"quay.io"` |  |
| controller.image.repository | string | `"argoproj/workflow-controller"` |  |
| controller.image.tag | string | `""` |  |
| controller.instanceID.enabled | bool | `false` |  |
| controller.links | list | `[]` |  |
| controller.livenessProbe.failureThreshold | int | `3` |  |
| controller.livenessProbe.httpGet.path | string | `"/healthz"` |  |
| controller.livenessProbe.httpGet.port | int | `6060` |  |
| controller.livenessProbe.initialDelaySeconds | int | `90` |  |
| controller.livenessProbe.periodSeconds | int | `60` |  |
| controller.livenessProbe.timeoutSeconds | int | `30` |  |
| controller.loadBalancerSourceRanges | list | `[]` |  |
| controller.logging.globallevel | string | `"0"` |  |
| controller.logging.level | string | `"info"` |  |
| controller.metricsConfig.enabled | bool | `false` |  |
| controller.metricsConfig.path | string | `"/metrics"` |  |
| controller.metricsConfig.port | int | `9090` |  |
| controller.metricsConfig.servicePort | int | `8080` |  |
| controller.metricsConfig.servicePortName | string | `"metrics"` |  |
| controller.name | string | `"workflow-controller"` |  |
| controller.namespaceParallelism | string | `nil` |  |
| controller.nodeSelector."kubernetes.io/os" | string | `"linux"` |  |
| controller.parallelism | string | `nil` |  |
| controller.pdb.enabled | bool | `false` |  |
| controller.persistence | object | `{}` |  |
| controller.podAnnotations | object | `{}` |  |
| controller.podLabels | object | `{}` |  |
| controller.podSecurityContext | object | `{}` |  |
| controller.priorityClassName | string | `""` |  |
| controller.replicas | int | `1` |  |
| controller.resources | object | `{}` |  |
| controller.securityContext.allowPrivilegeEscalation | bool | `false` |  |
| controller.securityContext.capabilities.drop[0] | string | `"ALL"` |  |
| controller.securityContext.readOnlyRootFilesystem | bool | `true` |  |
| controller.securityContext.runAsNonRoot | bool | `true` |  |
| controller.serviceAccount.annotations | object | `{}` |  |
| controller.serviceAccount.create | bool | `true` |  |
| controller.serviceAccount.name | string | `""` |  |
| controller.serviceAnnotations | object | `{}` |  |
| controller.serviceLabels | object | `{}` |  |
| controller.serviceMonitor.additionalLabels | object | `{}` |  |
| controller.serviceMonitor.enabled | bool | `false` |  |
| controller.serviceType | string | `"ClusterIP"` |  |
| controller.telemetryConfig.enabled | bool | `false` |  |
| controller.telemetryConfig.path | string | `"/telemetry"` |  |
| controller.telemetryConfig.port | int | `8081` |  |
| controller.telemetryConfig.servicePort | int | `8081` |  |
| controller.telemetryConfig.servicePortName | string | `"telemetry"` |  |
| controller.tolerations | list | `[]` |  |
| controller.workflowDefaults | object | `{}` |  |
| controller.workflowNamespaces[0] | string | `"default"` |  |
| controller.workflowRestrictions | object | `{}` |  |
| createAggregateRoles | bool | `true` |  |
| executor.env | object | `{}` |  |
| executor.image.registry | string | `"quay.io"` |  |
| executor.image.repository | string | `"argoproj/argoexec"` |  |
| executor.image.tag | string | `""` |  |
| executor.resources | object | `{}` |  |
| executor.securityContext | object | `{}` |  |
| fullnameOverride | string | `nil` |  |
| images.pullPolicy | string | `"Always"` |  |
| images.pullSecrets | list | `[]` |  |
| kubeVersionOverride | string | `""` |  |
| nameOverride | string | `nil` |  |
| server.affinity | object | `{}` |  |
| server.baseHref | string | `"/"` |  |
| server.clusterWorkflowTemplates.enableEditing | bool | `true` |  |
| server.clusterWorkflowTemplates.enabled | bool | `true` |  |
| server.enabled | bool | `true` |  |
| server.extraArgs | list | `[]` |  |
| server.extraContainers | list | `[]` |  |
| server.extraEnv | list | `[]` |  |
| server.image.registry | string | `"quay.io"` |  |
| server.image.repository | string | `"argoproj/argocli"` |  |
| server.image.tag | string | `""` |  |
| server.ingress.annotations | object | `{}` |  |
| server.ingress.enabled | bool | `false` |  |
| server.ingress.extraPaths | list | `[]` |  |
| server.ingress.hosts | list | `[]` |  |
| server.ingress.https | bool | `false` |  |
| server.ingress.ingressClassName | string | `""` |  |
| server.ingress.labels | object | `{}` |  |
| server.ingress.pathType | string | `"Prefix"` |  |
| server.ingress.paths[0] | string | `"/"` |  |
| server.ingress.tls | list | `[]` |  |
| server.loadBalancerIP | string | `""` |  |
| server.loadBalancerSourceRanges | list | `[]` |  |
| server.name | string | `"server"` |  |
| server.nodeSelector."kubernetes.io/os" | string | `"linux"` |  |
| server.pdb.enabled | bool | `false` |  |
| server.podAnnotations | object | `{}` |  |
| server.podLabels | object | `{}` |  |
| server.podSecurityContext | object | `{}` |  |
| server.priorityClassName | string | `""` |  |
| server.replicas | int | `1` |  |
| server.resources | object | `{}` |  |
| server.secure | bool | `false` |  |
| server.securityContext.allowPrivilegeEscalation | bool | `false` |  |
| server.securityContext.capabilities.drop[0] | string | `"ALL"` |  |
| server.securityContext.readOnlyRootFilesystem | bool | `false` |  |
| server.securityContext.runAsNonRoot | bool | `true` |  |
| server.serviceAccount.annotations | object | `{}` |  |
| server.serviceAccount.create | bool | `true` |  |
| server.serviceAccount.name | string | `""` |  |
| server.serviceAnnotations | object | `{}` |  |
| server.serviceLabels | object | `{}` |  |
| server.servicePort | int | `2746` |  |
| server.serviceType | string | `"ClusterIP"` |  |
| server.sso | string | `nil` |  |
| server.tolerations | list | `[]` |  |
| server.volumeMounts | list | `[]` |  |
| server.volumes | list | `[]` |  |
| singleNamespace | bool | `false` |  |
| useDefaultArtifactRepo | bool | `false` |  |
| useStaticCredentials | bool | `true` |  |
| workflow.namespace | string | `nil` |  |
| workflow.rbac.create | bool | `true` |  |
| workflow.serviceAccount.annotations | object | `{}` |  |
| workflow.serviceAccount.create | bool | `false` |  |
| workflow.serviceAccount.name | string | `"argo-workflow"` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.5.0](https://github.com/norwoodj/helm-docs/releases/v1.5.0)
