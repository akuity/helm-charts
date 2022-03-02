# argo-cd

![Version: 1.1.1](https://img.shields.io/badge/Version-1.1.1-informational?style=flat-square) ![AppVersion: 2.3.0-rc5](https://img.shields.io/badge/AppVersion-2.3.0--rc5-informational?style=flat-square)

A Helm chart for ArgoCD, a declarative, GitOps continuous delivery tool for Kubernetes.

**Homepage:** <https://charts.akuity.io>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| terrytangyuan | terry@akuity.io |  |
| jessesuen | jesse@akuity.io |  |
| wanghong230 | hong@akuity.io |  |

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://charts.akuity.io | argo-cd-extensions | 0.0.2 |
| https://charts.akuity.io | argocd-image-updater | 0.0.11 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| applicationsetController | object | `{"enabled":false,"image":{"pullPolicy":null,"repository":"quay.io/argoproj/argocd-applicationset","tag":"v0.3.0"}}` | ApplicationSet Controller |
| applicationsetController.enabled | bool | `false` | Whether to enable ApplicationSet Controller |
| clusterRoles | object | `{"enabled":true}` | Installs necessary ClusterRoles to allow Argo CD to deploy to the same cluster Argo CD is installed in |
| config | object | `{"argocd":{"application.resourceTrackingMethod":"annotation"},"createSecret":true,"gpgKeys":null,"params":null,"rbac":null,"secret":null,"sshKnownHosts":{"additional":"","default":"bitbucket.org ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAubiN81eDcafrgMeLzaFPsw2kNvEcqTKl/VqLat/MaB33pZy0y3rJZtnqwR2qOOvbwKZYKiEO1O6VqNEBxKvJJelCq0dTXWT5pbO2gDXC6h6QDXCaHo6pOHGPUy+YBaGQRGuSusMEASYiWunYN0vCAI8QaXnWMXNMdFP3jHAJH0eDsoiGnLPBlBp4TNm6rYI74nMzgz3B9IikW4WVK+dc8KZJZWYjAuORU3jc1c/NPskD2ASinf8v3xnfXeukU0sJ5N6m5E8VLjObPEO+mN2t/FZTMZLiFqPWc/ALSqnMnnhwrNi2rbfg/rd/IpL8Le3pSBne8+seeFVBoGqzHM9yXw==\ngithub.com ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAq2A7hRGmdnm9tUDbO9IDSwBK6TbQa+PXYPCPy6rbTrTtw7PHkccKrpp0yVhp5HdEIcKr6pLlVDBfOLX9QUsyCOV0wzfjIJNlGEYsdlLJizHhbn2mUjvSAHQqZETYP81eFzLQNnPHt4EVVUh7VfDESU84KezmD5QlWpXLmvU31/yMf+Se8xhHTvKSCZIFImWwoG6mbUoWf9nzpIoaSjB+weqqUUmpaaasXVal72J+UX2B+2RPW3RcT0eOzQgqlJL3RKrTJvdsjE3JEAvGq3lGHSZXy28G3skua2SmVi/w4yCE6gbODqnTWlg7+wC604ydGXA8VJiS5ap43JXiUFFAaQ==\ngitlab.com ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBFSMqzJeV9rUzU4kWitGjeR4PWSa29SPqJ1fVkhtj3Hw9xjLVXVYrU9QlYWrOLXBpQ6KWjbjTDTdDkoohFzgbEY=\ngitlab.com ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAfuCHKVTjquxvt6CM6tdG4SLp1Btn/nOeHHE5UOzRdf\ngitlab.com ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCsj2bNKTBSpIYDEGk9KxsGh3mySTRgMtXL583qmBpzeQ+jqCMRgBqB98u3z++J1sKlXHWfM9dyhSevkMwSbhoR8XIq/U0tCNyokEi/ueaBMCvbcTHhO7FcwzY92WK4Yt0aGROY5qX2UKSeOvuP4D6TPqKF1onrSzH9bx9XUf2lEdWT/ia1NEKjunUqu1xOB/StKDHMoX4/OKyIzuS0q/T1zOATthvasJFoPrAjkohTyaDUz2LN5JoH839hViyEG82yB+MjcFV5MU3N1l1QL3cVUCh93xSaua1N85qivl+siMkPGbO5xR/En4iEY6K2XPASUEMaieWVNTRCtJ4S8H+9\nssh.dev.azure.com ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC7Hr1oTWqNqOlzGJOfGJ4NakVyIzf1rXYd4d7wo6jBlkLvCA4odBlL0mDUyZ0/QUfTTqeu+tm22gOsv+VrVTMk6vwRU75gY/y9ut5Mb3bR5BV58dKXyq9A9UeB5Cakehn5Zgm6x1mKoVyf+FFn26iYqXJRgzIZZcZ5V6hrE0Qg39kZm4az48o0AUbf6Sp4SLdvnuMa2sVNwHBboS7EJkm57XQPVU3/QpyNLHbWDdzwtrlS+ez30S3AdYhLKEOxAG8weOnyrtLJAUen9mTkol8oII1edf7mWWbWVf0nBmly21+nZcmCTISQBtdcyPaEno7fFQMDD26/s0lfKob4Kw8H\nvs-ssh.visualstudio.com ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC7Hr1oTWqNqOlzGJOfGJ4NakVyIzf1rXYd4d7wo6jBlkLvCA4odBlL0mDUyZ0/QUfTTqeu+tm22gOsv+VrVTMk6vwRU75gY/y9ut5Mb3bR5BV58dKXyq9A9UeB5Cakehn5Zgm6x1mKoVyf+FFn26iYqXJRgzIZZcZ5V6hrE0Qg39kZm4az48o0AUbf6Sp4SLdvnuMa2sVNwHBboS7EJkm57XQPVU3/QpyNLHbWDdzwtrlS+ez30S3AdYhLKEOxAG8weOnyrtLJAUen9mTkol8oII1edf7mWWbWVf0nBmly21+nZcmCTISQBtdcyPaEno7fFQMDD26/s0lfKob4Kw8H\ngithub.com ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBEmKSENjQEezOmxkZMy7opKgwFB9nkt5YRrYMjNuG5N87uRgg6CLrbo5wAdT/y6v0mKV0U2w0WZ2YB/++Tpockg=\ngithub.com ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOMqqnkVzrm0SdG6UOoqKLsabgH5C9okWi0dh2l9GKJl\n"},"tlsCerts":null}` | Argo Configuration |
| config.createSecret | bool | `true` | Disable creation of the argocd-secret (e.g. if it managed elsewhere SealedSecret / ExternalSecret) |
| config.gpgKeys | string | `nil` | policy.default is the name of the default role which Argo CD will falls back to, when -- authorizing API requests (optional). If omitted or empty, users may be still be able to login, -- but will see no apps, projects, etc... policy.default: role:readonly -- scopes controls which OIDC scopes to examine during rbac enforcement (in addition to `sub` scope). -- If omitted, defaults to: '[groups]'. The scope value can be a string, or a list of strings. scopes: '[cognito:groups, email]' -- [GnuPG](https://argoproj.github.io/argo-cd/user-guide/gpg-verification/) keys to add to the key ring |
| config.rbac | string | `nil` | RBAC config. Reference https://github.com/argoproj/argo-cd/blob/master/docs/operator-manual/rbac.md |
| config.secret | string | `nil` | Contents of the argocd-secret with values managed in plaintext. Not to be used in production |
| controller.args | object | `{"operationProcessors":"10","statusProcessors":"20"}` | Argo controller commandline flags |
| controller.args.operationProcessors | string | `"10"` | Number of application operation processors |
| controller.args.statusProcessors | string | `"20"` | Number of application status processors |
| controller.extraArgs | string | `nil` | Additional command line arguments to pass to argocd-controller |
| controller.image.pullPolicy | string | `nil` |  |
| controller.image.repository | string | `nil` |  |
| controller.image.tag | string | `nil` |  |
| controller.replicas | int | `1` |  |
| controller.resources | string | `nil` |  |
| dex.enabled | bool | `true` | Enbable or disables dex. Can be disabled if using native OAuth provider |
| dex.image.pullPolicy | string | `nil` |  |
| dex.image.repository | string | `"ghcr.io/dexidp/dex"` |  |
| dex.image.tag | string | `"v2.30.2"` |  |
| dex.resources | string | `nil` |  |
| disasterRecovery | object | `{"activeDeadlineSeconds":540,"backupSchedule":"*/10 * * * *","bucketName":"","command":"argocd-backup.sh","enabled":false,"image":{"pullPolicy":null,"repository":null,"tag":null},"instanceName":""}` | Disaster recovery configurations |
| disasterRecovery.activeDeadlineSeconds | int | `540` | Limits the maxium runtime when performing backup. This must be within the backup schedule. For example, we might want to limit this to 9-minutes if we run backups every 10 minutes |
| disasterRecovery.backupSchedule | string | `"*/10 * * * *"` | The cron schedule to perform backup. Recommend no more frequent than 10 minutes |
| disasterRecovery.bucketName | string | `""` | Bucket name to send backup to |
| disasterRecovery.command | string | `"argocd-backup.sh"` | The command to run backup (useful for testing) |
| disasterRecovery.instanceName | string | `""` | Unique name for this argocd instance incorporated to the backup filename |
| extensions.enabled | bool | `false` |  |
| extensions.image.pullPolicy | string | `nil` |  |
| extensions.image.repository | string | `"ghcr.io/argoproj-labs/argocd-extensions"` |  |
| extensions.image.tag | string | `"v0.1.0"` |  |
| global.image.pullPolicy | string | `nil` | If defined, an image pull policy will be applied to all ArgoCD deployments |
| global.image.repository | string | `"quay.io/akuity/argocd"` | If defined, a repository applied to all ArgoCD deployments |
| global.image.tag | string | `"v2.3.0-rc5-ak.0"` | If defined, a tag applied to all ArgoCD deployments |
| imageUpdater | object | `{"enabled":false,"image":{"pullPolicy":"Always","repository":"argoprojlabs/argocd-image-updater","tag":"v0.11.3"}}` | Image Updater |
| imageUpdater.enabled | bool | `false` | Whether to enable image updater |
| notificationsController | object | `{"enabled":false}` | Notifications Controller |
| notificationsController.enabled | bool | `false` | Whether to enable Notifications Controller |
| redis | object | `{"enabled":true,"image":{"pullPolicy":null,"repository":"redis","tag":"6.2.6-alpine"},"resources":null}` | Redis configurations |
| repoServer | object | `{"extraArgs":null,"image":{"pullPolicy":null,"repository":null,"tag":null},"replicas":2,"resources":null}` | Repo Server |
| repoServer.extraArgs | string | `nil` | Additional command line arguments to pass to argocd-repo-server |
| server | object | `{"enabled":true,"extraArgs":null,"image":{"pullPolicy":null,"repository":null,"tag":null},"ingress":{"annotations":{},"className":"","enabled":false,"host":"argocd.example.com","tls":{"enabled":false,"secretName":null}},"insecure":false,"replicas":2,"resources":null,"service":{"type":null}}` | Argo Server configuration |
| server.enabled | bool | `true` | Enables argocd-server. Can be disabled if API/UI is not needed (e.g. accessed via `argocd admin dashboard`) |
| server.extraArgs | string | `nil` | Additional command line arguments to pass to argocd-server |
| server.ingress.enabled | bool | `false` | Enable creation of Ingress object |
| server.insecure | bool | `false` | Disables TLS on the server. May be necessary for ingress controllers or service meshes |
| server.service | object | `{"type":null}` | Server service configuration |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.5.0](https://github.com/norwoodj/helm-docs/releases/v1.5.0)
