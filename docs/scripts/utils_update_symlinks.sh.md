# Symlink Manager 

---

**utils_update_symlinks.sh**: Create and maintain symbolic links in ~/.local/bin.

---

### Dependencies

- `fd`: A simple, fast and user-friendly alternative to 'find'.
- `bat`: A cat(1) clone with wings. It provides syntax highlighting for the CSV output.

### Description

The `utils_update_symlinks.sh` script automates the management of symbolic links in the `~/.local/bin` directory. It primarily operates using the following functionalities:

- It initializes a CSV file to log existing symlinks, and backs up the previous log if it exists.
- The script removes any broken symlinks found in the target directory and logs this activity.
- It creates new symlinks from files discovered in a specified source directory defined by the environment variable `SCRIPTS`.
- Lastly, it records the newly created symlinks into a CSV format for easier reference.

The script uses functions for better organization and readability:

- `log_info` and `log_error`: Handle logging of messages and errors with timestamps.
- `remove_broken_symlinks`: Scans the target directory, removing any broken symlinks.
- `create_symlinks`: Checks for existing symlinks and creates new ones as needed, logging any conflicts.
- `add_symlinks_to_csv`: Updates the CSV file to reflect the symlinks created, displaying the contents using `bat`.

### Usage

To run this script, ensure to execute it in a terminal. It does not take any command-line arguments. Ensure the environment variable `SCRIPTS` is correctly set to the source directory containing files you wish to symlink.

To execute the script, simply run:

```bash
bash /home/matias/.scripts/sys/utils_update_symlinks.sh
```

The script will then:
1. Remove broken symlinks.
2. Create new symlinks from the SOURCE_DIR to TARGET_DIR.
3. Log the status of the operation into a CSV file.

You can set this script to run at regular intervals using a cron job or bind it to a keybinding in your Window Manager for ease of access.

---

> [!TIP]
> The script currently only handles symlinks in the TARGET_DIR. It could be enhanced by adding an option to directly specify a new source directory or to create logs in a structured format. Also, consider adding more detailed error handling or user notifications to improve usability.