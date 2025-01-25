{{/* Traefik Middleware Spawner */}}
{{/* Call this template:
{{ include "tc.v1.common.spawner.configmap" $ -}}
*/}}

{{- define "tc.v1.common.spawner.traefik.middleware" -}}
  {{- $fullname := include "tc.v1.common.lib.chart.names.fullname" $ -}}

  {{- range $name, $middleware := .Values.ingressMiddlewares -}}

    {{- $enabled := (include "tc.v1.common.lib.util.enabled" (dict
                    "rootCtx" $ "objectData" $middleware
                    "name" $name "caller" "Middleware"
                    "key" "middlewares")) -}}

    {{- if eq $enabled "true" -}}

      {{/* Create a copy of the middleware */}}
      {{- $objectData := (mustDeepCopy $middleware) -}}

      {{- $objectName := $name -}}

      {{- $expandName := (include "tc.v1.common.lib.util.expandName" (dict
                "rootCtx" $ "objectData" $objectData
                "name" $name "caller" "Middleware"
                "key" "middlewares")) -}}

      {{- if eq $expandName "true" -}}
        {{- $objectName = (printf "%s-%s" $fullname $name) -}}
      {{- end -}}

      {{/* Perform validations */}} {{/* Middleware have a max name length of 253 */}}
      {{- include "tc.v1.common.lib.chart.names.validation" (dict "name" $objectName "length" 253) -}}
      {{- include "tc.v1.common.lib.traefik.middleware.validation" (dict "objectData" $objectData) -}}
      {{- include "tc.v1.common.lib.metadata.validation" (dict "objectData" $objectData "caller" "Middleware") -}}

      {{/* Set the name of the middleware */}}
      {{- $_ := set $objectData "name" $objectName -}}
      {{- $_ := set $objectData "shortName" $name -}}

      {{/* Call class to create the object */}}
      {{- include "tc.v1.common.class.traefik.middleware" (dict "rootCtx" $ "objectData" $objectData) -}}

    {{- end -}}

  {{- end -}}

{{- end -}}
