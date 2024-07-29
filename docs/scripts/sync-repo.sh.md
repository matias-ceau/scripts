# sync-repo.sh

# sync-git-repo.sh

### Description

This script (`sync-git-repo.sh`) is used to sync a local Git repository with its remote counterpart. It automatically fetches, stashes, rebases, and pushes changes, while also handling conflicts and providing user feedback along the way.

### Features

- **Fetch Latest Changes:** Fetches the latest changes from the remote repository without merging.
- **Rebase and Stash:** Rebases the local changes onto the latest remote changes and stashes any uncommitted local changes if needed.
- **Conflict Management:** Provides options for handling conflicts that may arise during rebase.
- **Commit & Push Changes:** Adds, commits, and pushes any local changes to the remote repository.
- **Status Display:** Displays the status of the repository and a summary of changes after syncing.
- **Pretty Output:** Utilizes tools like `bat` and `glow` to format and highlight output, if available.

### Usage

```bash
./sync-git-repo.sh <repository_path>
```

Example:

```bash
./sync-git-repo.sh ~/.scripts
```

### Requirements

- A Unix-like system with Bash installed.
- Optional: `bat` and `glow` for improved output formatting.

### Functions

- **strip_ansi:** Strips ANSI escape sequences from a string.
- **print_command:** Prints a command with optional pretty formatting.
- **run_command:** Runs a command and prints its output in real-time.
- **handle_error:** Handles errors by printing a message and exiting the script.
- **print_usage:** Prints the usage instructions.
- **print_formatted:** Prints a formatted message, optionally using `bat`.
- **print_glow:** Prints a formatted message using `glow`, if available.
- **handle_conflicts:** Provides options to handle conflicts during rebase.
- **display_summary:** Displays a summary of the sync operation.

### Workflow

1. **Check for Required Tools:** Verifies if `bat` and `glow` are installed and sets flags to use them if available.
2. **Argument Check:** Ensures a repository path is provided.
3. **Directory Validation:** Checks if the provided path is a valid directory and a Git repository.
4. **Fetching Changes:** Fetches latest changes from the remote repository.
5. **Stashing Changes:** Stashes any local changes before attempting to rebase.
6. **Rebasing Changes:** Rebases local changes onto the latest remote changes.
7. **Conflict Handling:** If conflicts arise, provides options to resolve them.
8. **Applying Stashed Changes:** Applies stashed changes if any.
9. **Committing Changes:** Commits and pushes any local changes to the remote repository.
10. **Status and Summary:** Displays the status and a summary of the sync operation.

### Example Output

```text
Syncing repository in /path/to/repo
$ git fetch origin main
...
$ git stash
...
$ git pull --rebase origin main
...
Conflicts detected during rebase. Here are your options:
1. Open your default editor to resolve conflicts manually
2. Abort the rebase and return to the previous state
3. Skip this commit and continue with the next one
Enter your choice (1/2/3):
...
$ git status -s
...
$ git add -Av
...
$ git commit -m "X change(s) from user@host"
...
$ git push origin main
...
```

### Author

*This script was automatically documented using a helpful assistant.*

---

Feel free to contribute, suggest improvements, or report issues on the [GitHub repository](https://github.com/yourusername/yourrepository).