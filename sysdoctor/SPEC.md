# sysdoctor — SPEC

Self-verifying diagnostic/remediation scripts for recurring system failure modes on
`kirjolohi`, codifying three fixes already made once by hand: DNS resolution mode,
duplicate PipeWire/WirePlumber autostart units, and GPG key/subkey expiry.

## Repo layout

```
~/.scripts/sysdoctor/
  sysdoctor.sh                  # top-level runner, symlinked as `sysdoctor`
  lib/
    common.sh                   # sourced only: colors, log_*, json emit, exit-code constants
  checks/
    sysdoctor-check-dns.sh          # symlinked as `sysdoctor-check-dns`
    sysdoctor-check-pipewire.sh     # symlinked as `sysdoctor-check-pipewire`
    sysdoctor-check-gpg.sh          # symlinked as `sysdoctor-check-gpg`
  tests/
    test-dns.sh                 # manual, confirmation-gated, not run by the timer
    test-pipewire.sh
    test-gpg.sh
  systemd/
    sysdoctor-check.service
    sysdoctor-check.timer
  README.md
```

**Why prefixed check names, not `dns.sh`/`pipewire.sh`:** `meta/utils_update_symlinks.sh`
symlinks every executable found anywhere under `$SCRIPTS` flatly into `~/.local/bin` by
basename. Generic names would collide with existing or future scripts; `sysdoctor-check-*`
namespaces them and makes `sysdoctor-check-dns --fix` runnable standalone for debugging,
while the runner composes all three by calling them as subprocesses.

`lib/common.sh` is sourced, not executable, so it is invisible to the symlinker.

## CLI surface

`sysdoctor.sh [--check|--fix] [--json] [--only dns,pipewire,gpg] [-v]`

- Default mode is `--check` (detect only, never mutates).
- `--fix` runs detect → remediate → re-verify for each check; a check already healthy is
  skipped (idempotent, no-op).
- `--json` prints one JSON object per check to stdout instead of colorized text — no color
  codes mixed into JSON mode, ever.
- `--only` restricts to a comma-separated subset, for the timer or manual debugging.
- Exit code is the max severity across checks: `0` all healthy, `1` unhealthy found (`--check`
  mode) or remediation failed (`--fix` mode), `2` a check itself errored (couldn't determine
  state — e.g. missing binary).

Each individual `sysdoctor-check-*` script implements the same `--check|--fix|--json` surface
independently, so `sysdoctor.sh` is a thin loop that shells out to them and aggregates.

### JSON shape (one object per check)

```json
{"check": "dns", "status": "unhealthy", "detail": "resolv.conf mode: foreign", "fixed": null}
```

`status` ∈ `healthy|unhealthy|error`. `fixed` is `null` in `--check` mode, else `true|false`.

## Per-check design

### `dns` — systemd-resolved / NetworkManager resolv.conf mode
- **Detect (precise signal):** `resolvectl status` → `resolv.conf mode:` line. Healthy = `stub`.
  Unhealthy = `foreign` (NetworkManager writing resolv.conf directly while resolved is unfed).
- **Remediate (idempotent):** write `/etc/NetworkManager/conf.d/dns.conf` with
  `[main]\ndns=systemd-resolved` only if content differs; replace `/etc/resolv.conf` with a
  symlink to `/run/systemd/resolve/stub-resolv.conf` only if it isn't already that; restart
  `NetworkManager.service` only if either file changed.
- **Verify:** re-run the detect step, confirm `stub`.
- Requires `sudo`. Restarting NetworkManager briefly interrupts live connectivity (Tailscale
  included).

### `pipewire` — duplicate PipeWire/WirePlumber autostart
- **Detect:** any of `app-pipewire@autostart.service`, `app-pipewire\x2dpulse@autostart.service`,
  `app-wireplumber@autostart.service` reachable via `systemctl --user is-enabled` and **not**
  `masked`; or more than one WirePlumber process alive (`pgrep -c wireplumber` > 1); or a
  `~/.config/autostart/*.desktop` override using `X-LXQt-Autostart-disabled` instead of `Hidden=true`.
- **Remediate:** mask the three units, kill any WirePlumber PID not owned by
  `wireplumber.service`'s cgroup, restart `pipewire.service pipewire-pulse.service
  wireplumber.service`, fix any wrong-key `.desktop` override in place (rewrite the key, don't
  delete the file — unless it's fully redundant with the mask).
- **Verify:** re-run detect, confirm masked + single WirePlumber instance.
- User-level only, no `sudo`. Brief audio glitch on remediation.

### `gpg` — key/subkey expiry
- **Detect:** `gpg --list-keys --with-colons`, parse `pub`/`sub` expiry timestamps; unhealthy if
  any key/subkey is expired or expires within 30 days.
- **Remediate:** for each affected primary key and subkey, `gpg --quick-set-expire <fpr> <new-date> '*'`
  (mirrors the existing `gpg-renew` skill's logic). **Does not** auto-publish to the keyserver —
  that flow requires an out-of-band email verification and can't be safely automated; `--fix`
  prints a reminder with the exact `gpg --send-keys` command to run by hand.
- **Verify:** re-parse, confirm new expiry dates are ≥30 days out.
- Touches the real secret keyring in `--fix` mode. `--check` is read-only.

## Testing strategy (proving each script works)

Per your request, each check gets exercised end-to-end (induce → check catches it → fix →
re-check confirms healthy). Blast radius differs a lot per check, so:

- **`test-gpg.sh`** — fully safe to automate. Generates a disposable key in an isolated
  `GNUPGHOME=$(mktemp -d)` with a 1-minute expiry, waits for it to lapse, runs check/fix/check
  against that isolated homedir only. **Never touches your real keyring.**
- **`test-pipewire.sh`** — low blast radius (user-level, ~1-2s audio blip, self-healing by
  design). I'll run this one live during implementation without asking each time, since a
  failed run just means restarting the audio stack again.
- **`test-dns.sh`** — high blast radius: requires `sudo`, touches root-owned files, and
  restarting NetworkManager briefly drops your live network (including this Tailscale
  connection). Script will back up `/etc/resolv.conf` and `dns.conf` first and restore them
  in a trap on exit, but **I will ask for explicit go-ahead immediately before running it**,
  separately from approving this spec.

## systemd timer

`sysdoctor-check.timer` (user unit) → `sysdoctor-check.service` runs `sysdoctor.sh --check`
daily. On non-zero exit, the service's `ExecStopPost` fires `notify-send` with the unhealthy
check names (only on failure — silent on success, per your answer). Installed via a
`meta/run_once/`-style one-shot install step documented in the README, not auto-enabled by
the repo itself — you `systemctl --user enable --now sysdoctor-check.timer` yourself.

## Non-goals

- No auto-publish of GPG keys to a keyserver (email verification can't be scripted).
- No handling of the unrelated `minio.service` failure spotted earlier — out of scope.
- No Windows/other-distro portability — this targets kirjolohi's exact stack as profiled in
  `~/.claude/CLAUDE.md`.
- `--fix` never runs unattended beyond the daily `--check` timer; remediation is always a
  deliberate `sysdoctor --fix` invocation by you (or triggered by this session with your
  go-ahead), never automatic.

## Open question before I start building

The DNS live-network test above is the one piece of "prove it works" that's genuinely
disruptive on your only network connection to this machine. Confirm you want me to still run
it live (with backup/restore), or would you rather I skip live execution for `dns` and only
show you the script + a dry-run trace of what it would do?
