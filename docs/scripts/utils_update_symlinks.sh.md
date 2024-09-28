# Utility Script for Symlink Management

---

**utils_update_symlinks.sh**: Automate the creation and management of symlinks in your local bin directory, ensuring old links are removed.

---

### Dependencies

- `fd`: A simple, fast, and user-friendly alternative to find, used for locating scripts.
- `bat`: A clone of cat with syntax highlighting, utilized here for displaying CSV contents.
- `glow`: A command-line Markdown renderer to style terminal output.

### Description

This script manages symlinks within your `$HOME/.local/bin` directory by creating new ones from scripts located in the `$SCRIPTS` directory, and removing outdated or broken links. It aims to ease access to frequently used scripts through a simplified shell command invocation.

- **Initialization**: Prepares the CSV log file to store symlinks data, archiving past entries.
- **Logging**: Provides timestamped logging of error messages and script activities for debugging and tracking.
- **Symlinks Management**: 
  - Removes any broken symlinks found in the target directory.
  - Creates new symlinks for executable scripts found within the source directory (`$SCRIPTS`). Logs conflicts or mismatches when symlinks differ from expected targets.
- **CSV Logging**: Updates the CSV file with the paths of all symlinks created, facilitates auditing or tracking changes.

### Usage

Run the script from your terminal to execute all included functionalities:

```bash
bash /home/matias/.scripts/sys/utils_update_symlinks.sh
```

**Example Use Cases:**

1. **Automated Script Access**: Automatically link executable scripts to a directory in your $PATH, making them easily callable from the terminal.
2. **Regular Cleaning**: Removes broken symlinks that may result from moved or deleted scripts.

Assign this script to a keyboard shortcut in your qtile configuration for seamless integration and quick symlink updates.

---

> [!TIP]
> Consider adding command-line flags to allow selective execution of each function (e.g., cleaning only or symlinking only). This could provide more flexibility for users in managing the symlink process independently from the full script execution. Additionally, check to ensure `fd` output compatibility across different setups or versions, as changes in its behavior could affect symlink detection.