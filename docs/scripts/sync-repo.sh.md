# Sync Git Repository Script

---

**[sync-repo.sh](sync-repo.sh)**: Bash script for synchronizing a Git repository with practical features

---

### Dependencies

- `bat`: A command-line tool that provides syntax highlighting and styled output for terminal commands.
- `glow`: A tool for rendering Markdown content in the terminal with styled output.

### Description

This script is designed to streamline the process of syncing a Git repository, providing colorful output and user-friendly features. It incorporates error handling, conflict resolution, and accessibility options for users who prefer to visualize their command outputs.

Key functionalities include:

- **Colorful output**: Uses ANSI escape codes to provide visually appealing feedback during execution.
- **Command execution and logging**: Each Git command is preceded by a printed message indicating which command is being executed, using the `bat` command for enhanced readability if it's installed.
- **Conflict resolution**: If conflicts arise during the rebase process, the script offers interactive options for the user to resolve these issues.
- **Summary display**: After syncing, it provides a summary of changes made during the synchronization process.

### Usage

To use the script, you can run it directly from the terminal, passing the path of the git repository you wish to sync as an argument:

```bash
./sync-repo.sh <repository_path>
```
**Example**:

```bash
./sync-repo.sh ~/.scripts
```

The script will:
1. Check if the provided path is a valid Git repository.
2. Fetch the latest changes and, if necessary, perform a rebase operation.
3. Handle any conflicts that may occur during rebasing.
4. Commit any local changes and push them to the remote repository.
5. Provide a summary of changes made.

### Important Notes

- Ensure that `bat` and `glow` are installed to make the most of the colorful outputs.
- You must have adequate permissions to perform Git operations in the specified repository.

---

> [!TIP]  
> The script could be improved by adding more detailed error handling for specific Git commands. Consider implementing logging to a file for audit purposes, especially in collaborative environments where tracking script execution is beneficial.
