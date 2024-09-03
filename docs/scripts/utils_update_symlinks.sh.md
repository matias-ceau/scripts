# Utilities Update Symlinks

---

**utils_update_symlinks.sh**: Script to create and manage symlinks in ~/.local/bin, cleaning old ones.

---

### Dependencies

- `bash`: The shell used to execute this script.
- `fd`: A fast file finder that is used to locate files for symlinking.
- `bat`: A cat clone with syntax highlighting and Git integration, used to display CSV content.

### Description

This Bash script automates the process of creating symlinks in the `~/.local/bin` directory from a source directory defined by the `$SCRIPTS` environment variable. The script also cleans up any broken symlinks and logs the actions taken. It uses an external CSV file to keep track of symlinks for record-keeping and future reference.

The main operations include:

1. **Initialization**: It starts by checking if the CSV log of symlinks exists. If it does, the contents (excluding headers) are backed up into a log file. A new CSV file is then created with an appropriate header.

2. **Logging Functions**: The script includes functions for logging both informational messages and errors, formatting the output to include timestamps.

3. **Removing Broken Symlinks**: A function scans the target directory for broken symlinks (links that do not point to valid files) and removes them while logging this action.

4. **Creating Symlinks**: The main functionality of the script is to create new symlinks. It checks for any conflicts—specifically if a symlink already exists and points to a different file.

5. **CSV Logging**: Finally, the script collects the newly created symlinks and adds them to the CSV file for tracking purposes. The contents of the CSV file are displayed at the end of the operation.

### Usage

To run the script, execute the following command in your terminal. Make sure to adjust the `$SCRIPTS` variable in your environment to point to the correct source directory:

```bash
chmod +x /home/matias/.scripts/sys/utils_update_symlinks.sh
/home/matias/.scripts/sys/utils_update_symlinks.sh
```

You can automate this script through a cron job or bind it to a key in your window manager (Qtile) for easy access. It’s designed to run conveniently without needing user interaction.

---

> [!TIP]
> Consider adding a check for the existence of the `$SCRIPTS` environment variable early in the script to prevent errors if it is not set. Additionally, you might want to handle potential permission issues when creating symlinks, which could lead to unexpected failures during execution.