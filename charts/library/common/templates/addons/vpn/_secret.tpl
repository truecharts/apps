{{/*
The OpenVPN config secret to be included.
*/}}
{{- define "tc.v1.common.addon.vpn.secret" -}}
enabled: true
data:
  vpn.conf: |-
    {{- .Values.addons.vpn.config | nindent 4 }}
{{- end -}}
