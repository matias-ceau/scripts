# Symlink Management Utility

---

**utils_update_symlinks.sh**: maintain and update symlinks for `$SCRIPTS` into `~/.local/bin`, logging actions and cleaning obsolete links

---

### Dependencies

- `fd`: Fast alternative to `find` used for searching executables in the `$SCRIPTS` directory
- `glow`: Render markdown output (for status output, e.g., "# Cleaning...")
- `bat`: Syntax-highlighted file viewer, used here for pretty-printing CSV files
- `bash`: Uses basic Bash functionality for file operations and control flow

---

### Description

This script automates the management of symbolic links for all executables in your custom `$SCRIPTS` directory, ensuring your `~/.local/bin` always contains up-to-date links for your scripts. It provides the following functionality:

- **Removes stale symlinks** from `~/.local/bin` that no longer point to valid files (often due to deleted or moved scripts).
- **Creates new symlinks** for any scripts in `$SCRIPTS` missing from `~/.local/bin`.
- **Logs successes and errors** in a detailed log file (`$SCRIPTS/meta/log/symlinking.log`).
- **Maintains a CSV record** of original script paths and their symlinks for tracking and troubleshooting.
- Utilizes clean and colorized output for clear feedback during operations.

The script defines several functions:
- `log_info` and `log_error` for colorized and timestamped logging,
- `remove_broken_symlinks` to detect and remove invalid symlinks,
- `create_symlinks` to safely generate new links, logging conflicts,
- `add_symlinks_to_csv` which updates the main CSV file and displays it neatly with `bat`.

CSV operations ensure you can always check which symlinks currently target scripts in your `$SCRIPTS` directory and facilitate quick auditing or rollback if needed.

---

### Usage

**TLDR:**

Run this script directly in your terminal; it doesn't accept arguments.

```bash
~/.scripts/meta/utils_update_symlinks.sh
```

**Typical flow:**

1. Cleans up and removes broken links in `~/.local/bin`
2. Creates symlinks from executables in `$SCRIPTS` to `~/.local/bin`
3. Updates a CSV log of all managed symlinks (shown with `bat`)

**Automating / Scheduling:**

- Assign to a keybinding in Qtile, or call from another script or periodic cron/systemd job for regular maintenance.

---

> [!TIP]
> **Potential improvements and caveats:**  
> - The script expects environment variables (`$SCRIPTS`, `$HOME`) to be set—ensure they're always defined, especially if run from cron or WM keybindings where the environment may be minimal.
> - Missing dependencies (`bat`, `fd`, `glow`) will cause failures; add checks at the top for more robust operation.
> - Consider handling spaces in file/dir names more robustly (e.g., using `find -print0` and `xargs -0`, or `while IFS= read -r`).
> - You may want to improve conflict handling: presently, if a symlink exists and is incorrect, only a log message is printed—optionally, offer to overwrite automatically.
> - For very large script directories, using `bat` every time may be slow; consider optional previewing or limiting.
> - Logging CSV appends to history but never trims—periodically archive/rotate if the number of scripts grows substantially.