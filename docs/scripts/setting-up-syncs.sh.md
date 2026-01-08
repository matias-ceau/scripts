# Mega sync bootstrap (per-host)

---

**setting-up-syncs.sh**: Register Mega sync pairs for XDG folders and host-specific storage

---

### Dependencies

- `bash`
- `hostnamectl` (from `systemd`) — used to detect the current machine name
- `mega-sync` — MEGA CLI command to create/manage a sync between a local folder and a MEGA path
- Mounted paths (host-specific): e.g. `/mnt/mega/...`, `/mnt/HDD2/...` (must exist before running)

### Description

This script centralizes the setup of your MEGA synchronization pairs, using the current hostname (`hostnamectl hostname`) to decide which extra syncs to configure.

It always registers:
- Standard XDG-like directories (`Desktop`, `Downloads`, `Documents`, etc.) into a per-host MEGA tree: `/BACKUPS/$HOST/...`
- Your notes/PKM directory: `~/PKM` ↔ `/PKM` (shared across hosts)

Then it branches by host:

- **Host `karhu`**
  - Syncs `~/UnifiedLibrary` to a shared MEGA folder `/UnifiedLibrary`
  - Syncs a quick-share device folder (`/mnt/mega/hauki/xiaomi_mega`) to `/HOST_QUICKSHARES/xiaomi_mega`
  - Syncs `/mnt/mega/karjala` to `/BACKUPS/karjala` (likely pulling another host’s backup locally)

- **Host `karjala`**
  - Syncs a different local UnifiedLibrary mount to `/UnifiedLibrary`
  - Syncs large media (`/mnt/HDD2/MEGA/AUDIOVISUAL`) to `/AUDIOVISUAL`
  - Syncs other hosts’ device mirrors into `/BACKUPS/*` and quickshares

This is ideal for an Arch + qtile setup where you want a single command (or autostart hook) to ensure all sync pairs exist after reinstall/migration.

### Usage

Run manually in a terminal (recommended the first time to spot mount/login issues):

    setting-up-syncs.sh

Typical workflow:

    # ensure MEGA is logged in and mounts exist
    mega-whoami
    mount | rg '/mnt/(mega|HDD2)'

    # register syncs
    ~/.scripts/bin/setting-up-syncs.sh

qtile autostart example:

    subprocess.Popen([os.path.expanduser("~/.scripts/bin/setting-up-syncs.sh")])

---

> [!TIP]
> Consider adding `set -euo pipefail` and quoting the hostname comparison (`[ "$HOST" = "karhu" ]`) for robustness. Also, `mega-sync` will error if local paths don’t exist; you may want to `mkdir -p` XDG folders and guard host-specific mountpoints with checks (e.g. `[[ -d /mnt/HDD2/MEGA ]] || exit 0`) to avoid noisy failures on laptops/offline states.