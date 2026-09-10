#!/usr/bin/env bash
#INFO:#@SYS@=2026-08= "detect/fix expiring or expired GPG keys and subkeys"
set -euo pipefail

SELF="$(readlink -f "${BASH_SOURCE[0]}")"
source "$(dirname "$SELF")/../lib/common.sh"
sd_parse_args "$@"

# How far out --fix pushes expiry when a key/subkey is expired or expiring soon.
# gpg's --quick-set-expire wants a bare relative spec ("1y"), not "+1y".
readonly RENEW_TO="1y"
readonly WARN_DAYS=30

gpg_findings() {
    local now threshold
    now=$(date +%s)
    threshold=$((now + WARN_DAYS * 86400))
    gpg --list-secret-keys --with-colons 2>/dev/null | awk -F: -v now="$now" -v threshold="$threshold" '
        $1=="sec" { revoked=($2=="r") }
        ($1=="sec" || $1=="ssb") && !revoked && $7 != "" {
            if ($7 < now) { n_expired++ }
            else if ($7 < threshold) { n_expiring++ }
        }
        END {
            if (n_expired)  printf "%d expired; ", n_expired
            if (n_expiring) printf "%d expiring within '"$WARN_DAYS"'d; ", n_expiring
        }'
}

# Primary-key fingerprints (that we hold the secret for) with any expired/soon-expiring
# sec or ssb record. Revoked keys are excluded entirely: revocation is permanent and
# extending expiry on a revoked key is meaningless.
gpg_affected_primary_fprs() {
    local now threshold
    now=$(date +%s)
    threshold=$((now + WARN_DAYS * 86400))
    gpg --list-secret-keys --with-colons 2>/dev/null | awk -F: -v now="$now" -v threshold="$threshold" '
        $1=="sec" { primary=""; flagged=0; revoked=($2=="r") }
        $1=="fpr" && primary=="" { primary=$10 }
        ($1=="sec" || $1=="ssb") && $7 != "" && $7 < threshold { flagged=1 }
        flagged && primary!="" && !revoked { print primary }
    ' | sort -u
}

gpg_healthy() {
    [[ -z "$(gpg_findings)" ]]
}

gpg_remediate() {
    local fpr out has_subkeys
    while IFS= read -r fpr; do
        [[ -n "$fpr" ]] || continue
        sd_log debug "extending expiry for $fpr to $RENEW_TO"
        # quick-set-expire's trailing subkey-fprs argument RETARGETS the command onto
        # those subkeys instead of extending the primary too — a plain call (no 3rd arg)
        # is required to renew the primary itself, and a trailing '*' call is required to
        # renew every subkey. Neither call covers what the other does.
        out=$(gpg --batch --quick-set-expire "$fpr" "$RENEW_TO" 2>&1) || true
        sd_log debug "$out"
        has_subkeys=$(gpg --list-secret-keys --with-colons "$fpr" 2>/dev/null | awk -F: '$1=="ssb"{print; exit}')
        if [[ -n "$has_subkeys" ]]; then
            out=$(gpg --batch --quick-set-expire "$fpr" "$RENEW_TO" '*' 2>&1) || true
            sd_log debug "$out"
        fi
    done < <(gpg_affected_primary_fprs)
}

command -v gpg >/dev/null || sd_finish gpg error "gpg not found"

if gpg_healthy; then
    sd_finish gpg healthy "no key/subkey expired or expiring within ${WARN_DAYS}d" \
        "$([[ "$SD_MODE" == fix ]] && echo false || echo null)"
fi

if [[ "$SD_MODE" == "check" ]]; then
    sd_finish gpg unhealthy "$(gpg_findings)"
fi

gpg_remediate
if gpg_healthy; then
    sd_finish gpg healthy "remediated locally, renewed to $RENEW_TO — publish manually: gpg --send-keys --keyserver keys.openpgp.org <fpr>" true
else
    sd_finish gpg error "remediation incomplete: $(gpg_findings)" false
fi
