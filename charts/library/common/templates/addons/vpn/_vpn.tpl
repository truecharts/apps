{{/*
Template to render VPN addon
It will include / inject the required templates based on the given values.
*/}}
{{- define "tc.v1.common.addon.vpn" -}}
{{- if ne "disabled" .Values.addons.vpn.type -}}


  {{- if .Values.addons.vpn.config -}}
    {{/* Append the vpn config secret to the secrets */}}
    {{- $secret := include "tc.v1.common.addon.vpn.secret" . | fromYaml -}}
    {{- if $secret -}}
      {{- $_ := set .Values.secret "vpnconfig" $secret -}}
    {{- end -}}
  {{- end }}

  {{- if or .Values.addons.vpn.scripts.up .Values.addons.vpn.scripts.down -}}
    {{/* Append the vpn up/down scripts to the configmaps */}}
    {{- $configmap := include "tc.v1.common.addon.vpn.configmap" . | fromYaml -}}
    {{- if $configmap -}}
      {{- $_ := set .Values.configmap "vpnscripts" $configmap -}}
    {{- end -}}
  {{- end }}

  {{- if or .Values.addons.vpn.configFile .Values.addons.vpn.config .Values.addons.vpn.existingSecret -}}
    {{/* Append the vpn config to the persistence */}}
    {{- $configper := include "tc.v1.common.addon.vpn.volume.config" . | fromYaml -}}
    {{- if $configper -}}
      {{- $_ := set .Values.persistence "vpnconfig" $configper -}}
    {{- end -}}
  {{- end -}}

  {{- if or .Values.addons.vpn.scripts.up .Values.addons.vpn.scripts.down -}}
    {{/* Append the vpn scripts to the persistence */}}
    {{- $scriptsper := include "tc.v1.common.addon.vpn.volume.scripts" . | fromYaml -}}
    {{- if $scriptsper -}}
      {{- $_ := set .Values.persistence "vpnscripts" $scriptsper -}}
    {{- end -}}
  {{- end -}}

  {{- if .Values.addons.vpn.configFolder -}}
    {{/* Append the vpn folder to the persistence */}}
    {{- $folderper := include "tc.v1.common.addon.vpn.volume.folder" . | fromYaml -}}
    {{- if $folderper -}}
      {{- $_ := set .Values.persistence "vpnfolder" $folderper -}}
    {{- end -}}
  {{- end -}}

  {{/* Ensure target Selector defaults to main pod even if unset */}}
  {{- $targetSelector := list "main" -}}
  {{- if $.Values.addons.vpn.targetSelector -}}
    {{- $targetSelector = $.Values.addons.vpn.targetSelector -}}
  {{- end -}}

  {{/* Append the vpn container to the containers */}}
  {{- range $targetSelector -}}
    {{- $container := dict -}}
    {{- $containerModify := dict -}}
    {{- if eq "gluetun" $.Values.addons.vpn.type -}}
      {{- $container = $.Values.addons.vpn.gluetun.container -}}
      {{- $containerModify = include "tc.v1.common.addon.vpn.gluetun.containerModify" $ | fromYaml -}}

    {{- else if eq "tailscale" $.Values.addons.vpn.type -}}
      {{/* FIXME: https://github.com/tailscale/tailscale/issues/8188 */}}
      {{- $_ := set $.Values.podOptions "automountServiceAccountToken" true -}}
      {{- $container = $.Values.addons.vpn.tailscale.container -}}
      {{- $containerModify = include "tc.v1.common.addon.vpn.tailscale.containerModify" $ | fromYaml -}}

    {{- else if eq "openvpn" $.Values.addons.vpn.type -}}
      {{- $container = $.Values.addons.vpn.openvpn.container -}}
      {{- $containerModify = include "tc.v1.common.addon.vpn.openvpn.containerModify" $ | fromYaml -}}

    {{- else if eq "wireguard" $.Values.addons.vpn.type -}}
      {{- $container = $.Values.addons.vpn.wireguard.container -}}
      {{- $containerModify = include "tc.v1.common.addon.vpn.wireguard.containerModify" $ | fromYaml -}}

    {{- end -}}
    {{- if $container.enabled -}}
   {{- range $targetSelector -}}
      {{- $mergedContainer := mustMergeOverwrite $container $containerModify -}}
      {{- $workload := get $.Values.workload . -}}
      {{- $_ := set $workload.podSpec.containers "vpn" $mergedContainer -}}
      {{- $end -}}
    {{- end -}}
  {{- end -}}

  {{- if eq "tailscale" $.Values.addons.vpn.type -}}
    {{/* Append the empty tailscale folder to the persistence */}}
    {{- $tailscaledir := include "tc.v1.common.addon.vpn.volume.tailscale" . | fromYaml -}}
    {{- if $tailscaledir -}}
      {{- $_ := set .Values.persistence "tailscalestate" $tailscaledir -}}
    {{- end -}}
  {{- end -}}

{{- end -}}
{{- end -}}
