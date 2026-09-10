# sysdoctor

Self-verifying diagnostic/remediation scripts for recurring failure modes on this machine
(`kirjolohi`). Each check detects a precise broken-state signal, remediates it idempotently,
and re-verifies before reporting success.

## Usage

```
sysdoctor.sh [--check|--fix] [--json] [--only dns,pipewire,gpg] [-v]
```

(Symlinked onto `PATH` as `sysdoctor.sh`, keeping its extension — same convention as every
other script in this repo's `meta/utils_update_symlinks.sh`.)

- Default is `--check` (read-only, never mutates anything).
- `--fix` remediates anything unhealthy, then re-verifies. Already-healthy checks are a no-op.
- `--json` emits one JSON object per check (NDJSON) instead of colorized text.
- `--only` restricts to a comma-separated subset of checks.
- Exit code: `0` all healthy, `1` unhealthy (or a `--fix` attempt that didn't fully resolve it),
  `2` a check errored (e.g. a required binary is missing).

Each `checks/sysdoctor-check-*.sh` script implements the same flags and can be run standalone.

## Failure modes

### `dns` — NetworkManager vs systemd-resolved resolv.conf conflict
NetworkManager can write `/etc/resolv.conf` directly instead of deferring to
systemd-resolved's stub resolver. When that happens while `systemd-resolved.service` is
still running (but unfed), `resolvectl status` reports `resolv.conf mode: foreign` and DNS
resolution becomes inconsistent — notably breaking `tailscaled`, which expects the stub
resolver's MagicDNS wiring. The fix pins `dns=systemd-resolved` in a NetworkManager drop-in
and re-symlinks `/etc/resolv.conf` to the stub file, then restarts NetworkManager.

### `pipewire` — duplicate PipeWire/WirePlumber autostart
`systemd-xdg-autostart-generator` converts `/etc/xdg/autostart/{pipewire,pipewire-pulse,
wireplumber}.desktop` into `app-*@autostart.service` units every time
`xdg-desktop-autostart.target` fires — which happens on every Hyprland/uwsm session start,
not just at boot. If those generated units aren't masked, a second WirePlumber
session-manager instance can end up running alongside the real `wireplumber.service`,
corrupting shared session state until `wpctl status` and other WirePlumber-mediated queries
hang (plain PipeWire itself, e.g. `pw-cli info 0`, keeps working). The fix masks the three
autostart units, kills any WirePlumber process not owned by `wireplumber.service`, and
restarts the audio stack. It also removes any `~/.config/autostart/*.desktop` override using
the LXQt-only `X-LXQt-Autostart-disabled` key instead of the standard `Hidden=true` — the
generator ignores the former, so it fails to actually suppress anything.

### `gpg` — expiring or expired keys/subkeys
GPG keys carry an expiration date; if a primary key or subkey lapses, signing/encrypting
with it starts failing (and other people's clients may reject signatures from it). The check
looks only at `--list-secret-keys` (keys you hold the secret for), not the full public
keyring — a keyring accumulates other people's imported keys, most of which are naturally
expired and not yours to renew. `--fix` extends anything expired or expiring within 30 days
by 1 year via `gpg --quick-set-expire`.

**Non-obvious gpg behavior found while testing this script:** `quick-set-expire`'s trailing
subkey-fingerprints argument *retargets* the command onto those subkeys instead of also
covering the primary key — a single call with a trailing `*` only renews subkeys, not the
primary, even though the primary's own fingerprint is the first argument. Renewing both
requires two separate calls: one with no subkey argument (primary only), one with a trailing
`*` (all subkeys). Passing `*` on a key that has no subkeys at all silently no-ops (exit 0,
nothing changes) rather than erroring.

`--fix` never publishes the renewed key to a keyserver — that requires an out-of-band email
verification step that can't be safely scripted. It prints the `gpg --send-keys` command to
run by hand afterward.

## Testing

`tests/test-*.sh` prove each check end-to-end (induce the broken state → check catches it →
fix resolves it → check confirms healthy). Blast radius differs a lot per check:

- **`sysdoctor-test-gpg.sh`** — fully safe, fully automated. Generates a disposable key + subkey in an
  isolated `GNUPGHOME` (a fresh `mktemp -d`) with a 1-day expiry, so it's immediately
  "expiring soon" under the 30-day threshold with no need to wait. Never touches the real
  keyring.
- **`sysdoctor-test-pipewire.sh`** — user-level only, no `sudo`. Worst case is a ~1-2s audio glitch,
  which the fix itself resolves. Safe to run anytime.
- **`sysdoctor-test-dns.sh`** — high blast radius: needs `sudo`, replaces `/etc/resolv.conf` and
  `/etc/NetworkManager/conf.d/dns.conf`, and restarts NetworkManager twice (once via `--fix`,
  once via the test's own cleanup trap, which unconditionally restores the pre-test state
  regardless of what `--fix` already did). This briefly interrupts real network connectivity,
  Tailscale included. **Caveat observed while validating this script:** if you run it from a
  session that itself depends on network I/O to stay alive (e.g. a remote shell), the
  NetworkManager restart can cause that session's own process to receive `SIGPIPE` (exit 141)
  mid-run — the cleanup trap still fires and restores state correctly (verified via
  `resolvectl query` after such an interruption), but you won't see the script's own `PASS`
  line. Run it from a local terminal, or expect to double-check `sysdoctor.sh --check --only dns`
  afterward if run remotely.

## Installing the daily timer

```
mkdir -p ~/.config/systemd/user
ln -s ~/.scripts/sysdoctor/systemd/sysdoctor-check.service ~/.config/systemd/user/
ln -s ~/.scripts/sysdoctor/systemd/sysdoctor-check.timer ~/.config/systemd/user/
systemctl --user daemon-reload
systemctl --user enable --now sysdoctor-check.timer
```

Runs `sysdoctor.sh --check` daily (`RandomizedDelaySec=30min`, `Persistent=true` so a missed run
catches up after the machine was off). On failure only, `notify-send` fires a desktop
notification; on success it's silent. Check status any time with
`systemctl --user status sysdoctor-check.timer` or `journalctl --user -u sysdoctor-check`.

Not enabled automatically by this repo — install it yourself when you're ready.
