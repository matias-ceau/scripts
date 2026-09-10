#!/usr/bin/env bash
# Shared helpers for sysdoctor checks. Sourced only, never executed directly.
set -euo pipefail

# Exit codes, shared contract across the runner and every check.
readonly SD_HEALTHY=0
readonly SD_UNHEALTHY=1
readonly SD_ERROR=2

SD_JSON=0
SD_VERBOSE=0

sd_color() {
    [[ -t 1 && "$SD_JSON" -eq 0 ]] || { cat; return; }
    case "$1" in
        green) printf '\033[32m%s\033[0m' "$(cat)" ;;
        red) printf '\033[31m%s\033[0m' "$(cat)" ;;
        yellow) printf '\033[33m%s\033[0m' "$(cat)" ;;
        blue) printf '\033[34m%s\033[0m' "$(cat)" ;;
        *) cat ;;
    esac
}

sd_log() {
    [[ "$SD_JSON" -eq 1 ]] && return 0
    local level="$1" msg="$2" color
    case "$level" in
        info) color=green ;;
        warn) color=yellow ;;
        error) color=red ;;
        debug) [[ "$SD_VERBOSE" -eq 1 ]] || return 0; color=blue ;;
    esac
    printf '%s\n' "$msg" | sd_color "$color" >&2
    printf '\n' >&2
}

# sd_report <check> <status: healthy|unhealthy|error> <detail> [fixed: true|false|null]
sd_report() {
    local check="$1" status="$2" detail="$3" fixed="${4:-null}"
    if [[ "$SD_JSON" -eq 1 ]]; then
        detail=${detail//\\/\\\\}
        detail=${detail//\"/\\\"}
        printf '{"check": "%s", "status": "%s", "detail": "%s", "fixed": %s}\n' \
            "$check" "$status" "$detail" "$fixed"
    else
        local badge
        case "$status" in
            healthy) badge=$(printf 'OK' | sd_color green) ;;
            unhealthy) badge=$(printf 'UNHEALTHY' | sd_color yellow) ;;
            error) badge=$(printf 'ERROR' | sd_color red) ;;
        esac
        printf '[%s] %-9s %s\n' "$badge" "$check" "$detail"
    fi
    case "$status" in
        healthy) return "$SD_HEALTHY" ;;
        unhealthy) return "$SD_UNHEALTHY" ;;
        error) return "$SD_ERROR" ;;
    esac
}

# sd_emit_lines <array-name> — printf '%s\n' "${arr[@]}" but safe on an empty array
# (that idiom alone emits one phantom blank line, since the %s directive still applies
# once with zero arguments — a mapfile reader on the other end would see 1 empty element
# instead of 0).
sd_emit_lines() {
    local -n _sd_arr="$1"
    [[ ${#_sd_arr[@]} -gt 0 ]] && printf '%s\n' "${_sd_arr[@]}"
    return 0
}

# sd_finish <check> <status> <detail> [fixed] — reports then exits with the matching code.
sd_finish() {
    sd_report "$@" || exit $?
    exit 0
}

# sd_parse_args reads --check/--fix/--json/-v from "$@" into SD_MODE/SD_JSON/SD_VERBOSE.
sd_parse_args() {
    SD_MODE="check"
    for arg in "$@"; do
        case "$arg" in
            --check) SD_MODE="check" ;;
            --fix) SD_MODE="fix" ;;
            --json) SD_JSON=1 ;;
            -v|--verbose) SD_VERBOSE=1 ;;
        esac
    done
}
