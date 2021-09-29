# argo-cd

![Version: 0.0.11](https://img.shields.io/badge/Version-0.0.11-informational?style=flat-square) ![AppVersion: 2.1.1](https://img.shields.io/badge/AppVersion-2.1.1-informational?style=flat-square)

A Helm chart for ArgoCD, a declarative, GitOps continuous delivery tool for Kubernetes.

**Homepage:** <https://github.com/akuity/helm-builds>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| terrytangyuan | terrytangyuan@gmail.com |  |
| jessesuen |  |  |
| wanghong230 |  |  |

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://dandydeveloper.github.io/charts/ | redis-ha | 4.12.17 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| apiVersionOverrides.certmanager | string | `""` | String to override apiVersion of certmanager resources rendered by this helm chart |
| apiVersionOverrides.ingress | string | `""` | String to override apiVersion of ingresses rendered by this helm chart |
| configs | object | `{"clusterCredentials":[],"credentialTemplates":{},"gpgKeys":{},"gpgKeysAnnotations":{},"knownHosts":{"data":{"ssh_known_hosts":"bitbucket.org ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAubiN81eDcafrgMeLzaFPsw2kNvEcqTKl/VqLat/MaB33pZy0y3rJZtnqwR2qOOvbwKZYKiEO1O6VqNEBxKvJJelCq0dTXWT5pbO2gDXC6h6QDXCaHo6pOHGPUy+YBaGQRGuSusMEASYiWunYN0vCAI8QaXnWMXNMdFP3jHAJH0eDsoiGnLPBlBp4TNm6rYI74nMzgz3B9IikW4WVK+dc8KZJZWYjAuORU3jc1c/NPskD2ASinf8v3xnfXeukU0sJ5N6m5E8VLjObPEO+mN2t/FZTMZLiFqPWc/ALSqnMnnhwrNi2rbfg/rd/IpL8Le3pSBne8+seeFVBoGqzHM9yXw==\ngithub.com ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAq2A7hRGmdnm9tUDbO9IDSwBK6TbQa+PXYPCPy6rbTrTtw7PHkccKrpp0yVhp5HdEIcKr6pLlVDBfOLX9QUsyCOV0wzfjIJNlGEYsdlLJizHhbn2mUjvSAHQqZETYP81eFzLQNnPHt4EVVUh7VfDESU84KezmD5QlWpXLmvU31/yMf+Se8xhHTvKSCZIFImWwoG6mbUoWf9nzpIoaSjB+weqqUUmpaaasXVal72J+UX2B+2RPW3RcT0eOzQgqlJL3RKrTJvdsjE3JEAvGq3lGHSZXy28G3skua2SmVi/w4yCE6gbODqnTWlg7+wC604ydGXA8VJiS5ap43JXiUFFAaQ==\ngitlab.com ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBFSMqzJeV9rUzU4kWitGjeR4PWSa29SPqJ1fVkhtj3Hw9xjLVXVYrU9QlYWrOLXBpQ6KWjbjTDTdDkoohFzgbEY=\ngitlab.com ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAfuCHKVTjquxvt6CM6tdG4SLp1Btn/nOeHHE5UOzRdf\ngitlab.com ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCsj2bNKTBSpIYDEGk9KxsGh3mySTRgMtXL583qmBpzeQ+jqCMRgBqB98u3z++J1sKlXHWfM9dyhSevkMwSbhoR8XIq/U0tCNyokEi/ueaBMCvbcTHhO7FcwzY92WK4Yt0aGROY5qX2UKSeOvuP4D6TPqKF1onrSzH9bx9XUf2lEdWT/ia1NEKjunUqu1xOB/StKDHMoX4/OKyIzuS0q/T1zOATthvasJFoPrAjkohTyaDUz2LN5JoH839hViyEG82yB+MjcFV5MU3N1l1QL3cVUCh93xSaua1N85qivl+siMkPGbO5xR/En4iEY6K2XPASUEMaieWVNTRCtJ4S8H+9\nssh.dev.azure.com ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC7Hr1oTWqNqOlzGJOfGJ4NakVyIzf1rXYd4d7wo6jBlkLvCA4odBlL0mDUyZ0/QUfTTqeu+tm22gOsv+VrVTMk6vwRU75gY/y9ut5Mb3bR5BV58dKXyq9A9UeB5Cakehn5Zgm6x1mKoVyf+FFn26iYqXJRgzIZZcZ5V6hrE0Qg39kZm4az48o0AUbf6Sp4SLdvnuMa2sVNwHBboS7EJkm57XQPVU3/QpyNLHbWDdzwtrlS+ez30S3AdYhLKEOxAG8weOnyrtLJAUen9mTkol8oII1edf7mWWbWVf0nBmly21+nZcmCTISQBtdcyPaEno7fFQMDD26/s0lfKob4Kw8H\nvs-ssh.visualstudio.com ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC7Hr1oTWqNqOlzGJOfGJ4NakVyIzf1rXYd4d7wo6jBlkLvCA4odBlL0mDUyZ0/QUfTTqeu+tm22gOsv+VrVTMk6vwRU75gY/y9ut5Mb3bR5BV58dKXyq9A9UeB5Cakehn5Zgm6x1mKoVyf+FFn26iYqXJRgzIZZcZ5V6hrE0Qg39kZm4az48o0AUbf6Sp4SLdvnuMa2sVNwHBboS7EJkm57XQPVU3/QpyNLHbWDdzwtrlS+ez30S3AdYhLKEOxAG8weOnyrtLJAUen9mTkol8oII1edf7mWWbWVf0nBmly21+nZcmCTISQBtdcyPaEno7fFQMDD26/s0lfKob4Kw8H\n"}},"knownHostsAnnotations":{},"repositories":{},"repositoryCredentials":{},"secret":{"annotations":{},"argocdServerTlsConfig":{},"bitbucketServerSecret":"","bitbucketUUID":"","createSecret":true,"extra":{},"githubSecret":"","gitlabSecret":"","gogsSecret":""},"tlsCerts":{},"tlsCertsAnnotations":{}}` | Argo Configs |
| configs.clusterCredentials | list | `[]` | Provide one or multiple [external cluster credentials](https://argoproj.github.io/argo-cd/operator-manual/declarative-setup/#clusters) |
| configs.gpgKeys | object | `{}` | [GnuPG](https://argoproj.github.io/argo-cd/user-guide/gpg-verification/) keys to add to the key ring |
| configs.gpgKeysAnnotations | object | `{}` | GnuPG key ring annotations |
| configs.knownHosts.data.ssh_known_hosts | string | `"bitbucket.org ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAubiN81eDcafrgMeLzaFPsw2kNvEcqTKl/VqLat/MaB33pZy0y3rJZtnqwR2qOOvbwKZYKiEO1O6VqNEBxKvJJelCq0dTXWT5pbO2gDXC6h6QDXCaHo6pOHGPUy+YBaGQRGuSusMEASYiWunYN0vCAI8QaXnWMXNMdFP3jHAJH0eDsoiGnLPBlBp4TNm6rYI74nMzgz3B9IikW4WVK+dc8KZJZWYjAuORU3jc1c/NPskD2ASinf8v3xnfXeukU0sJ5N6m5E8VLjObPEO+mN2t/FZTMZLiFqPWc/ALSqnMnnhwrNi2rbfg/rd/IpL8Le3pSBne8+seeFVBoGqzHM9yXw==\ngithub.com ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAq2A7hRGmdnm9tUDbO9IDSwBK6TbQa+PXYPCPy6rbTrTtw7PHkccKrpp0yVhp5HdEIcKr6pLlVDBfOLX9QUsyCOV0wzfjIJNlGEYsdlLJizHhbn2mUjvSAHQqZETYP81eFzLQNnPHt4EVVUh7VfDESU84KezmD5QlWpXLmvU31/yMf+Se8xhHTvKSCZIFImWwoG6mbUoWf9nzpIoaSjB+weqqUUmpaaasXVal72J+UX2B+2RPW3RcT0eOzQgqlJL3RKrTJvdsjE3JEAvGq3lGHSZXy28G3skua2SmVi/w4yCE6gbODqnTWlg7+wC604ydGXA8VJiS5ap43JXiUFFAaQ==\ngitlab.com ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBFSMqzJeV9rUzU4kWitGjeR4PWSa29SPqJ1fVkhtj3Hw9xjLVXVYrU9QlYWrOLXBpQ6KWjbjTDTdDkoohFzgbEY=\ngitlab.com ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAfuCHKVTjquxvt6CM6tdG4SLp1Btn/nOeHHE5UOzRdf\ngitlab.com ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCsj2bNKTBSpIYDEGk9KxsGh3mySTRgMtXL583qmBpzeQ+jqCMRgBqB98u3z++J1sKlXHWfM9dyhSevkMwSbhoR8XIq/U0tCNyokEi/ueaBMCvbcTHhO7FcwzY92WK4Yt0aGROY5qX2UKSeOvuP4D6TPqKF1onrSzH9bx9XUf2lEdWT/ia1NEKjunUqu1xOB/StKDHMoX4/OKyIzuS0q/T1zOATthvasJFoPrAjkohTyaDUz2LN5JoH839hViyEG82yB+MjcFV5MU3N1l1QL3cVUCh93xSaua1N85qivl+siMkPGbO5xR/En4iEY6K2XPASUEMaieWVNTRCtJ4S8H+9\nssh.dev.azure.com ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC7Hr1oTWqNqOlzGJOfGJ4NakVyIzf1rXYd4d7wo6jBlkLvCA4odBlL0mDUyZ0/QUfTTqeu+tm22gOsv+VrVTMk6vwRU75gY/y9ut5Mb3bR5BV58dKXyq9A9UeB5Cakehn5Zgm6x1mKoVyf+FFn26iYqXJRgzIZZcZ5V6hrE0Qg39kZm4az48o0AUbf6Sp4SLdvnuMa2sVNwHBboS7EJkm57XQPVU3/QpyNLHbWDdzwtrlS+ez30S3AdYhLKEOxAG8weOnyrtLJAUen9mTkol8oII1edf7mWWbWVf0nBmly21+nZcmCTISQBtdcyPaEno7fFQMDD26/s0lfKob4Kw8H\nvs-ssh.visualstudio.com ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC7Hr1oTWqNqOlzGJOfGJ4NakVyIzf1rXYd4d7wo6jBlkLvCA4odBlL0mDUyZ0/QUfTTqeu+tm22gOsv+VrVTMk6vwRU75gY/y9ut5Mb3bR5BV58dKXyq9A9UeB5Cakehn5Zgm6x1mKoVyf+FFn26iYqXJRgzIZZcZ5V6hrE0Qg39kZm4az48o0AUbf6Sp4SLdvnuMa2sVNwHBboS7EJkm57XQPVU3/QpyNLHbWDdzwtrlS+ez30S3AdYhLKEOxAG8weOnyrtLJAUen9mTkol8oII1edf7mWWbWVf0nBmly21+nZcmCTISQBtdcyPaEno7fFQMDD26/s0lfKob4Kw8H\n"` | Known Hosts |
| configs.knownHostsAnnotations | object | `{}` | Known Hosts configmap annotations |
| configs.repositoryCredentials | object | `{}` | DEPRECATED: Creates a secret with optional repository credentials. Instead, use configs.credentialTemplates and/or configs.repositories |
| configs.secret.annotations | object | `{}` | Annotations to be added to argocd-secret |
| configs.secret.bitbucketServerSecret | string | `""` | BitBucket incoming webhook secret  |
| configs.secret.createSecret | bool | `true` | Whether to create the argocd-secret |
| configs.secret.extra | object | `{}` | Add additional secrets to be added to argocd-secret. Useful for injecting SSO secrets into environment variables. Note that all values must be non-empty. Ref: https://argoproj.github.io/argo-cd/operator-manual/sso/.  |
| configs.secret.gitlabSecret | string | `""` | GitLab incoming webhook secret |
| configs.tlsCerts | object | `{}` | TLS certificate |
| configs.tlsCertsAnnotations | object | `{}` | TLS certificate configmap annotations |
| controller.affinity | object | `{}` | [Assign custom affinity rules to the deployment](https://kubernetes.io/docs/concepts/configuration/assign-pod-node/) |
| controller.args | object | `{"appResyncPeriod":"180","operationProcessors":"10","repoServerTimeoutSeconds":"60","selfHealTimeout":"5","statusProcessors":"20"}` | Argo controller commandline flags |
| controller.args.appResyncPeriod | string | `"180"` | Define the controller `--app-resync` |
| controller.args.operationProcessors | string | `"10"` | Define the controller `--operation-processors` |
| controller.args.selfHealTimeout | string | `"5"` | Define the controller `--self-heal-timeout-seconds` |
| controller.args.statusProcessors | string | `"20"` | Define the controller `--status-processors` |
| controller.clusterAdminAccess.enabled | bool | `true` | Enable RBAC for local cluster deployments if you would like to grant rights to ArgoCD to deploy to the local Kubernetes cluster. |
| controller.clusterRoleRules | object | `{"enabled":false,"rules":[]}` | Enable Custom Rules for the Application Controller's Cluster Role resource. Enable this and set the rules: to whatever custom rules you want for the Cluster Role resource. |
| controller.containerPort | int | `8082` | Controller listening port |
| controller.containerSecurityContext | object | `{}` | Labels to set container specific security contexts |
| controller.enableStatefulSet | bool | `false` | Deploy the application as a StatefulSet instead of a Deployment, this is required for HA capability. This is a feature flag that will become the default in chart version 3.x |
| controller.env | list | `[]` | Environment variables to pass to argocd-controller |
| controller.envFrom | list | `[]` | envFrom to pass to argocd-controller |
| controller.extraArgs | list | `[]` | Additional command line arguments to pass to argocd-controller |
| controller.image.imagePullPolicy | string | `nil` |  |
| controller.image.repository | string | `nil` |  |
| controller.image.tag | string | `nil` |  |
| controller.livenessProbe | object | `{"failureThreshold":3,"initialDelaySeconds":10,"periodSeconds":10,"successThreshold":1,"timeoutSeconds":1}` | Liveness probe for default backend. Ref: https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-probes/ |
| controller.logFormat | string | `"text"` | Argo controller log format: text|json |
| controller.logLevel | string | `"info"` | Argo controller log level |
| controller.metrics | object | `{"enabled":false,"rules":{"enabled":false,"spec":[]},"service":{"annotations":{},"labels":{},"servicePort":8082},"serviceMonitor":{"enabled":false,"interval":"30s","metricRelabelings":[],"relabelings":[]}}` | Server metrics controller configuration |
| controller.name | string | `"application-controller"` |  |
| controller.nodeSelector | object | `{}` | Node selectors and tolerations for server scheduling to nodes with taints. Ref: https://kubernetes.io/docs/concepts/configuration/assign-pod-node/ |
| controller.podAnnotations | object | `{}` | Annotations to be added to controller pods |
| controller.podLabels | object | `{}` | Labels to be added to controller pods |
| controller.priorityClassName | string | `""` | Priority class name |
| controller.readinessProbe | object | `{"failureThreshold":3,"initialDelaySeconds":10,"periodSeconds":10,"successThreshold":1,"timeoutSeconds":1}` | Readiness probe for default backend. Ref: https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-probes/ |
| controller.replicas | int | `1` | If changing the number of replicas you must pass the number as ARGOCD_CONTROLLER_REPLICAS as an environment variable |
| controller.resources | object | `{}` |  |
| controller.service | object | `{"annotations":{},"labels":{},"port":8082,"portName":"https-controller"}` | Controller service configuration |
| controller.serviceAccount.annotations | object | `{}` | Annotations applied to created service account |
| controller.serviceAccount.automountServiceAccountToken | bool | `true` | Automount API credentials for the Service Account |
| controller.serviceAccount.create | bool | `true` |  |
| controller.serviceAccount.name | string | `"argocd-application-controller"` |  |
| controller.tolerations | list | `[]` |  |
| controller.volumeMounts | list | `[]` | Additional volumeMounts to the controller main container. |
| controller.volumes | list | `[]` | Additional volumes to the controller pod. |
| createAggregateRoles | bool | `false` | Create clusterroles that extend existing clusterroles to interact with argo-cd crds. Ref: https://kubernetes.io/docs/reference/access-authn-authz/rbac/#aggregated-clusterroles |
| dex.affinity | object | `{}` |  |
| dex.containerPortGrpc | int | `5557` |  |
| dex.containerPortHttp | int | `5556` | Dex deployment container ports |
| dex.containerPortMetrics | int | `5558` |  |
| dex.containerSecurityContext | object | `{}` | Labels to set container specific security contexts |
| dex.enabled | bool | `true` |  |
| dex.env | list | `[]` | Environment variables to pass to the Dex server |
| dex.envFrom | list | `[]` | envFrom to pass to the Dex server |
| dex.image.imagePullPolicy | string | `"IfNotPresent"` |  |
| dex.image.repository | string | `"ghcr.io/dexidp/dex"` |  |
| dex.image.tag | string | `"v2.30.0"` |  |
| dex.initImage.imagePullPolicy | string | `nil` |  |
| dex.initImage.repository | string | `nil` |  |
| dex.initImage.tag | string | `nil` |  |
| dex.livenessProbe | object | `{"enabled":false,"failureThreshold":3,"initialDelaySeconds":10,"periodSeconds":10,"successThreshold":1,"timeoutSeconds":1}` | Probes for Dex server. Supported from Dex >= 2.28.0 |
| dex.metrics.enabled | bool | `false` |  |
| dex.metrics.service.annotations | object | `{}` |  |
| dex.metrics.service.labels | object | `{}` |  |
| dex.metrics.serviceMonitor.enabled | bool | `false` |  |
| dex.metrics.serviceMonitor.interval | string | `"30s"` |  |
| dex.metrics.serviceMonitor.metricRelabelings | list | `[]` |  |
| dex.metrics.serviceMonitor.relabelings | list | `[]` |  |
| dex.name | string | `"dex-server"` |  |
| dex.nodeSelector | object | `{}` | Node selectors and tolerations for server scheduling to nodes with taints. Ref: https://kubernetes.io/docs/concepts/configuration/assign-pod-node/ |
| dex.podAnnotations | object | `{}` | Annotations to be added to the Dex server pods |
| dex.podLabels | object | `{}` | Labels to be added to the Dex server pods |
| dex.priorityClassName | string | `""` |  |
| dex.readinessProbe.enabled | bool | `false` |  |
| dex.readinessProbe.failureThreshold | int | `3` |  |
| dex.readinessProbe.initialDelaySeconds | int | `10` |  |
| dex.readinessProbe.periodSeconds | int | `10` |  |
| dex.readinessProbe.successThreshold | int | `1` |  |
| dex.readinessProbe.timeoutSeconds | int | `1` |  |
| dex.resources | object | `{}` |  |
| dex.serviceAccount.annotations | object | `{}` | Annotations applied to created service account |
| dex.serviceAccount.automountServiceAccountToken | bool | `true` | Automount API credentials for the Service Account |
| dex.serviceAccount.create | bool | `true` |  |
| dex.serviceAccount.name | string | `"argocd-dex-server"` |  |
| dex.servicePortGrpc | int | `5557` |  |
| dex.servicePortGrpcName | string | `"grpc"` |  |
| dex.servicePortHttp | int | `5556` |  |
| dex.servicePortHttpName | string | `"http"` |  |
| dex.servicePortMetrics | int | `5558` |  |
| dex.tolerations | list | `[]` |  |
| dex.volumeMounts | list | `[{"mountPath":"/shared","name":"static-files"}]` | Additional volumeMounts to the controller main container |
| dex.volumes | list | `[{"emptyDir":{},"name":"static-files"}]` | Additional volumes to the controller pod |
| disasterRecovery | object | `{"activeDeadlineSeconds":540,"backupSchedule":"*/10 * * * *","command":"argocd-backup.sh","eks":{"roleARN":""},"enabled":true,"env":[],"image":{"pullPolicy":"","repository":"","tag":""}}` | Disaster recovery configurations |
| disasterRecovery.activeDeadlineSeconds | int | `540` | Limits the maxium runtime when performing backup. This must be within the backup schedule. For example, we might want to limit this to 9-minutes if we run backups every 10 minutes |
| disasterRecovery.backupSchedule | string | `"*/10 * * * *"` | The schedule to perform backup |
| disasterRecovery.command | string | `"argocd-backup.sh"` | The command to run backup (useful for testing) |
| disasterRecovery.env | list | `[]` | Environment variables to pass to the backup job |
| disasterRecovery.image.pullPolicy | string | `""` | The image pull policy |
| disasterRecovery.image.repository | string | `""` | The image repository used to run backup |
| disasterRecovery.image.tag | string | `""` | The version of the image used to run backup |
| fullnameOverride | string | `""` | String to fully override "argo-cd.fullname" |
| global.hostAliases | list | `[]` | Mapping between IP and hostnames that will be injected as entries in the pod's hosts files |
| global.image.imagePullPolicy | string | `"IfNotPresent"` | If defined, an image pull policy will be applied to all ArgoCD deployments |
| global.image.repository | string | `"quay.io/akuity/argocd"` | If defined, a repository applied to all ArgoCD deployments |
| global.image.tag | string | `"v2.1.1-ak0"` | If defined, a tag applied to all ArgoCD deployments |
| global.imagePullSecrets | list | `[]` |  |
| global.networkPolicy.create | bool | `false` | Create NetworkPolicy objects for all components |
| global.networkPolicy.defaultDenyIngress | bool | `false` | Default deny all ingress traffic |
| global.podAnnotations | object | `{}` | Annotations for the all deployed pods |
| global.podLabels | object | `{}` | Labels applied to all deployed pods |
| global.securityContext | object | `{}` | Toggle and define the security context |
| kubeVersionOverride | string | `""` | Override the Kubernetes version, which is used to evaluate certain manifests |
| nameOverride | string | `"argocd"` |  |
| openshift.enabled | bool | `false` | Whether to enable arbitrary uid for argo repo server |
| redis | object | `{"affinity":{},"containerPort":6379,"containerSecurityContext":{},"enabled":true,"env":[],"envFrom":[],"extraArgs":[],"image":{"imagePullPolicy":"IfNotPresent","repository":"redis","tag":"6.2.4-alpine"},"name":"redis","nodeSelector":{},"podAnnotations":{},"podLabels":{},"priorityClassName":"","resources":{},"securityContext":{"runAsNonRoot":true,"runAsUser":999},"serviceAccount":{"annotations":{},"automountServiceAccountToken":false,"create":false,"name":""},"servicePort":6379,"tolerations":[],"volumeMounts":[],"volumes":[]}` | Redis configurations |
| redis-ha | object | `{"enabled":false,"exporter":{"enabled":true},"haproxy":{"enabled":true,"metrics":{"enabled":true}},"image":{"tag":"6.2.4-alpine"},"persistentVolume":{"enabled":false},"redis":{"config":{"save":"\"\""},"masterGroupName":"argocd"}}` | This key configures Redis-HA subchart and when enabled (redis-ha.enabled=true) the custom redis deployment is omitted |
| redis-ha.exporter | object | `{"enabled":true}` | Check the redis-ha chart for more properties |
| redis.containerSecurityContext | object | `{}` | Labels to set container specific security contexts |
| redis.env | list | `[]` | Environment variables to pass to the Redis server |
| redis.envFrom | list | `[]` | envFrom to pass to the Redis server |
| redis.extraArgs | list | `[]` | Additional command line arguments to pass to redis-server |
| redis.nodeSelector | object | `{}` | Node selectors and tolerations for server scheduling to nodes with taints. Ref: https://kubernetes.io/docs/concepts/configuration/assign-pod-node/ |
| redis.podAnnotations | object | `{}` | Annotations to be added to the Redis server pods |
| redis.podLabels | object | `{}` | Labels to be added to the Redis server pods |
| redis.securityContext | object | `{"runAsNonRoot":true,"runAsUser":999}` | Redis Pod specific security context |
| redis.serviceAccount.annotations | object | `{}` | Annotations applied to created service account |
| redis.serviceAccount.automountServiceAccountToken | bool | `false` | Automount API credentials for the Service Account |
| repoServer | object | `{"affinity":{},"autoscaling":{"enabled":false,"maxReplicas":5,"minReplicas":1,"targetCPUUtilizationPercentage":50,"targetMemoryUtilizationPercentage":50},"containerPort":8081,"containerSecurityContext":{},"env":[],"envFrom":[],"extraArgs":[],"image":{"imagePullPolicy":null,"repository":null,"tag":null},"livenessProbe":{"failureThreshold":3,"initialDelaySeconds":10,"periodSeconds":10,"successThreshold":1,"timeoutSeconds":1},"logFormat":"text","logLevel":"info","metrics":{"enabled":false,"service":{"annotations":{},"labels":{},"servicePort":8084},"serviceMonitor":{"enabled":false,"interval":"30s","metricRelabelings":[],"relabelings":[]}},"name":"repo-server","nodeSelector":{},"podAnnotations":{},"podLabels":{},"priorityClassName":"","readinessProbe":{"failureThreshold":3,"initialDelaySeconds":10,"periodSeconds":10,"successThreshold":1,"timeoutSeconds":1},"replicas":1,"resources":{},"service":{"annotations":{},"labels":{},"port":8081,"portName":"https-repo-server"},"serviceAccount":{"annotations":{},"automountServiceAccountToken":true,"create":false},"tolerations":[],"volumeMounts":[],"volumes":[]}` | Repo Server |
| repoServer.containerPort | int | `8081` | Configures the repo server port |
| repoServer.containerSecurityContext | object | `{}` | Labels to set container specific security contexts |
| repoServer.env | list | `[]` | Environment variables to pass to argocd-repo-server |
| repoServer.envFrom | list | `[]` | envFrom to pass to argocd-repo-server |
| repoServer.extraArgs | list | `[]` | Additional command line arguments to pass to argocd-repo-server |
| repoServer.logFormat | string | `"text"` | Argo repoServer log format: text|json |
| repoServer.logLevel | string | `"info"` | Argo repoServer log level |
| repoServer.metrics | object | `{"enabled":false,"service":{"annotations":{},"labels":{},"servicePort":8084},"serviceMonitor":{"enabled":false,"interval":"30s","metricRelabelings":[],"relabelings":[]}}` | Repo server metrics service configuration |
| repoServer.nodeSelector | object | `{}` | Node selectors and tolerations for server scheduling to nodes with taints. Ref: https://kubernetes.io/docs/concepts/configuration/assign-pod-node/ |
| repoServer.podAnnotations | object | `{}` | Annotations to be added to repo server pods |
| repoServer.podLabels | object | `{}` | Labels to be added to repo server pods |
| repoServer.readinessProbe | object | `{"failureThreshold":3,"initialDelaySeconds":10,"periodSeconds":10,"successThreshold":1,"timeoutSeconds":1}` | Readiness and liveness probes for default backend. Ref: https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-probes/ |
| repoServer.service | object | `{"annotations":{},"labels":{},"port":8081,"portName":"https-repo-server"}` | Repo server service configuration |
| repoServer.serviceAccount | object | `{"annotations":{},"automountServiceAccountToken":true,"create":false}` | Repo server service account. If create is set to true, make sure to uncomment the name and update the rbac section below |
| repoServer.serviceAccount.automountServiceAccountToken | bool | `true` | Automount API credentials for the Service Account |
| repoServer.volumeMounts | list | `[]` | Additional volumeMounts to the repo server main container. |
| repoServer.volumes | list | `[]` | Additional volumes to the repo server pod. |
| server | object | `{"GKEbackendConfig":{"enabled":false,"spec":{}},"additionalApplications":[],"additionalProjects":[],"affinity":{},"autoscaling":{"enabled":false,"maxReplicas":5,"minReplicas":1,"targetCPUUtilizationPercentage":50,"targetMemoryUtilizationPercentage":50},"certificate":{"additionalHosts":[],"domain":"argocd.example.com","enabled":false,"issuer":{"kind":null,"name":null},"secretName":"argocd-server-tls"},"clusterAdminAccess":{"enabled":true},"config":{"application.instanceLabelKey":"argocd.argoproj.io/instance","url":"https://argocd.example.com"},"configAnnotations":{},"configEnabled":true,"containerPort":8080,"containerSecurityContext":{},"env":[],"envFrom":[],"extraArgs":[],"extraContainers":[],"image":{"imagePullPolicy":null,"repository":null,"tag":null},"ingress":{"annotations":{},"enabled":false,"extraPaths":[],"hosts":[],"https":false,"ingressClassName":"","labels":{},"pathType":"Prefix","paths":["/"],"tls":[]},"ingressGrpc":{"annotations":{},"awsALB":{"backendProtocolVersion":"HTTP2","serviceType":"NodePort"},"enabled":false,"extraPaths":[],"hosts":[],"https":false,"ingressClassName":"","isAWSALB":false,"labels":{},"pathType":"Prefix","paths":["/"],"tls":[]},"lifecycle":{},"livenessProbe":{"failureThreshold":3,"initialDelaySeconds":10,"periodSeconds":10,"successThreshold":1,"timeoutSeconds":1},"logFormat":"text","logLevel":"info","metrics":{"enabled":false,"service":{"annotations":{},"labels":{},"servicePort":8083},"serviceMonitor":{"enabled":false,"interval":"30s","metricRelabelings":[],"relabelings":[]}},"name":"server","nodeSelector":{},"podAnnotations":{},"podLabels":{},"priorityClassName":"","rbacConfig":{},"rbacConfigAnnotations":{},"rbacConfigCreate":true,"readinessProbe":{"failureThreshold":3,"initialDelaySeconds":10,"periodSeconds":10,"successThreshold":1,"timeoutSeconds":1},"replicas":1,"resources":{},"route":{"enabled":false,"hostname":""},"service":{"annotations":{},"externalIPs":[],"externalTrafficPolicy":"","labels":{},"loadBalancerIP":"","loadBalancerSourceRanges":[],"namedTargetPort":true,"nodePortHttp":30080,"nodePortHttps":30443,"servicePortHttp":80,"servicePortHttpName":"http","servicePortHttps":443,"servicePortHttpsName":"https","sessionAffinity":"","type":"ClusterIP"},"serviceAccount":{"annotations":{},"automountServiceAccountToken":true,"create":true,"name":"argocd-server"},"staticAssets":{"enabled":true},"tolerations":[],"volumeMounts":[],"volumes":[]}` | Server configurations |
| server.GKEbackendConfig | object | `{"enabled":false,"spec":{}}` | Enable BackendConfig custom resource for Google Kubernetes Engine |
| server.additionalApplications | list | `[]` | Additional applications. Not well tested and not well supported on release v1.0.0. |
| server.additionalProjects | list | `[]` | Additional projects. Reference: https://github.com/argoproj/argo-cd/blob/master/docs/operator-manual/ |
| server.certificate | object | `{"additionalHosts":[],"domain":"argocd.example.com","enabled":false,"issuer":{"kind":null,"name":null},"secretName":"argocd-server-tls"}` | Certificate configuration |
| server.clusterAdminAccess | object | `{"enabled":true}` | Enable Admin ClusterRole resources. Enable if you would like to grant rights to ArgoCD to deploy to the local Kubernetes cluster. |
| server.config | object | `{"application.instanceLabelKey":"argocd.argoproj.io/instance","url":"https://argocd.example.com"}` | ArgoCD config. Reference https://github.com/argoproj/argo-cd/blob/master/docs/operator-manual/argocd-cm.yaml |
| server.config."application.instanceLabelKey" | string | `"argocd.argoproj.io/instance"` | Argo CD instance label key |
| server.config.url | string | `"https://argocd.example.com"` | Argo CD's externally facing base URL (optional). Required when configuring SSO |
| server.configAnnotations | object | `{}` | Annotations to be added to ArgoCD ConfigMap |
| server.containerPort | int | `8080` | Configures the server port |
| server.containerSecurityContext | object | `{}` | Labels to set container specific security contexts |
| server.env | list | `[]` | Environment variables to pass to argocd-server |
| server.envFrom | list | `[]` | envFrom to pass to argocd-server |
| server.extraArgs | list | `[]` | Additional command line arguments to pass to argocd-server |
| server.extraContainers | list | `[]` | Additional containers to be added to the controller pod. See https://github.com/lemonldap-ng-controller/lemonldap-ng-controller as example. |
| server.ingress.hosts | list | `[]` | Hostnames must be provided if Ingress is enabled. Secrets must be manually created in the namespace |
| server.ingressGrpc | object | `{"annotations":{},"awsALB":{"backendProtocolVersion":"HTTP2","serviceType":"NodePort"},"enabled":false,"extraPaths":[],"hosts":[],"https":false,"ingressClassName":"","isAWSALB":false,"labels":{},"pathType":"Prefix","paths":["/"],"tls":[]}` | Dedicated ingress for gRPC as documented at https://argoproj.github.io/argo-cd/operator-manual/ingress/ |
| server.ingressGrpc.awsALB.backendProtocolVersion | string | `"HTTP2"` | This tells AWS to send traffic from the ALB using HTTP2. Can use GRPC as well if you want to leverage GRPC specific features |
| server.ingressGrpc.awsALB.serviceType | string | `"NodePort"` | Service Type if isAWSALB is set to true. Can be of type NodePort or ClusterIP depending on which mode you are running. Instance mode needs type NodePort, IP mode needs type ClusterIP. Ref: https://kubernetes-sigs.github.io/aws-load-balancer-controller/v2.2/how-it-works/#ingress-traffic |
| server.ingressGrpc.hosts | list | `[]` | Hostnames must be provided if Ingress is enabled. Secrets must be manually created in the namespace |
| server.lifecycle | object | `{}` | Specify postStart and preStop lifecycle hooks for your argo-cd-server container |
| server.livenessProbe | object | `{"failureThreshold":3,"initialDelaySeconds":10,"periodSeconds":10,"successThreshold":1,"timeoutSeconds":1}` | Liveness probe for default backend. Ref: https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-probes/ |
| server.logFormat | string | `"text"` | Argo server log format: text|json |
| server.logLevel | string | `"info"` | Argo server log level |
| server.metrics | object | `{"enabled":false,"service":{"annotations":{},"labels":{},"servicePort":8083},"serviceMonitor":{"enabled":false,"interval":"30s","metricRelabelings":[],"relabelings":[]}}` | Server metrics service configuration |
| server.nodeSelector | object | `{}` | Node selectors and tolerations for server scheduling to nodes with taints. Ref: https://kubernetes.io/docs/concepts/configuration/assign-pod-node/ |
| server.podAnnotations | object | `{}` | Annotations to be added to controller pods |
| server.podLabels | object | `{}` | Labels to be added to controller pods |
| server.rbacConfig | object | `{}` | ArgoCD rbac config. Reference https://github.com/argoproj/argo-cd/blob/master/docs/operator-manual/rbac.md |
| server.rbacConfigAnnotations | object | `{}` | Annotations to be added to ArgoCD rbac ConfigMap |
| server.rbacConfigCreate | bool | `true` | Boolean determining whether or not to create the configmap. If false, it is expected the configmap will be created by something else. ArgoCD will not work if there is no configMap created with the name above. |
| server.readinessProbe | object | `{"failureThreshold":3,"initialDelaySeconds":10,"periodSeconds":10,"successThreshold":1,"timeoutSeconds":1}` | Readiness probe for default backend. Ref: https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-probes/ |
| server.service | object | `{"annotations":{},"externalIPs":[],"externalTrafficPolicy":"","labels":{},"loadBalancerIP":"","loadBalancerSourceRanges":[],"namedTargetPort":true,"nodePortHttp":30080,"nodePortHttps":30443,"servicePortHttp":80,"servicePortHttpName":"http","servicePortHttps":443,"servicePortHttpsName":"https","sessionAffinity":"","type":"ClusterIP"}` | Server service configuration |
| server.service.nodePortHttp | int | `30080` | For node port default ports |
| server.serviceAccount.annotations | object | `{}` | Annotations applied to created service account |
| server.serviceAccount.automountServiceAccountToken | bool | `true` | Automount API credentials for the Service Account |
| server.volumeMounts | list | `[]` | Additional volumeMounts to the server main container. |
| server.volumes | list | `[]` | Additional volumes to the controller pod. |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.5.0](https://github.com/norwoodj/helm-docs/releases/v1.5.0)
