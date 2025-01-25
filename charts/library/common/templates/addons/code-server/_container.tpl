{{/*
The code-server sidecar container to be inserted.
*/}}
{{- define "tc.v1.common.addon.codeserver.container" -}}
enabled: true
probes:
  liveness:
    enabled: true
    port: {{ .Values.addons.codeserver.service.ports.codeserver.port }}
    path: "/"
  readiness:
    enabled: true
    port: {{ .Values.addons.codeserver.service.ports.codeserver.port }}
    path: "/"
  startup:
    enabled: true
    port: {{ .Values.addons.codeserver.service.ports.codeserver.port }}
    path: "/"
imageSelector: "codeserverImage"
imagePullPolicy: {{ .Values.codeserverImage.pullPolicy }}
resources:
  excludeExtra: true
securityContext:
  runAsUser: 0
  runAsGroup: 0
  runAsNonRoot: false
  readOnlyRootFilesystem: false
env:
{{- range $envList := .Values.addons.codeserver.envList -}}
  {{- if and $envList.name $envList.value }}
  {{ $envList.name }}: {{ $envList.value | quote }}
  {{- else }}
    {{- fail "Please specify name/value for codeserver environment variable" -}}
  {{- end -}}
{{- end -}}
{{- with .Values.addons.codeserver.env -}}
{{- range $k, $v := . }}
  {{ $k }}: {{ $v | quote }}
{{- end -}}
{{- end }}
args:
{{- range .Values.addons.codeserver.args }}
- {{ . | quote }}
{{- end }}
- "--port"
- "{{ .Values.addons.codeserver.service.ports.codeserver.port }}"
- {{ .Values.addons.codeserver.workingDir | default "/" }}
{{- end -}}
