{{/*
Template to render code-server addon
It will include / inject the required templates based on the given values.
*/}}
{{- define "tc.v1.common.addon.codeserver" -}}
{{- $targetSelector := "main" -}}
{{- if $.Values.addons.codeserver.targetSelector -}}
  {{- $targetSelector = $.Values.addons.codeserver.targetSelector -}}
{{- end -}}
{{- if .Values.addons.codeserver.enabled -}}
  {{/* Append the code-server container to the workloads */}}
  {{- $container := include "tc.v1.common.addon.codeserver.container" . | fromYaml -}}
  {{- if $container -}}
    {{- $workload := get $.Values.workload $targetSelector -}}
    {{- $_ := set $workload.podSpec.containers "codeserver" $container -}}
  {{- end -}}

  {{- $hasPrimaryService := false -}}
  {{- range $svcName, $svcValues := .Values.service -}}
    {{- $enabled := (include "tc.v1.common.lib.util.enabled" (dict
                    "rootCtx" $ "objectData" $svcValues
                    "name" $svcName "caller" "Code Server Service"
                    "key" "addons.codeserver.service")) -}}

    {{- if eq $enabled "true" -}}
      {{- if $svcValues.primary -}}
        {{- $hasPrimaryService = true -}}
      {{- end -}}
    {{- end -}}
  {{- end -}}

  {{/* Add the code-server service */}}
  {{- if .Values.addons.codeserver.service.enabled -}}
    {{- $serviceValues := .Values.addons.codeserver.service -}}
    {{- $_ := set $serviceValues "targetSelector" $targetSelector -}}
    {{- if not $hasPrimaryService -}}
      {{- $_ := set $serviceValues "primary" true -}}
    {{- end -}}
    {{- $_ := set .Values.service "codeserver" $serviceValues -}}
  {{- end -}}

  {{/* Add the code-server ingress */}}
  {{- if .Values.addons.codeserver.ingress.enabled -}}
    {{- $ingressValues := .Values.addons.codeserver.ingress -}}
    {{- if not $ingressValues.targetSelector -}}
      {{/* Assumes that both service and port are named codeserver */}}
      {{- $_ := set $ingressValues "targetSelector" (dict "codeserver" "codeserver") -}}
    {{- end -}}

    {{- $hasPrimaryIngress := false -}}
    {{- range $ingName, $ingValues := $.Values.ingress -}}
      {{- $enabled := (include "tc.v1.common.lib.util.enabled" (dict
                      "rootCtx" $ "objectData" $ingValues
                      "name" $ingName "caller" "Code Server Ingress"
                      "key" "addons.codeserver.ingress")) -}}

      {{- if eq $enabled "true" -}}
        {{- if $ingValues.primary -}}
          {{- $hasPrimaryIngress = true -}}
        {{- end -}}
      {{- end -}}
    {{- end -}}

    {{- if not $hasPrimaryIngress -}}
      {{- $_ := set $ingressValues "primary" true -}}
    {{- end -}}

    {{/* Let spawner handle the rest */}}
    {{- $_ := set $.Values.ingress "codeserver" $ingressValues -}}
  {{- end -}}
{{- end -}}
{{- end -}}
