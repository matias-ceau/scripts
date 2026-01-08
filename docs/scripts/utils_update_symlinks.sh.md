# Update local bin symlinks

---

**utils_update_symlinks.sh**: Sync executable symlinks from `$SCRIPTS` into `~/.local/bin` and log results

---

### Dependencies

- `bash`
- `fd` — used to discover executable files under `$SCRIPTS`
- `glow` — renders section headers in the terminal
- `bat` — pretty-prints the resulting CSV (`-lcsv`)
- `$SCRIPTS` env var — must point to your scripts root (source directory)
- Write access to `~/.local/bin`
- Log paths:
  - `$SCRIPTS/meta/log/symlinking.log`
  - `$SCRIPTS/meta/log/symlinking.log.csv`
  - `$SCRIPTS/symlink_data.csv`

### Description

This script keeps `~/.local/bin` aligned with the executables living in your `$SCRIPTS` tree (useful on Arch + qtile where you likely call scripts from keybindings/rofi). It performs three steps:

1. **Cleanup**: scans `~/.local/bin/*` and removes *broken* symlinks (links whose targets no longer exist), logging them as “Cleaning: …”.
2. **Symlinking**: finds executable files under `$SCRIPTS` via `fd '' -t x` and attempts to create `~/.local/bin/<basename>` symlinks to each file.
   - If the destination already exists and points elsewhere, it logs a **Conflict** instead of overwriting.
3. **Inventory**: writes `symlink_data.csv` listing all symlinks in `~/.local/bin` that point back into `$SCRIPTS`. The previous CSV (minus header) is appended to `symlinking.log.csv` as a crude history/backup.

### Usage

Run interactively in a terminal:

- Ensure `$SCRIPTS` is set:
  - `echo $SCRIPTS`
- Execute:
  - `~/.scripts/meta/utils_update_symlinks.sh`

Typical “tldr”:

- Sync symlinks:
  - `utils_update_symlinks.sh`
- Check results:
  - `bat -lcsv "$SCRIPTS/symlink_data.csv"`
  - `tail -n 50 "$SCRIPTS/meta/log/symlinking.log"`

Suggested qtile binding (example):
- `lazy.spawn("utils_update_symlinks.sh")`

---

> [!TIP]
> Consider restricting `fd` to avoid symlinking unintended executables (e.g., exclude `.git`, `meta/`, or build dirs) and prefer `fd -H -E meta -E .git`. Also, `readlink` may return relative paths; using `readlink -f` would make conflict detection more reliable. Finally, the `if [ -e "$SYMLINK" ] … elif [ -L "$SYMLINK" ] …` branch is slightly inconsistent: a symlink to an existing target satisfies `-e` and will never hit the `-L` branch—simplify with a single `-L` check plus `-e` handling.