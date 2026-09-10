#!/usr/bin/env bash
#INFO:#@SYS@=2026-08= "detect/fix NetworkManager vs systemd-resolved resolv.conf conflicts"
set -euo pipefail

SELF="$(readlink -f "${BASH_SOURCE[0]}")"
source "$(dirname "$SELF")/../lib/common.sh"
sd_parse_args "$@"

readonly NM_CONF="/etc/NetworkManager/conf.d/dns.conf"
readonly RESOLV="/etc/resolv.conf"
readonly STUB="/run/systemd/resolve/stub-resolv.conf"

dns_mode() {
    resolvectl status 2>/dev/null | awk -F': ' '/resolv.conf mode:/ {print $2; exit}'
}

dns_healthy() {
    [[ "$(dns_mode)" == "stub" ]]
}

dns_remediate() {
    local changed=0
    if [[ ! -f "$NM_CONF" ]] || ! grep -qx 'dns=systemd-resolved' "$NM_CONF" 2>/dev/null; then
        sd_log debug "writing $NM_CONF"
        sudo mkdir -p "$(dirname "$NM_CONF")"
        printf '[main]\ndns=systemd-resolved\n' | sudo tee "$NM_CONF" >/dev/null
        changed=1
    fi
    if [[ "$(readlink -f "$RESOLV" 2>/dev/null)" != "$STUB" ]]; then
        sd_log debug "relinking $RESOLV -> $STUB"
        sudo ln -sf "$STUB" "$RESOLV"
        changed=1
    fi
    if [[ "$changed" -eq 1 ]]; then
        sd_log debug "restarting NetworkManager.service"
        sudo systemctl restart NetworkManager.service
        sleep 2
    fi
}

command -v resolvectl >/dev/null || sd_finish dns error "resolvectl not found"

if dns_healthy; then
    sd_finish dns healthy "resolv.conf mode: stub" "$([[ "$SD_MODE" == fix ]] && echo false || echo null)"
fi

mode="$(dns_mode)"
if [[ "$SD_MODE" == "check" ]]; then
    sd_finish dns unhealthy "resolv.conf mode: ${mode:-unknown} (expected stub)"
fi

dns_remediate
if dns_healthy; then
    sd_finish dns healthy "remediated: resolv.conf mode now stub" true
else
    sd_finish dns error "remediation left resolv.conf mode: $(dns_mode) (expected stub)" false
fi
