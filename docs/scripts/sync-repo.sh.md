# Git Repository Sync Utility

---

**sync-repo.sh**: A script for syncing a Git repository with improved user interaction and error handling.

---

### Dependencies

- `git`: Required for functioning with Git repositories.
- `bat`: Optional; enhances command output aesthetics.
- `glow`: Optional; formats messages elegantly if available.

### Description

This script efficiently syncs a specified Git repository with its remote counterpart. It provides robust error handling and options for conflict resolution during merges and stashing operations. The script incorporates colorful outputs using ANSI escape sequences for better visibility and uses external utilities like `bat` and `glow` to enhance display formatting.

Key functions include:
- `strip_ansi()`: Strips color codes from output for compatibility with non-supporting terminals.
- `run_command()`: Executes commands while printing their actions in a formatted manner.
- `handle_merge_pull_conflicts()`: Manages merge conflicts by providing interactive options for conflict resolution.
- `generate_commit_message()`: Automatically generates a commit message based on the number of changes.
- `display_summary()`: Summarizes the sync operation with logs and timestamps.

### Usage

To run the script, use the following command format:

```bash
./sync-repo.sh <repository_path> [--dry-run] [--help]
```

#### Arguments:

- `<repository_path>`: The local path to the Git repository you want to sync.
- `--dry-run`: Optional. Will not apply any changes, useful for testing what would happen.
- `--help` or `-h`: Displays the usage instructions.

#### Examples:

- Sync a specific repository:
  ```bash
  ./sync-repo.sh ~/.scripts
  ```
  
- Perform a dry run to see potential changes without applying them:
  ```bash
  ./sync-repo.sh $SCRIPTS --dry-run
  ```

---

> [!TIP]  
> The script could be further improved by adding logging capabilities to capture detailed output in a log file for debugging and analysis. Another improvement could be to allow multi-repository syncing in a single run for users managing several repositories.

### Features

- **Interactive Conflict Handling**: Users can easily resolve merge conflicts through prompts.
- **Formatted Output**: Utilizes `bat` and `glow` to enhance command outputs, making it visually appealing and easier to read.
- **Versatile Usage**: Supports both direct usage and through keybindings for quick operations from the desktop environment.