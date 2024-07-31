# Update Symlinks Script

---

**[utils_update_symlinks](utils_update_symlinks)**: Automates the creation and management of symlinks in ~/.local/bin

---

### Dependencies

- `bash`: The scripting language in which the script is written.
- `fd`: A fast alternative to `find` for locating files.
- `bat`: A command-line tool to view files with syntax highlighting and line numbers.
- `glow`: A command-line tool for rendering markdown files in the terminal.

### Description

The `utils_update_symlinks.sh` script is designed to manage symbolic links within the `~/.local/bin` directory, making it easier to run user scripts directly from the command line. This script performs the following key tasks:

1. **Initialization**: It initializes a CSV file (`symlink_data.csv`) to store symlink information, backing up any pre-existing data if necessary.

2. **Logging**: It includes simple logging functions (`log_info` and `log_error`) to record events and errors with their timestamps. This is helpful for tracking what the script is doing and identifying any issues that arise during execution.

3. **Clean-up Process**: The function `remove_broken_symlinks` iterates through existing symlinks in the target directory and removes any that are broken, logging this action.

4. **Symlink Creation**: The `create_symlinks` function uses `fd` to find files in the source directory and create symlinks in the target directory. It checks for conflicts to avoid overwriting existing symlinks or files, logging any potential issues.

5. **CSV Update**: After symlinks are created, the script retrieves details of all newly created symlinks and appends this information to the CSV file for future reference.

### Usage

To use the script, execute it via the terminal. It does not require any command-line arguments:

```bash
bash /home/matias/.scripts/sys/utils_update_symlinks.sh
```

The script will:

- Remove broken symlinks in `~/.local/bin`
- Create new symlinks for scripts located in the specified source directory
- Update a CSV file with the details of the symlinks created

You may also consider setting up a key binding in your window manager to run this script quickly.

---

> [!TIP] 
> This script assumes that the `SCRIPTS` environment variable is defined and points to the correct directory containing your scripts. Make sure to add error handling in case this variable is not set. Additionally, consider providing user feedback for the symlink creation process instead of relying solely on logging.
