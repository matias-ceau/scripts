#!/usr/bin/env bash
# Induces the "foreign" resolv.conf mode broken state and proves sysdoctor-check-dns.sh
# detects and fixes it. HIGH BLAST RADIUS: requires sudo, restarts NetworkManager during
# --fix (briefly drops network connectivity, Tailscale included). Backs up /etc/resolv.conf
# and the NetworkManager dns.conf drop-in first and unconditionally restores them in a
# trap on exit, regardless of what --fix already did, so the machine ends up byte-for-byte
# where it started.
set -euo pipefail

ROOT="$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")/.."
CHECK="$ROOT/checks/sysdoctor-check-dns.sh"
RESOLV="/etc/resolv.conf"
NM_CONF="/etc/NetworkManager/conf.d/dns.conf"
BACKUP_DIR="$(mktemp -d)"

cleanup() {
    echo "== restoring original state ==" >&2
    if [[ -f "$BACKUP_DIR/resolv.conf.link" ]]; then
        sudo ln -sf "$(cat "$BACKUP_DIR/resolv.conf.link")" "$RESOLV"
    elif [[ -f "$BACKUP_DIR/resolv.conf" ]]; then
        sudo cp "$BACKUP_DIR/resolv.conf" "$RESOLV"
    fi
    if [[ -f "$BACKUP_DIR/dns.conf" ]]; then
        sudo cp "$BACKUP_DIR/dns.conf" "$NM_CONF"
    elif [[ -f "$BACKUP_DIR/dns.conf.absent" ]]; then
        sudo rm -f "$NM_CONF"
    fi
    sudo systemctl restart NetworkManager.service
    rm -rf "$BACKUP_DIR"
}
trap cleanup EXIT

echo "== backing up current state to $BACKUP_DIR ==" >&2
if [[ -L "$RESOLV" ]]; then
    readlink -f "$RESOLV" > "$BACKUP_DIR/resolv.conf.link"
else
    sudo cp "$RESOLV" "$BACKUP_DIR/resolv.conf"
fi
if [[ -f "$NM_CONF" ]]; then
    sudo cp "$NM_CONF" "$BACKUP_DIR/dns.conf"
else
    touch "$BACKUP_DIR/dns.conf.absent"
fi

echo "== inducing broken state (foreign resolv.conf mode) ==" >&2
sudo rm -f "$NM_CONF"
# resolv.conf is currently a symlink into the stub file resolved actively rewrites —
# writing through it with tee would just get clobbered. Remove the symlink itself first
# so the replacement is a genuine plain file, matching how NetworkManager broke it originally.
sudo rm -f "$RESOLV"
printf 'nameserver 127.0.0.1\n' | sudo tee "$RESOLV" >/dev/null
sleep 1  # resolved picks up the change via inotify; give it a beat before checking

echo "== check (expect unhealthy) ==" >&2
if "$CHECK" --check; then
    echo "FAIL: check reported healthy while state was induced broken" >&2
    exit 1
fi

echo "== fix (this restarts NetworkManager) ==" >&2
"$CHECK" --fix

echo "== check (expect healthy) ==" >&2
"$CHECK" --check

echo "PASS: sysdoctor-check-dns.sh detects and fixes the induced state" >&2
