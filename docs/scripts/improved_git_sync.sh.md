# Improved Git Sync

---

**improved_git_sync.sh**: A script to sync a Git repository with additional error handling and output formatting.

---

### Dependencies

- `git`: Required for source control operations.
- `bat`: A cat clone with syntax highlighting and Git integration (optional for pretty print).
- `glow`: A terminal Markdown renderer (optional for pretty print).

### Description

The `improved_git_sync.sh` script is designed to facilitate the synchronization of a Git repository. It provides a user-friendly interface with color-coded output and improved error handling for common Git operations. The script performs several key functions:

- **Dependency Check**: Verifies the presence of `bat` and `glow`, providing warnings if they are absent.
- **Real-Time Command Execution**: Executes Git commands while displaying them in a formatted manner using the `print_command` function integrated with `bat`.
- **Merge Conflict Handling**: Offers interactive options when merge conflicts are detected, allowing the user to manually resolve conflicts, skip commits, or abort merges.
- **Dry Run Mode**: Allows users to simulate the syncing process without making changes, helpful for testing.
- **Sync Summary**: Upon completion, displays a summary of changes made, including the last commit and changes statistics.

### Usage

To use the script, you must provide the repository path as an argument. The script supports a dry run mode to verify changes before applying them. Here is how to invoke the script:

```bash
./improved_git_sync.sh <repository_path> [--dry-run]
```

#### Examples:

- Sync a specific directory:
```bash
./improved_git_sync.sh ~/my_git_repo
```

- Perform a dry run:
```bash
./improved_git_sync.sh ~/my_git_repo --dry-run
```

In case you set an alias in your shell, you might run:
```bash
git_sync ~/my_git_repo
```

---

> [!TIP]  
The script assumes that the repository is not just initialized but populated with remote data. Additionally, error handling could be improved by logging to a file for persistent error tracking rather than terminating execution on the first error. Consider using try/catch patterns or more robust error handling mechanisms to enhance the user experience.