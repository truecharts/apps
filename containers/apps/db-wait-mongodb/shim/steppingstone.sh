#!/usr/bin/env bash
#shellcheck disable=SC1091
source "/shim/umask.sh"
source "/shim/vpn.sh"
echo "---Checking for optional user script---"
if [ -f /custom/user.sh ]; then
    echo "---Found optional script, executing---"
    chmod +x /custom/user.sh
    /custom/user.sh
else
    echo "---No optional user script found, continuing---"
fi
echo "---Checking for container script---"
if [ -f /custom/start.sh ]; then
    echo "---Found container script, executing---"
    chmod +x /custom/start.sh
    /custom/start.sh
else
    echo "---No container script found, continuing---"
fi
