#!/usr/bin/env bash
#INFO:#@SYS@=2026-08= "detect/fix duplicate PipeWire/WirePlumber autostart units"
set -euo pipefail

SELF="$(readlink -f "${BASH_SOURCE[0]}")"
source "$(dirname "$SELF")/../lib/common.sh"
sd_parse_args "$@"

readonly UNITS=(
    "app-pipewire@autostart.service"
    "app-pipewire\x2dpulse@autostart.service"
    "app-wireplumber@autostart.service"
)
readonly BAD_DESKTOP_FILES=(
    "$HOME/.config/autostart/pipewire.desktop"
    "$HOME/.config/autostart/pipewire-pulse.desktop"
    "$HOME/.config/autostart/wireplumber.desktop"
)

unmasked_units() {
    local u state out=()
    for u in "${UNITS[@]}"; do
        state=$(systemctl --user is-enabled "$u" 2>/dev/null || true)
        [[ "$state" == "masked" ]] || out+=("$u")
    done
    sd_emit_lines out
}

duplicate_wireplumber_pids() {
    local main_pid all_pids pid out=()
    main_pid=$(systemctl --user show -p MainPID --value wireplumber.service 2>/dev/null || echo 0)
    all_pids=$(pgrep -x wireplumber || true)
    for pid in $all_pids; do
        [[ "$pid" == "$main_pid" ]] || out+=("$pid")
    done
    sd_emit_lines out
}

stale_desktop_files() {
    local f out=()
    for f in "${BAD_DESKTOP_FILES[@]}"; do
        [[ -f "$f" ]] && grep -q '^X-LXQt-Autostart-disabled=' "$f" && out+=("$f")
    done
    sd_emit_lines out
}

pw_findings() {
    local unmasked dup_pids stale findings=()
    mapfile -t unmasked < <(unmasked_units)
    mapfile -t dup_pids < <(duplicate_wireplumber_pids)
    mapfile -t stale < <(stale_desktop_files)
    [[ ${#unmasked[@]} -eq 0 ]] || findings+=("${#unmasked[@]} autostart unit(s) not masked")
    [[ ${#dup_pids[@]} -eq 0 ]] || findings+=("${#dup_pids[@]} duplicate wireplumber process(es)")
    [[ ${#stale[@]} -eq 0 ]] || findings+=("${#stale[@]} stale autostart override(s) using the wrong disable key")
    printf '%s; ' "${findings[@]}"
}

pw_healthy() {
    local unmasked dup_pids stale
    mapfile -t unmasked < <(unmasked_units)
    mapfile -t dup_pids < <(duplicate_wireplumber_pids)
    mapfile -t stale < <(stale_desktop_files)
    [[ ${#unmasked[@]} -eq 0 && ${#dup_pids[@]} -eq 0 && ${#stale[@]} -eq 0 ]]
}

pw_remediate() {
    local unmasked dup_pids stale pid f
    mapfile -t unmasked < <(unmasked_units)
    if [[ ${#unmasked[@]} -gt 0 ]]; then
        sd_log debug "masking: ${unmasked[*]}"
        systemctl --user mask "${unmasked[@]}"
    fi

    mapfile -t dup_pids < <(duplicate_wireplumber_pids)
    for pid in "${dup_pids[@]}"; do
        [[ -n "$pid" ]] || continue
        sd_log debug "killing duplicate wireplumber pid $pid"
        kill "$pid" 2>/dev/null || true
    done

    mapfile -t stale < <(stale_desktop_files)
    for f in "${stale[@]}"; do
        [[ -n "$f" ]] || continue
        sd_log debug "removing stale override $f (superseded by unit mask)"
        rm -f "$f"
    done

    sd_log debug "restarting pipewire/pipewire-pulse/wireplumber user services"
    systemctl --user restart pipewire.service pipewire-pulse.service wireplumber.service
    sleep 1
}

command -v systemctl >/dev/null || sd_finish pipewire error "systemctl not found"

if pw_healthy; then
    sd_finish pipewire healthy "single wireplumber instance, autostart units masked" \
        "$([[ "$SD_MODE" == fix ]] && echo false || echo null)"
fi

if [[ "$SD_MODE" == "check" ]]; then
    sd_finish pipewire unhealthy "$(pw_findings)"
fi

before="$(pw_findings)"
pw_remediate
if pw_healthy; then
    sd_finish pipewire healthy "remediated: $before" true
else
    sd_finish pipewire error "remediation incomplete: $(pw_findings)" false
fi
