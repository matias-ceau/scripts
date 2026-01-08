# Ousse database refresh (old)

---

**old-ousse**: Generate multiple `locate` databases for different filesystem scopes

---

### Dependencies

- `updatedb` (from `mlocate`/`plocate`) — builds `locate`-compatible databases
- `fd` — fast directory discovery used to build prune lists
- `ripgrep` (`rg`) — filters `fd` output (e.g., excluding paths with spaces)
- `sed`, `tr`, `cut`, `head`, `dirname`, `realpath` — path manipulation / formatting
- `mega-sync` — used to discover the Mega “devices” backup path (custom tool/alias)
- Environment: `XDG_DATA_HOME` (falls back to `~/.local/share` if you set it accordingly)

### Description

This script prepares a dedicated directory at `$XDG_DATA_HOME/ousse` and then runs `updatedb` several times to produce separate database files:

- `home.db`: indexes `$HOME`, pruning only `/tmp`.
- `dots.db`: attempts to focus on dotfiles by pruning **all non-hidden top-level entries** in `$HOME` (computed via `fd '^[^.]' ... --exact-depth=1`), plus prunes additional top-level directories gathered from `$HOME`.
- `data.db`: indexes `/mnt` while pruning “vids” and dynamically excluding some mount roots under `/mnt` (filters out `DATA`, and avoids indexing the roots themselves).
- `root.db`: indexes `/` but excludes many volatile/system-heavy paths (pacman local DB, caches, tmpfs-like locations).
- `mega.db`: indexes the parent directory of `~/UnifiedLibrary` (resolved via `realpath`).
- `devices.db`: indexes a Mega backup “devices” directory resolved from `mega-sync` output.
- `limbo.db`: indexes a directory named `LIMBO` somewhere under `/mnt` (up to depth 4).
- `hdd2.db`: indexes `/mnt/HDD2` with bind-mount pruning enabled.

Overall, it’s a “multi-scope locate” setup: each DB can be queried independently (e.g., with `locate -d …`).

### Usage

Run manually (terminal):

    old-ousse

Typical queries:

    locate -d "$XDG_DATA_HOME/ousse/home.db" "notes.md"
    locate -d "$XDG_DATA_HOME/ousse/dots.db" ".config/qtile"
    locate -d "$XDG_DATA_HOME/ousse/root.db" "vmlinuz"

Suggested automation (systemd user timer or qtile autostart):

- Daily/weekly refresh depending on how often mounts change.

---

> [!TIP]
> Consider adding `set -euo pipefail` and quoting variables like `"$HOME"` everywhere (some `-U $HOME` are unquoted). `updatedb` “prune” lists are space-separated: paths containing spaces will break; you partially filter those out for `dots.db` but not for other dynamically built lists. Also, `mega-sync` is assumed present and stable—guard it with checks/fallbacks to avoid generating an empty `-U` path. Finally, naming this with a `.sh` suffix and adding a shebang (`#!/usr/bin/env bash`) would make execution and editor tooling more predictable.