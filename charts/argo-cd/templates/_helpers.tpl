{{/* vim: set filetype=mustache: */}}

{{/*
Selector labels
*/}}
{{- define "argo-cd.selectorLabels" -}}
{{- if .name -}}
app.kubernetes.io/name: {{ include "argo-cd.name" .context }}-{{ .name }}
{{ end -}}
app.kubernetes.io/instance: {{ .context.Release.Name }}
{{- if .component }}
app.kubernetes.io/component: {{ .component }}
{{- end }}
{{- end }}

{{/*
Return the target Kubernetes version
*/}}
{{- define "argo-cd.kubeVersion" -}}
  {{- default .Capabilities.KubeVersion.Version .Values.kubeVersionOverride }}
{{- end -}}

{{/* 
Argo Configuration Preset Values (Incluenced by Values configuration)
*/}}
{{- define "argo-cd.config.presets" -}}
  {{- if .Values.configs.styles }}
ui.cssurl: "./custom/custom.styles.css"
  {{- end }}
{{- end -}}

{{/* 
Merge Argo Configuration with Preset Configuration
*/}}
{{- define "argo-cd.config" -}}
  {{- if .Values.server.configEnabled -}}
{{- toYaml (mergeOverwrite (default dict (fromYaml (include "argo-cd.config.presets" $))) .Values.server.config) }}
  {{- end -}}
{{- end -}}