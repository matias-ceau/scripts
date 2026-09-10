#!/usr/bin/env bash
# Proves sysdoctor-check-gpg.sh works using a disposable key in an isolated GNUPGHOME.
# Never touches the real keyring: GNUPGHOME is exported to a fresh tmpdir for this
# whole script, and gpg (like this script) only ever looks at $GNUPGHOME.
set -euo pipefail

ROOT="$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")/.."
CHECK="$ROOT/checks/sysdoctor-check-gpg.sh"

export GNUPGHOME
GNUPGHOME="$(mktemp -d)"
cleanup() {
    gpgconf --kill gpg-agent >/dev/null 2>&1 || true
    rm -rf "$GNUPGHOME"
}
trap cleanup EXIT
chmod 700 "$GNUPGHOME"

echo "== generating a disposable key + subkey expiring in 1 day (isolated GNUPGHOME=$GNUPGHOME) =="
# Includes a subkey so the fix path that passes a trailing '*' to quick-set-expire
# (renew-all-subkeys) gets exercised too, not just the no-subkey path.
gpg --batch --quiet --generate-key <<'EOF'
%no-protection
Key-Type: EDDSA
Key-Curve: ed25519
Key-Usage: sign
Subkey-Type: ECDH
Subkey-Curve: cv25519
Subkey-Usage: encrypt
Name-Real: sysdoctor test key
Name-Email: sysdoctor-test@example.invalid
Expire-Date: 1d
%commit
EOF

echo "== check (expect unhealthy: expiring within 30d) =="
if "$CHECK" --check; then
    echo "FAIL: check reported healthy for a key expiring in 1 day" >&2
    exit 1
fi

echo "== fix =="
"$CHECK" --fix

echo "== check (expect healthy) =="
"$CHECK" --check

echo "PASS: sysdoctor-check-gpg.sh detects and fixes the induced state"
