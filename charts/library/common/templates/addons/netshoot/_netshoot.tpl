{{/*
Template to render code-server addon
It will include / inject the required templates based on the given values.
*/}}
{{- define "tc.v1.common.addon.netshoot" -}}
{{- $targetSelector := "main" -}}
{{- if $.Values.addons.netshoot.targetSelector -}}
  {{- $targetSelector = $.Values.addons.netshoot.container.targetSelector -}}
{{- end -}}
{{- if .Values.addons.netshoot.enabled -}}
  {{/* Append the code-server container to the workloads */}}
    {{- $workload := get $.Values.workload $targetSelector -}}
    {{- $_ := set $workload.podSpec.containers "netshoot" .Values.addons.netshoot.container -}}

{{- end -}}
{{- end -}}
