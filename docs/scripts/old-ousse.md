# old-ousse: Multi-Database Index Builder

---

**/home/matias/.scripts/dev/old-ousse**: Creates and updates multiple locate databases for various parts of the system

---

### Dependencies

- `updatedb` – Used to build databases for the locate command
- `fd` – A fast alternative to find, used to list directories
- `rg` – Ripgrep for efficient text filtering
- `dirname`, `realpath`, `cut` – Standard utilities for path manipulation
- `mega-sync` – A utility used here for identifying specific backup paths

---

### Description

This script is designed to generate and update several locate databases for different segments of the system. It primarily uses the `updatedb` command, which is part of the mlocate package, to index directories according to customizable parameters. The script begins by ensuring a target directory exists in `$XDG_DATA_HOME/ousse` before creating separate databases:

- **home.db:** Indexes the user's home directory while excluding common irrelevant paths.
- **dots.db:** Focuses on the user’s home-level hidden files, utilizing `fd` to filter directories that are not starting with a dot and using `rg` to eliminate whitespace issues.
- **data.db:** Indexes directories under `/mnt` (for multiple mount points such as HDD2, SSD, and others) while excluding certain high-level directories (e.g., DATA and HDD2/$).
- **root.db:** Indexes the system root `/` with many system-specific paths pruned.
- **mega.db:** Targets directories based on the location of a unified library determined via `realpath`.
- **devices.db:** Uses `mega-sync` to determine the backup device path before indexing.
- **limbo.db:** Looks for a specific directory (named LIMBO) across mounted devices.
- **hdd2.db:** Directly indexes the `/mnt/HDD2` path with minimal pruning.

The script leverages shell variable substitution and command substitution techniques to dynamically set database paths and pruning parameters, making it adaptable to changes in system configuration.

### Usage

To manually run the script, simply execute it from your terminal:

   $ bash /home/matias/.scripts/dev/old-ousse

This script is well-suited for integration into your qtile keybindings or automation routines in Arch Linux environments. Running it periodically will ensure that all locate databases remain current.

---

> [!TIP] Consider adding more robust error handling in case commands like `fd` or `rg` fail. Ensuring that environment variables, such as `$XDG_DATA_HOME` or paths provided by `mega-sync`, are set correctly before execution would improve reliability. Additionally, using shell functions for repetitive command patterns may enhance maintainability and reduce redundancy.