{{/*
The volume (referencing VPN scripts) to be inserted into persistence.
*/}}
{{- define "tc.v1.common.addon.vpn.volume.scripts" -}}
{{- $basePath := (include "tc.v1.common.addon.vpn.volume.basePath" .) }}
enabled: true
type: configmap
objectName: vpnscripts
expandObjectName: false
defaultMode: "0777"
items:
{{- if .Values.addons.vpn.scripts.up }}
- key: up.sh
  path: up.sh
{{- end -}}
{{- if .Values.addons.vpn.scripts.down }}
- key: down.sh
  path: down.sh
{{- end }}
targetSelector:
  {{- range .Values.addons.vpn.targetSelector }}
  {{ . }}:
    vpn:
      mountPath: {{ $basePath }}
  {{- end -}}
{{- end -}}

{{/*
The volume (referencing VPN config) to be inserted into persistence.
*/}}
{{- define "tc.v1.common.addon.vpn.volume.config" -}}
{{- $basePath := (include "tc.v1.common.addon.vpn.volume.basePath" .) }}
{{- $mountPath := $basePath }}

enabled: true
{{- if or .Values.addons.vpn.config .Values.addons.vpn.existingSecret }}
type: secret
defaultMode: "0777"
items:
  - key: vpn.conf
    path: vpn.conf
{{- if .Values.addons.vpn.existingSecret }}
objectName: {{ .Values.addons.vpn.existingSecret }}
expandObjectName: false
{{- else }}
objectName: vpnconfig
expandObjectName: true
{{- end -}}
{{- else }}
{{- $mountPath = (printf "%s/vpn.conf" $basePath) }}
type: hostPath
hostPath: {{ .Values.addons.vpn.configFile | default "/vpn" }}
hostPathType: "File"
autoPermissions:
  enabled: true
  chown: true
  user: 568
  group: 568
{{- end }}
targetSelector:
  {{- range .Values.addons.vpn.targetSelector }}
  {{ . }}:
    vpn:
      mountPath: {{ $mountPath }}
  {{- end -}}
{{- end -}}

{{/*
The volume (referencing VPN config folder) to be inserted into persistence.
*/}}
{{- define "tc.v1.common.addon.vpn.volume.folder" -}}
{{- $basePath := (include "tc.v1.common.addon.vpn.volume.basePath" .) }}
enabled: true
type: hostPath
hostPath: {{ .Values.addons.vpn.configFolder | quote }}
autoPermissions:
  enabled: true
  chown: true
  user: 568
  group: 568
targetSelector:
  {{- range .Values.addons.vpn.targetSelector }}
  {{ . }}:
    vpn:
      mountPath: {{ $basePath }}
  {{- end -}}
{{- end -}}


{{/*
The empty tailscale folder
*/}}
{{- define "tc.v1.common.addon.vpn.volume.tailscale" -}}
enabled: true
type: emptyDir
targetSelector:
  {{- range .Values.addons.vpn.targetSelector }}
  {{ . }}:
    tailscale:
      mountPath: /var/lib/tailscale
  {{- end -}}
{{- end -}}

{{- define "tc.v1.common.addon.vpn.volume.basePath" -}}
  {{- $basePath := "/vpn" -}} {{/* Base Path for OVPN */}}
  {{- if eq .Values.addons.vpn.type "wireguard" -}}
    {{- $basePath = "/etc/wireguard" -}} {{/* Base Path for Wireguard */}}
  {{- else if eq .Values.addons.vpn.type "gluetun" -}}
    {{- $basePath = "/gluetun" -}} {{/* Base Path for Gluetun */}}
  {{- end -}}
  {{- $basePath -}}
{{- end -}}
