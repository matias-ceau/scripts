#!/usr/bin/env bash
# Induces the duplicate-autostart broken state (user-level only, no sudo), proves
# sysdoctor-check-pipewire.sh detects it, fixes it, and re-verifies. Safe to run live:
# worst case is a brief audio glitch, which the fix itself resolves.
set -euo pipefail

ROOT="$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")/.."
CHECK="$ROOT/checks/sysdoctor-check-pipewire.sh"
STALE_DESKTOP="$HOME/.config/autostart/wireplumber.desktop"

extra_pid=""
cleanup() {
    [[ -n "$extra_pid" ]] && kill "$extra_pid" 2>/dev/null || true
    rm -f "$STALE_DESKTOP"
    systemctl --user mask app-wireplumber@autostart.service >/dev/null 2>&1 || true
}
trap cleanup EXIT

echo "== inducing broken state =="
systemctl --user unmask app-wireplumber@autostart.service
/usr/bin/wireplumber &
extra_pid=$!
sleep 1
mkdir -p "$(dirname "$STALE_DESKTOP")"
printf '[Desktop Entry]\nType=Application\nExec=true\nX-LXQt-Autostart-disabled=true\n' > "$STALE_DESKTOP"

echo "== check (expect unhealthy) =="
if "$CHECK" --check; then
    echo "FAIL: check reported healthy while state was induced broken" >&2
    exit 1
fi

echo "== fix =="
"$CHECK" --fix
extra_pid=""  # fix already killed it; avoid a redundant kill in cleanup

echo "== check (expect healthy) =="
"$CHECK" --check

echo "PASS: sysdoctor-check-pipewire.sh detects and fixes the induced state"
