# Update `~/.local/bin` symlinks

---

**utils_update_symlinks.sh**: Create symlinks in ~/.local/bin, clean broken ones, and refresh symlink CSV

---

### Dependencies

- `bash`
- `fd` — scans the scripts directory for executable files (`-t x`)
- `bat` — pretty-prints the resulting CSV (`bat -lcsv`)
- `glow` — optional; renders the section headers (falls back to `echo`)
- Environment variable: `SCRIPTS` — must point to your scripts root (e.g. `/home/matias/.scripts`)

### Description

This utility keeps your user-local command namespace (`~/.local/bin`) in sync with your scripts repository.

It performs three steps:

1. **Cleanup**: removes **broken symlinks** in `~/.local/bin` (symlink exists, target missing). Each removal is logged as an error-like event (“Cleaning: …”) to `meta/log/symlinking.log`.
2. **Symlinking**: walks `"$SCRIPTS"` and finds every **executable file**, then ensures there is a symlink named after its basename in `~/.local/bin`.
   - If a path already exists at the destination and points elsewhere, it **does not overwrite**; it logs a conflict instead.
   - If nothing exists, it creates `ln -s "$FILE" "$TARGET_DIR/$BASENAME"`.
3. **Inventory CSV**: rebuilds `"$SCRIPTS/symlink_data.csv"` from the current `~/.local/bin` symlinks that point back into `"$SCRIPTS"`. Before overwriting, it appends the previous CSV (minus header) into `meta/log/symlinking.log.csv` as a historical dump.

This is particularly handy on Arch + qtile setups where you want stable command names for keybindings without manually managing links.

### Usage

Run manually (interactive output, safe for terminal use):

    SCRIPTS="$HOME/.scripts" ~/.scripts/meta/utils_update_symlinks.sh

Typical “just update everything” flow:

    ~/.scripts/meta/utils_update_symlinks.sh

Afterwards, verify:

    ls -l ~/.local/bin
    bat -lcsv ~/.scripts/symlink_data.csv

Suggested qtile keybinding: bind to a terminal command (since it prints status + uses `bat/glow`).

---

> [!TIP]
> Consider narrowing the scan to a dedicated subfolder (e.g. `$SCRIPTS/bin`) to avoid linking unintended executables. Also, the conflict checks can be simplified: `-e` matches symlinks too, making the `elif [ -L ... ]` branch mostly unreachable. Finally, `readlink` on a non-symlink will fail under `set -e`; guarding with `-L` before calling `readlink` would make conflict logging more robust.