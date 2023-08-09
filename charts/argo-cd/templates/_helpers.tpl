{{/* vim: set filetype=mustache: */}}

{{/*
Returns the supplied image tag if defined, then the global tag, then the chart version
@param .root      The root scope
@param .image     Image structure with .repository and .tag fields
*/}}
{{- define "argo-cd.image" -}}
{{- $repository := default .root.Values.global.image.repository .image.repository }}
{{- if .image.tag -}}
  {{- $repository }}:{{- .image.tag -}}
{{- else -}}
  {{- $repository }}:{{- default .root.Chart.Version .root.Values.global.image.tag -}}
{{- end -}}
{{- end -}}
