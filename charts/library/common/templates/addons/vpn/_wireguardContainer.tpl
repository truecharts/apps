{{/*
The gluetun sidecar container to be inserted.
*/}}
{{- define "tc.v1.common.addon.vpn.wireguard.container" -}}
enabled: true
imageSelector: wireguardImage
probes:
{{- if $.Values.addons.vpn.livenessProbe }}
  liveness:
  {{- toYaml . | nindent 2 }}
{{- else }}
  liveness:
    enabled: false
{{- end }}
  readiness:
    enabled: false
  startup:
    enabled: false
resources:
  excludeExtra: true
securityContext:
  runAsUser: 568
  runAsGroup: 568
  readOnlyRootFilesystem: false
  allowPrivilegeEscalation: true
  capabilities:
    add:
      - AUDIT_WRITE
      - NET_ADMIN
      - SETUID
      - SETGID
      - SYS_MODULE

env:
{{- with $.Values.addons.vpn.env }}
  {{- . | toYaml | nindent 2 }}
{{- end }}
  SEPARATOR: ";"
  IPTABLES_BACKEND: "nft"
{{- if $.Values.addons.vpn.killSwitch }}
  KILLSWITCH: "true"
  {{- $excludednetworksv4 := ( printf "%v;%v" $.Values.chartContext.podCIDR $.Values.chartContext.svcCIDR ) -}}
  {{- range $.Values.addons.vpn.excludedNetworks_IPv4 -}}
    {{- $excludednetworksv4 = ( printf "%v;%v" $excludednetworksv4 . ) -}}
  {{- end }}
  KILLSWITCH_EXCLUDEDNETWORKS_IPV4: {{ $excludednetworksv4 | quote }}
{{- if $.Values.addons.vpn.excludedNetworks_IPv6 -}}
  {{- $excludednetworksv6 := "" -}}
  {{- range $.Values.addons.vpn.excludedNetworks_IPv4 -}}
    {{- $excludednetworksv6 = ( printf "%v;%v" $excludednetworksv6 . ) -}}
  {{- end }}
  KILLSWITCH_EXCLUDEDNETWORKS_IPV6: {{ $.Values.addons.vpn.excludedNetworks_IPv6 | quote }}
{{- end -}}
{{- end -}}

{{- range $envList := $.Values.addons.vpn.envList -}}
  {{- if and $envList.name $envList.value }}
  {{ $envList.name }}: {{ $envList.value | quote }}
  {{- else -}}
    {{- fail "Please specify name/value for VPN environment variable" -}}
  {{- end -}}
{{- end -}}

{{- with $.Values.addons.vpn.args }}
args:
  {{- . | toYaml | nindent 2 }}
{{- end -}}
{{- end -}}
