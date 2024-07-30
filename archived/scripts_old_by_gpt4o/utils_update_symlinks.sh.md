# utils_update_symlinks.sh

# create-symlinks.sh

This script is designed to manage and create symbolic links (symlinks) in the `~/.local/bin` directory. It removes old or broken symlinks and logs actions taken to a log file.

## Table of Contents

- [Functionality](#functionality)
- [Usage](#usage)
- [Logging](#logging)
- [Script Breakdown](#script-breakdown)
    - [Initialization](#initialization)
    - [Logging Functions](#logging-functions)
    - [Removing Broken Symlinks](#removing-broken-symlinks)
    - [Creating Symlinks](#creating-symlinks)
    - [Updating CSV](#updating-csv)
- [Dependencies](#dependencies)

## Functionality

- Removes old and broken symlinks in the `~/.local/bin` directory.
- Creates new symlinks from scripts located in the `$SCRIPTS` directory to the `~/.local/bin` directory.
- Logs the operations performed into a log file.
- Maintains a CSV file with details about the symlinks created.

## Usage

To execute the script, simply run:

```bash
./create-symlinks.sh
```

Make sure the script has execute permissions:

```bash
chmod +x create-symlinks.sh
```

## Logging

The script maintains a log file located at `$SCRIPTS/log/symlinking.log` and a CSV file at `$SCRIPTS/data/symlink_data.csv` for tracking all the symbolic links created.

## Script Breakdown

### Initialization

1. **Source and Target Directories**: Defines the source directory (`$SCRIPTS`) where the original scripts are located and the target directory (`$HOME/.local/bin`) where symlinks will be created.

2. **Log and Data Files**: Specifies the locations for the log file and the CSV data file.

3. **CSV Initialization**: If a previous CSV file exists, appends its contents (excluding the header) to a backup file and initializes a new CSV file with headers.

### Logging Functions

- **log_info**: Logs informational messages with a timestamp in green color.
- **log_error**: Logs error messages with a timestamp in red color.

### Removing Broken Symlinks

Removes symlinks in the target directory that do not point to any existing file. Logs the removal action as an error.

### Creating Symlinks

Uses the `fd` command to find executables in the source directory and attempts to create symlinks to these files in the target directory. Handles conflicts if symlinks already exist and link to different files.

### Updating CSV

Iterates over the symlinks in the target directory, and if they point to scripts in the `$SCRIPTS` directory, it appends their details to the CSV file. The CSV file is then displayed using the `bat` command (with CSV syntax highlighting).

## Dependencies

- `fd`: A simple, fast, and user-friendly alternative to `find`.
- `bat`: A `cat` clone with syntax highlighting and Git integration.
- `glow`: Markdown rendering in the terminal.

Ensure these tools are installed and available in the system path for the script to function correctly. You can install them via most package managers:

```bash
# Install fd
sudo apt install fd-find  # On Debian-based systems
brew install fd           # On macOS

# Install bat
sudo apt install bat
brew install bat

# Install glow
sudo apt install glow
brew install glow
```

---

Feel free to modify the script and this documentation according to your specific requirements.