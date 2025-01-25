{{/*
The VPN config and scripts to be included.
*/}}
{{- define "tc.v1.common.addon.vpn.configmap" -}}
enabled: true
data:
{{- with .Values.addons.vpn.scripts.up }}
  up.sh: |-
    {{- . | nindent 4 }}
{{- end -}}

{{- with .Values.addons.vpn.scripts.down }}
  down.sh: |-
    {{- . | nindent 4 }}
{{- end -}}
{{- end -}}
