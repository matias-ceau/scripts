# Ousse Indexing Database Generator

---

**old-ousse**: Generates a collection of custom mlocate databases for various areas of your filesystem

---

### Dependencies

- `updatedb`  
  *Core binary used to create the locate databases (typically from `mlocate` or `plocate`).*
- `fd`  
  *Efficient file finder used for directory selection and filtering.*
- `rg`  
  *Ripgrep: used for fast pattern filtering.*
- `sed`, `tr`, `cut`, `dirname`, `realpath`  
  *Standard UNIX utilities for string and file path manipulation.*
- `mega-sync`  
  *Used specifically for Mega cloud folder location.*
- Environment variable: `$XDG_DATA_HOME`

### Description

This script is designed for Arch Linux (with qtile or other WMs), and builds multiple custom mlocate-compatible databases targeting specific folders and data types:

- **home.db** — Indexes the home directory, skipping `/tmp`.
- **dots.db** — Home directory minus most "dot" folders (dynamic exclusion based on folder listing).
- **data.db** — `/mnt` hierarchy, with complex `prunenames` and `prunepaths` for precise control (mainly excludes specific non-data directories).
- **root.db** — The entire root filesystem with many system and temp directories pruned, to reduce noise.
- **mega.db** — Index for a UnifiedLibrary in Mega, automatically determines path.
- **devices.db** — Index of 'devices' folder within Mega backups, determined dynamically.
- **limbo.db** — Custom “LIMBO” folder under `/mnt`, auto-located.
- **hdd2.db** — Indexes entire `/mnt/HDD2`; skips bind mounts.

Each `.db` file ends up in `$XDG_DATA_HOME/ousse/<name>.db`. Many prunenames/prunepaths are dynamically constructed for flexibility, especially for personal folder layouts.

### Usage

Run the script without arguments, ideally in a terminal:

```sh
~/.scripts/dev/old-ousse
```

You may want to set up a keybinding or automated timer in qtile to run it periodically.

- To inspect a created database, use:
  ```
  locate -d $XDG_DATA_HOME/ousse/home.db somefile
  ```
- Schedule in cron or systemd for regular updates.

---

> [!TIP]
> **Critique:**  
> - Script is powerful but brittle: directory/folder names are tightly coupled to your layout (e.g., `$HOME/UnifiedLibrary`, `/mnt/HDD2`, presence of Mega/cloud folders).
> - Some commands (like `fd`, `rg`, and others) could fail silently if a folder is renamed, missing, or if packages are not installed.
> - Error handling is absent; failures may go unnoticed. Consider adding `set -e`, and some `echo` statements for progress and debugging.
> - Using `mlocate`/`updatedb` as a regular user for indexing system paths (`/`) could miss files with restricted permissions.
> - The reliance on environment variables (`$XDG_DATA_HOME`) and Mega backend assumes these are properly initialized.
> - Refactoring into functions would greatly improve readability and maintainability.  
>
> For your use case, this is an extremely effective and highly customizable approach, but keep in mind these caveats if system structure changes.