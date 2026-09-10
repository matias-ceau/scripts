#!/usr/bin/env bash
#INFO:#@SYS@=2026-08= "run sysdoctor checks: DNS, PipeWire/WirePlumber autostart, GPG expiry"
set -euo pipefail

SELF="$(readlink -f "${BASH_SOURCE[0]}")"
ROOT="$(dirname "$SELF")"
source "$ROOT/lib/common.sh"

ONLY=""
ARGS=()
while [[ $# -gt 0 ]]; do
    case "$1" in
        --only) ONLY="$2"; shift 2 ;;
        --only=*) ONLY="${1#--only=}"; shift ;;
        *) ARGS+=("$1"); shift ;;
    esac
done
sd_parse_args "${ARGS[@]}"

declare -a checks_to_run=()
if [[ -n "$ONLY" ]]; then
    IFS=',' read -ra names <<< "$ONLY"
    for n in "${names[@]}"; do
        f="$ROOT/checks/sysdoctor-check-$n.sh"
        [[ -x "$f" ]] || { sd_log error "unknown check: $n (no $f)"; exit "$SD_ERROR"; }
        checks_to_run+=("$f")
    done
else
    checks_to_run=("$ROOT"/checks/sysdoctor-check-*.sh)
fi

max_status=0
healthy_count=0
for f in "${checks_to_run[@]}"; do
    status=0
    "$f" "${ARGS[@]}" || status=$?
    [[ "$status" -eq "$SD_HEALTHY" ]] && healthy_count=$((healthy_count + 1))
    (( status > max_status )) && max_status=$status
done

if [[ "$SD_JSON" -eq 0 ]]; then
    printf '%s/%s checks healthy\n' "$healthy_count" "${#checks_to_run[@]}" >&2
fi

exit "$max_status"
