#!/usr/bin/env bash
min_seconds="${1:-1}"
max_seconds="${2:-3600}"
seconds="$(shuf -i "${min_seconds}"-"${max_seconds}" -n 1)"
function logz {
    msg="${1}"
    level="${2:-info}"
    printf "\e[1;32m%-6s\e[m\n" "timestamp=\"$(date +"%Y-%m-%dT%H:%M:%S%z")\" level=\"${level}\" msg=\"${msg}\""
}
function datez {
    secs="${1}"
    printf "%dh%dm%ds" $((secs/3600)) $((secs%3600/60)) $((secs%60))
}
printf "\e[1;32m%-6s\e[m\n" "$(logz "min seconds set to ${min_seconds}" "debug")"
printf "\e[1;32m%-6s\e[m\n" "$(logz "max seconds set to ${max_seconds}" "debug")"
printf "\e[1;32m%-6s\e[m\n" "$(logz "sleeping for $(datez "${seconds}")" "info")"
for ((i=seconds;i>0;i--)); do
    printf "\e[1;32m%-6s\e[m\n" "$(logz "sleeping for $(datez "${i}")" "info")"
    sleep 1
done
printf "\e[1;32m%-6s\e[m\n" "$(logz "done" "debug")"
