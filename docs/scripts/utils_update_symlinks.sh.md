# Meta Script for Managing Symlinks

---

**meta/utils_update_symlinks.sh**: Script to create symlinks in `~/.local/bin` and manage old/broken ones.

---

### Dependencies

- `fd` - A simple, fast, and user-friendly alternative to `find`. Used to locate executable files in the `SOURCE_DIR` directory.
- `bat` - A `cat` clone with syntax highlighting and other features. Used to display the contents of the symlink CSV file.
- `glow` - A markdown reader for the terminal. Used to display colored headings in the output.
- Custom variables:
  - `$SCRIPTS` - Must define the directory where scripts are stored.
  - `$HOME` - User's home directory as required to define `~/.local/bin`.

---

### Description

This script automates the management of symbolic links in the `~/.local/bin` directory, ensuring a clean environment by removing redundant or broken links, adding relevant symlinks, and logging the operations for future reference. Here's an overview of the script's functionality:

1. **Log Management**:
    - Logs activities (e.g., removed broken symlinks, conflicts with existing symlinks) into `symlinking.log` for debugging and history.
    - Maintains a CSV file (`symlink_data.csv`) to store details about created symlinks, including the original path, symlink path, and command name.

2. **Broken Symlink Cleanup**:
    - Checks all symlinks in the `~/.local/bin` directory and removes broken ones, logging the operation.

3. **Symlink Creation**:
    - Uses the `fd` command to find executable files in the source directory (`$SCRIPTS`).
    - Creates symlinks for these files in `~/.local/bin`.
    - Resolves conflicts by logging errors for existing or conflicting symlinks.

4. **CSV Metadata**:
    - Records all valid symlinks pointing to `$SCRIPTS` in CSV format for record-keeping purposes.

---

### Usage

To run the script:

1. Ensure the variables `$SCRIPTS` and `$HOME` are properly defined in your environment.
2. Execute the script directly:
   ```bash
   bash /home/matias/.scripts/meta/utils_update_symlinks.sh
   ```
3. Optional: Schedule it with `cron` or bind it to a shortcut with `qtile`.

**Key Actions Performed**:
- Cleaning:
  ```bash
  ./utils_update_symlinks.sh
  ```
  Outputs: Removes broken symlinks and logs changes.

- Symlinking:
  The script scans for executables with `fd` and creates links.

- CSV update:
  Appends details about symlinks pointing to `$SCRIPTS`.

---

> [!IMPORTANT]
> - The script heavily relies on `fd`, `bat`, and `glow`. Ensure these utilities are installed on your Arch Linux setup (`sudo pacman -S fd bat glow`).
> - Potential improvements:
>   1. Implement better handling of `$SOURCE_DIR` and `$TARGET_DIR` in the script — ensure variables are checked if unset.
>   2. Add handling for permissions or missing directory creation (`mkdir -p ~/.local/bin`).
>   3. Consider using `set -e` to exit immediately on errors instead of silent failures during commands like `ln -s`.