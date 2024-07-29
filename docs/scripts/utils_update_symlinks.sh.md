# utils_update_symlinks.sh

This is a Bash script designed to create symlinks in the `~/.local/bin` directory and remove old ones. Here's an overview of its functionality:

**Configuration**

The script uses several configuration variables at the top:

* `SOURCE_DIR`: The source directory where files will be symlinked from.
* `TARGET_DIR`: The target directory where symlinks will be created, which is `$HOME/.local/bin`.
* `LOG_FILE` and `DATA_FILE`: Log file and data file locations for recording events.

**Initialization**

The script checks if the `data.csv` file exists in the `SCRIPTS/data/` directory. If it does, the script appends all lines except the header to a new log file named `symlinking.log.csv`. This is likely done to keep track of previous symlink creations and updates.

**Error Logging**

The script defines two logging functions: `log_info()` for informational messages (green-colored) and `log_error()` for error messages (red-colored). Both functions append the message to a log file (`$LOG_FILE`) along with a timestamp.

**Remove Broken Symlinks**

The `remove_broken_symlinks()` function iterates through all files in the `$TARGET_DIR` directory. If a file is a symlink and its target no longer exists, it removes the broken symlink and logs an error message.

**Create Symlinks**

The `create_symlinks()` function uses `fd` (a find and delete command) to iterate through files in the `SOURCE_DIR`. For each file, it checks if a symlink with the same name already exists in the `$TARGET_DIR` directory. If so, it checks if the existing symlink points to the correct target file. If not, it logs an error message. Otherwise, it creates a new symlink using `ln -s`.

**Add Symlinks to CSV**

The `add_symlinks_to_csv()` function iterates through files in the `$TARGET_DIR` directory and adds any symlinks pointing to files within the `SOURCE_DIR` to a CSV file (`$DATA_FILE`). It then displays the contents of the CSV file using `bat`.

**Execution**

The script executes the following functions in sequence:

1. Removes broken symlinks.
2. Creates new symlinks.
3. Adds new symlinks to the CSV file.

Each function is preceded by a message indicating its purpose, and the entire process is logged along with timestamps and colors for easier visibility.