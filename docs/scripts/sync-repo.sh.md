# Sync Git Repository

---

**sync-repo.sh**: A Bash script to synchronize a Git repository efficiently.

---

### Dependencies

- `bash`: The script is written in Bash.
- `git`: Required for version control operations.
- `bat`: A cat clone with syntax highlighting and Git integration (optional for prettier output).
- `glow`: A terminal-based Markdown viewer (optional for formatted output).

### Description

This script automates the process of syncing a Git repository by integrating various Git commands while providing user-friendly output. 

Key features include:

- **Color-coded output**: Uses ANSI escape sequences to colorize terminal messages.
- **Prettified command output**: Uses `bat` to highlight commands for better readability.
- **Conflict resolution assistance**: Prompts the user with options if a conflict occurs during rebase.
- **Change summary**: Displays a summary of changes post-sync using `glow` for a more interactive experience.
- **Error handling**: Implements robust error checks at various stages to ensure smooth execution.

### Usage

To use the script, execute the following command in your terminal:

```bash
./sync-repo.sh <repository_path>
```

Here are some examples:

```bash
./sync-repo.sh ~/.scripts  # If in path
./sync-repo.sh $SCRIPTS    # If variable is set
git_sync $SCRIPTS          # If alias is set
```

### Additional Notes

- The script runs various Git commands such as `fetch`, `pull`, `stash`, and `push` depending on the current repository state.
- It handles potential changes by stashing local changes before attempting to pull and will apply stashed changes afterward.
- A summary of commits and any changes made will be displayed at the end.

---

> [!TIP]  
> Consider including error messages that give more context about failures as they occur. Additionally, you might want to enhance the user experience by allowing options to sync multiple repositories in one go or logging the operations to a file for future reference.