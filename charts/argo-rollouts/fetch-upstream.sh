#!/bin/bash
# Script to fetch upstream manifests. This script is fragile and will break if assumptions about
# upstream change. But is better/easier than making the helm modifications manually.

set -e
set -x

GIT_REF=$1
if [[ -z "${GIT_REF}" ]]; then
    echo "Usage: $0 <git-tag>"
    exit 1
fi

SRCROOT="$( CDPATH='' cd -- "$(dirname "$0")" && pwd -P )"

######################################
# CRD Manifests
######################################
crds=(
    crds/analysis-run-crd.yaml
    crds/analysis-template-crd.yaml
    crds/cluster-analysis-template-crd.yaml
    crds/experiment-crd.yaml
    crds/rollout-crd.yaml
)
rm -rf ${SRCROOT}/crds
mkdir -p ${SRCROOT}/crds
for c in ${crds[*]}; do
    config_basename=$(basename ${c})
    curl -fsL https://raw.githubusercontent.com/argoproj/argo-rollouts/${GIT_REF}/manifests/${c} -o ${SRCROOT}/crds/${config_basename}
done


######################################
# Controller Manifests
######################################
controller_manifests=(
    base/argo-rollouts-aggregate-roles.yaml
    base/argo-rollouts-deployment.yaml
    base/argo-rollouts-metrics-service.yaml
    base/argo-rollouts-sa.yaml
    cluster-install/argo-rollouts-clusterrolebinding.yaml
)

rm -rf ${SRCROOT}/controller
mkdir -p ${SRCROOT}/controller
for c in ${controller_manifests[*]}; do
    dest_path=${SRCROOT}/templates/controller/$(basename ${c})
    curl -fsL https://raw.githubusercontent.com/argoproj/argo-rollouts/${GIT_REF}/manifests/${c} > $dest_path
done

# We provide additional options on ClusterRole (readOnly, readSecrets)
echo '{{- if not .Values.controller.clusterRole.readOnly -}}' > templates/controller/argo-rollouts-clusterrole.yaml
curl -fsL https://raw.githubusercontent.com/argoproj/argo-rollouts/${GIT_REF}/manifests/role/argo-rollouts-clusterrole.yaml >> templates/controller/argo-rollouts-clusterrole.yaml
sed -i.bak 's/^  - secrets/{{ if .Values.controller.clusterRole.readSecrets }}\n  - secrets\n{{- end }}/' templates/controller/argo-rollouts-clusterrole.yaml
rm -f templates/controller/argo-rollouts-clusterrole.yaml.bak
echo '{{- end }}' >> templates/controller/argo-rollouts-clusterrole.yaml

egrep -v '(^( )+- (create|update|delete|patch))' templates/controller/argo-rollouts-clusterrole.yaml > templates/controller/argo-rollouts-clusterrole-readonly.yaml
sed -i.bak "1s/.*/{{- if .Values.controller.clusterRole.readOnly -}}/" templates/controller/argo-rollouts-clusterrole-readonly.yaml
rm templates/controller/argo-rollouts-clusterrole-readonly.yaml.bak

perl -pe 's(  namespace:.*)(  namespace: {{ .Release.Namespace }})' templates/controller/argo-rollouts-clusterrolebinding.yaml > /tmp/argo-rollouts-clusterrolebinding.yaml
mv /tmp/argo-rollouts-clusterrolebinding.yaml templates/controller/argo-rollouts-clusterrolebinding.yaml

echo '{{- if and .Values.controller.serviceAccount.create }}' > /tmp/argo-rollouts-sa.yaml
cat templates/controller/argo-rollouts-sa.yaml >> /tmp/argo-rollouts-sa.yaml
sed -i.bak 's/  name: argo-rollouts/  name: argo-rollouts\n  namespace: {{ .Release.Namespace }}/' /tmp/argo-rollouts-sa.yaml
rm -f /tmp/argo-rollouts-sa.yaml.bak
echo '{{- end }}' >> /tmp/argo-rollouts-sa.yaml
mv /tmp/argo-rollouts-sa.yaml templates/controller/argo-rollouts-sa.yaml

sed -i.bak 's/^  name: argo-rollouts-metrics/  name: argo-rollouts-metrics\n  namespace: {{ .Release.Namespace }}/' templates/controller/argo-rollouts-metrics-service.yaml
rm -f templates/controller/argo-rollouts-metrics-service.yaml.bak

sed '/- name: argo-rollouts/q' templates/controller/argo-rollouts-deployment.yaml > /tmp/argo-rollouts-deployment.yaml
sed -i.bak 's/^  name: argo-rollouts/  name: argo-rollouts\n  namespace: {{ .Release.Namespace }}/' /tmp/argo-rollouts-deployment.yaml
rm -f /tmp/argo-rollouts-deployment.yaml.bak
cat << EOF >> /tmp/argo-rollouts-deployment.yaml
        image: {{ .Values.controller.image.repository }}:{{ .Values.controller.image.tag | default (print "v" .Chart.AppVersion) }}
        {{ with .Values.controller.image.pullPolicy }}
        imagePullPolicy: {{ . }}
        {{- end}}
        {{- with .Values.controller.extraArgs }}
        args:
        {{- . | toYaml | nindent 8 }}
        {{- end }}
        {{- with .Values.controller.resources }}
        resources:
          {{- toYaml . | nindent 10 }}
        {{- end }}
