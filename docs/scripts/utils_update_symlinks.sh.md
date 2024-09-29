# Symlink Manager

---

**utils_update_symlinks.sh**: Script to create and manage symlinks in ~/.local/bin.

---

### Dependencies

- `fd`: A simple, fast, and user-friendly alternative to `find`.
- `bat`: A cat(1) clone with wings, used for displaying files with syntax highlighting.

### Description

This script is designed to facilitate the management of symlinks located in the `~/.local/bin` directory. It performs several key functions, including:

1. **Logging**: Keeps a comprehensive log of actions taken and errors encountered in a specified log file.
2. **Cleanup**: Removes broken symlinks to maintain a clean symlink environment.
3. **Creation**: Creates new symlinks for all executable files found in the specified `SOURCE_DIR`.
4. **CSV Management**: Maintains a CSV file that records all symlinks created, along with their target paths and associated command names.

The script starts by initializing the log file and a CSV data file, archiving previous data when applicable. It then removes any broken symlinks before creating new ones based on the contents of the defined source directory, logging conflicts when necessary. Finally, it updates the CSV file with current symlink details.

### Usage

To execute the script, simply run it from the terminal:

```bash
bash /home/matias/.scripts/sys/utils_update_symlinks.sh
```

#### Typical Workflow

1. **Execute the script**: This initiates the process of cleaning up and creating symlinks.
2. **Review Log File**: Check `symlinking.log` for any errors or informational messages.
3. **Inspect CSV**: The symlinks can be reviewed in the `symlink_data.csv` file; it is displayed using `bat` for convenience.

```bash
bat --no-pager $SCRIPTS/data/symlink_data.csv
```

---

> [!TIP]  
The script relies heavily on the `fd` and `bat` tools, which may need to be installed if not present on the system. Additionally, consider enhancing error handling, particularly around file I/O operations, to prevent unexpected script failures. Logging could also include severity levels and timestamps for better traceability.