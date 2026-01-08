# Ousse updatedb profiles (multiple locate DBs)

---

**ousse-update.sh**: Build multiple `updatedb` databases for different filesystem scopes

---

### Dependencies

- `updatedb` (from `mlocate`/`plocate`): generates locate databases
- `fd`: used to discover directories and generate prune lists dynamically
- `ripgrep` (`rg`): filters `fd` output
- `realpath`: resolves `~/UnifiedLibrary` location
- `sed`, `tr`, `dirname`: basic text/path utilities
- Environment: `XDG_DATA_HOME` (stores DBs in `$XDG_DATA_HOME/ousse`)

### Description

This script maintains several separate locate databases (stored as `*.db` files) to speed up searches per “scope” (home, dots, root, mounts, etc.) without mixing everything into a single system database.

It creates `$XDG_DATA_HOME/ousse` and then runs `updatedb` with custom options:

- `-l 0`: do not require a filesystem change threshold (always scan).
- `-o <file>`: output database file.
- `-U <path>`: root(s) to index.
- `--prune-bind-mounts`: toggled per profile.
- `--prunenames` / `--prunepaths`: selectively exclude content (e.g. `/tmp`, pacman DB, cache).

Profiles implemented:
- `_home`: `$HOME` (excluding `/tmp`)
- `_dots`: focuses on dotfiles by pruning non-dot top-level entries in `$HOME`
- `_data`: indexes `/mnt` with exclusions around `DATA`, `HDD2`, `SSD`
- `_root`: indexes `/` with a large prune list (cache, pacman local DB, tmp, etc.)
- `_mega`: indexes the parent directory of `~/UnifiedLibrary`
- `_devices`, `_limbo`: discover target directories with `fd`
- `_hdd2`: indexes `/mnt/HDD2` (bind mounts pruned)

### Usage

Run from a terminal (or wire to a qtile keybinding for periodic refresh):

- Update one scope:
  - `ousse-update.sh home`
  - `ousse-update.sh root`
  - `ousse-update.sh mega`
  - `ousse-update.sh hd`

- Update everything:
  - `ousse-update.sh all`

Databases are written to:
- `$XDG_DATA_HOME/ousse/home.db`, `dots.db`, `root.db`, etc.

---

> [!WARNING]
> - The case branch `dot*) _dot ;;` calls `_dot` but the function is `_dots`; this currently breaks the “dots” mode.
> - Several `-U $(...)` expansions are unquoted; paths with spaces will break. Quote command substitutions (or use arrays).
> - `_custom_updatedb()` is unused and only checks arg count; either implement it fully (shared wrapper) or remove it.
> - `updatedb` flavor/options vary between `mlocate` and `plocate`; ensure your installed tool supports the flags you use.