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
  {{- $imageFromChartVersion := print "v" (regexReplaceAllLiteral "\\.[0-9]+$" .root.Chart.Version "") }}
  {{- $repository }}:{{- default $imageFromChartVersion .root.Values.global.image.tag -}}
{{- end -}}
{{- end -}}
