{{/*
The code-server sidecar container to be inserted.
*/}}
{{- define "tc.v1.common.addon.netshoot.container" -}}
enabled: true
command:
  - /bin/sh
  - -c
  - sleep infinity
probes:
  liveness:
    enabled: false
  readiness:
    enabled: false
  startup:
    enabled: false
imageSelector: "netshootImage"
resources:
  excludeExtra: true
securityContext:
  runAsUser: 0
  runAsGroup: 0
  runAsNonRoot: false
  readOnlyRootFilesystem: false
  capabilities:
    add:
      - NET_ADMIN
      - NET_RAW
env:
{{- range $envList := $.Values.addons.netshoot.envList -}}
  {{- if and $envList.name $envList.value }}
  {{ $envList.name }}: {{ $envList.value | quote }}
  {{- else }}
    {{- fail "Please specify name/value for netshoot environment variable" -}}
  {{- end -}}
{{- end -}}
{{- with $.Values.addons.netshoot.env -}}
{{- range $k, $v := . }}
  {{ $k }}: {{ $v | quote }}
{{- end -}}
{{- end }}
args:
{{- range $.Values.addons.netshoot.args }}
- {{ . | quote }}
{{- end }}
{{- end -}}
