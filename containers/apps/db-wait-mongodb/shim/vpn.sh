#!/usr/bin/env bash

if [[ "${WAIT_FOR_VPN:-"false"}" == "true" ]]; then
    echo "Waiting for VPN to be connected..."
    while ! grep -s -q "connected" /shared/vpnstatus; do
        echo "VPN not connected"
        sleep 2
    done
    echo "VPN Connected, starting application..."
fi
