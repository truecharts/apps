{{/*
The gluetun sidecar container to be inserted.
*/}}
{{- define "tc.v1.common.addon.vpn.openvpn.containerModify" -}}


env:
{{- with $.Values.addons.vpn.env }}
  {{- . | toYaml | nindent 2 }}
{{- end }}
  {{- if and $.Values.addons.vpn.openvpn.username $.Values.addons.vpn.openvpn.password }}
  VPN_AUTH: {{ (printf "%v;%v" $.Values.addons.vpn.openvpn.username $.Values.addons.vpn.openvpn.password) }}
  {{- end -}}
{{- if $.Values.addons.vpn.killSwitch }}
{{- $ipv4list := $.Values.addons.vpn.excludedNetworks_IPv4 }}

{{- if $.Values.chartContext.podCIDR }}
{{- $ipv4list = append $ipv4list $.Values.chartContext.podCIDR }}
{{- end }}
{{- if $.Values.chartContext.svcCIDR }}
{{- $ipv4list = append $ipv4list $.Values.chartContext.svcCIDR }}
{{- end }}

  FIREWALL: "ON"
  {{- range $index, $value := $ipv4list }}
  ROUTE_{{ add $index 1 }}: {{ $value | quote }}
  {{- end }}
{{- if $.Values.addons.vpn.excludedNetworks_IPv6 }}
  {{- $excludednetworksv6 := "" -}}
  {{- range $.Values.addons.vpn.excludedNetworks_IPv4 -}}
    {{- $excludednetworksv6 = ( printf "%v;%v" $excludednetworksv6 . ) -}}
  {{- end }}
  {{- range $index, $value := $.Values.addons.vpn.excludedNetworks_IPv6 }}
  ROUTE6_{{ add $index 1 }}: {{ $value | quote }}
  {{- end }}
{{- end }}
{{- end -}}

{{- end -}}