EOF
sed '1,/imagePullPolicy/d' ./templates/controller/argo-rollouts-deployment.yaml >> /tmp/argo-rollouts-deployment.yaml
mv /tmp/argo-rollouts-deployment.yaml ./templates/controller/argo-rollouts-deployment.yaml

######################################
# Dashboard Manifests
######################################
dashboard=(
    dashboard-install/dashboard-clusterrolebinding.yaml
    dashboard-install/dashboard-deployment.yaml
    dashboard-install/dashboard-service.yaml
    dashboard-install/dashboard-serviceaccount.yaml
)

mkdir -p ${SRCROOT}/dashboard
for c in ${dashboard[*]}; do
    dest_path=${SRCROOT}/templates/dashboard/$(basename ${c})
    echo "{{- if .Values.dashboard.enabled -}}" > $dest_path
    curl -fsL https://raw.githubusercontent.com/argoproj/argo-rollouts/${GIT_REF}/manifests/${c} >> $dest_path
done


perl -pe 's(  image:.*)(  image: {{ .Values.dashboard.image.repository }}:{{ .Values.dashboard.image.tag | default (print "v" .Chart.AppVersion) }})' templates/dashboard/dashboard-deployment.yaml > /tmp/dashboard-deployment.yaml
mv /tmp/dashboard-deployment.yaml templates/dashboard/dashboard-deployment.yaml
sed -i.bak 's/^  name: argo-rollouts-dashboard/  name: argo-rollouts-dashboard\n  namespace: {{ .Release.Namespace }}/' templates/dashboard/dashboard-deployment.yaml
rm -f templates/dashboard/dashboard-deployment.yaml.bak

cat << EOF >> templates/dashboard/dashboard-deployment.yaml
          {{ with .Values.dashboard.image.pullPolicy }}
          imagePullPolicy: {{ . }}
          {{- end}}
          {{- with .Values.dashboard.extraArgs }}
          cmd:
          {{- . | toYaml | nindent 10 }}
          {{- end }}
          {{- with .Values.dashboard.resources }}
          resources:
            {{- toYaml . | nindent 12 }}
          {{- end }}
EOF

sed -i.bak 's/^  name: argo-rollouts-dashboard/  name: argo-rollouts-dashboard\n  namespace: {{ .Release.Namespace }}/' templates/dashboard/dashboard-service.yaml
rm -f templates/dashboard/dashboard-service.yaml.bak
sed -i.bak 's/^  name: argo-rollouts-dashboard/  name: argo-rollouts-dashboard\n  namespace: {{ .Release.Namespace }}/' templates/dashboard/dashboard-serviceaccount.yaml
rm -f templates/dashboard/dashboard-serviceaccount.yaml.bak

# We provide additional options on ClusterRole (readOnly)
echo '{{- if not .Values.dashboard.clusterRole.readOnly -}}' > templates/dashboard/dashboard-clusterrole.yaml
curl -fsL https://raw.githubusercontent.com/argoproj/argo-rollouts/${GIT_REF}/manifests/dashboard-install/dashboard-clusterrole.yaml >> templates/dashboard/dashboard-clusterrole.yaml
echo '{{- end }}' >> templates/dashboard/dashboard-clusterrole.yaml

egrep -v '(^( )+- (create|update|delete|patch))' templates/dashboard/dashboard-clusterrole.yaml > templates/dashboard/dashboard-clusterrole-readonly.yaml
sed -i.bak "1s/.*/{{- if .Values.dashboard.clusterRole.readOnly -}}/" templates/dashboard/dashboard-clusterrole-readonly.yaml
rm templates/dashboard/dashboard-clusterrole-readonly.yaml.bak

perl -pe 's(  namespace:.*)(  namespace: {{ .Release.Namespace }})' templates/dashboard/dashboard-clusterrolebinding.yaml > /tmp/dashboard-clusterrolebinding.yaml
mv /tmp/dashboard-clusterrolebinding.yaml templates/dashboard/dashboard-clusterrolebinding.yaml

for c in ${dashboard[*]}; do
    dest_path=${SRCROOT}/templates/dashboard/$(basename ${c})
    echo "{{- end }}" >> $dest_path
done

######################################
# Notifications Manifests
######################################
notifications_config=(
  on-rollout-completed.yaml
  on-scaling-replica-set.yaml
  on-rollout-step-completed.yaml
  on-rollout-updated.yaml
  on-rollout-aborted.yaml
  on-rollout-paused.yaml
  on-analysis-run-running.yaml
  on-analysis-run-error.yaml
  on-analysis-run-failed.yaml
)

mkdir -p ${SRCROOT}/notifications
for c in ${notifications_config[*]}; do
    dest_path=${SRCROOT}/notifications/$(basename ${c} .yaml)
    curl -fsL https://raw.githubusercontent.com/argoproj/argo-rollouts/${GIT_REF}/manifests/notifications/${c} | yq .data > $dest_path
done
