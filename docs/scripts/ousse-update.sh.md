# Ousse Update Script

---

**ousse-update.sh**: Centralized update script for multiple database paths on a Linux system

---

### Dependencies

- \`bash\`: Shell scripting language.
- \`updatedb\`: Utility for updating file name databases used by \`locate\`.
- \`fd\`: A simple, fast, and user-friendly alternative to \`find\`.
- \`rg\`: \`ripgrep\`, a line-oriented search tool that recursively searches the current directory for a regex pattern.
- \`realpath\`: Returns the canonicalized absolute pathname.
- \`sed\`: Stream editor for filtering and transforming text.

### Description

This script is designed to update various file databases on your system by running the `updatedb` command with custom parameters across different directories. Each section (_home, _dots, _data, etc.) targets a specific directory or set of directories, using the `updatedb` command along with file filtering and path pruning options.

The directories for database storage are based on the \`$XDG_DATA_HOME/ousse\` path, creating it if it doesn't exist.

Functions such as `_home` or `_dots` specify their own unique set of parameters and pruning paths through extensive use of `fd` and `sed` to dynamically determine path structures. The script supports targeted database updates as well as an all-encompassing update through command-line arguments.

### Usage

```bash
# To update the 'home' database
sh ousse-update.sh home

# To update the 'dots' database
sh ousse-update.sh dots

# To update all databases
sh ousse-update.sh all
```

You can integrate this script with your window manager, such as qtile, or schedule it via cron jobs to automate data updates.

The script supports the following command-line arguments:
- `home`: Updates the home directory index.
- `dots`: Updates directories related to dotfiles.
- `data`: Updates directories containing data files.
- `root`: Updates directories at the root filesystem level.
- `mega`: Updates the mega directory.
- `devices`: Updates directories related to device paths.
- `limbo`: Updates directories marked as limbo.
- `hdd2`: Updates the /mnt/HDD2 directory.
- `all`: Executes updates for all categories.

---

> [!TIP]
> - Consider adding error handling for situations where dependencies like `fd` and `rg` are missing.
> - The command-line parsing is limited to the first argument; consider enhancing it for more flexibility.
> - There is a commented \`MIN_AGE\` variable and unused \`DBS\` array; clarify their usage or remove them to streamline the script.
> - Add user feedback for successful or failed updates to assist with debugging and confirm operations.