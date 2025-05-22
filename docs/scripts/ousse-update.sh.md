# Custom Locate Database Updater

---

**ousse-update.sh**: Custom script to update various `mlocate` databases with personal folder scopes.

---

### Dependencies

- `updatedb`  
  *From the `mlocate` package. Generates locate databases. Required for all update operations.*

- `fd`  
  *A simple, fast and user-friendly alternative to `find`. Used for pruning folders dynamically.*

- `rg`  
  *ripgrep, a fast line-oriented search tool, used together with `fd` for filtering.*

- `sed`  
  *Utilized for line edits, especially directory path formatting.*

- `realpath`  
  *For canonicalizing file/directory paths.*

- Environment variable: `$XDG_DATA_HOME`  
  *Ensure it's set, otherwise fallback will not be handled by this script.*

---

### Description

This script streamlines the update of multiple `mlocate` database files to maintain rapid file search across your primary directories: `$HOME`, dotfiles, external data drives, root, MEGA sync, device folders, "limbo" directories, and HDD2.

Each function (e.g., `_home`, `_dots`, etc.) invokes `updatedb` scoped to specific directories, leveraging `fd` and `rg` for dynamic prune paths and names. This ensures that:
- Unwanted folders or mounts are skipped.
- Each scope has minimal, tailored prune rules for optimal search usefulness.
- All database files are written under `$XDG_DATA_HOME/ousse/`.

#### Example: `_dots`
Prunes all non-dot directories in `$HOME`, thus ensuring dotfiles (configurations) are not skipped or flooded by regular folders.

Note: The `_custom_updatedb` function is a stub and not currently used.

---

### Usage

Typically, use this from a terminal (or assign it to a keybinding in Qtile):

```
# Update all databases
~/.scripts/meta/ousse-update.sh all

# Update only home database
~/.scripts/meta/ousse-update.sh home

# Update only dots database
~/.scripts/meta/ousse-update.sh dots

# Other available targets:
#   data, root, mega, devices, limbo, hdd2

# For example, to update only devices:
~/.scripts/meta/ousse-update.sh devices
```

Can be run periodically (e.g., via `systemd` service/timer, or cron/anacron for root tasks).

---

> [!WARNING]
> - The function `_dot` in the case statement should be `_dots` to match the defined function name, otherwise `"dots"` command silently fails.
> - Error handling is minimal or absent: e.g., missing dependencies, unset `$XDG_DATA_HOME`, permissions issues are not surfaced.
> - Database paths and prunelists have some redundancy; consider factoring shared pruning logic.
> - `_custom_updatedb` is unfinished, and its usage is unclear or broken.
> - Usage of external commands (`fd`, `rg`, `sed`, etc.) assumes all are installed and available on `$PATH`.
> - Expanding `MIN_AGE` (currently commented) could streamline avoiding redundant updates.
> - Consider documenting or adding a help message for maintainability.