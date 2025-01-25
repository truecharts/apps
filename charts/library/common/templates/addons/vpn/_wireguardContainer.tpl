{{/*
The gluetun sidecar container to be inserted.
*/}}
{{- define "tc.v1.common.addon.vpn.wireguard.containerModify" -}}
env:
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

{{- end -}}
