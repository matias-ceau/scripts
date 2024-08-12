# Sync Git Repository

---

**sync-repo.sh**: A script to sync a local git repository with its remote counterpart.

---

### Dependencies

- `git`: Essential for version control; ensures manipulation of repositories.
- `bat`: A tool for catting files with syntax highlighting; enhances output readability.
- `glow`: A terminal-based Markdown viewer; improves display of formatted messages.

### Description

This script automates the process of syncing a local Git repository with its remote version. It includes functionality to handle conflicts that arise during the rebase process, providing an interactive method for resolving such issues. The script leverages two external tools—`bat` for enhanced output and `glow` for rendering Markdown-based messages—making the interaction terminal-friendly.

The script performs the following key functions:
- Checks if the necessary dependencies (`bat`, `glow`) are installed and sets corresponding flags.
- Strips ANSI escape sequences for cleaner output when necessary.
- Handles commands dynamically, providing formatted output using color coding and third-party tools.
- Manages conflicts during rebase, allowing the user to choose different resolution strategies.
- Displays a summary of changes made during the sync process.

### Usage

To run this script, provide the path of the repository you want to sync as an argument. The script can be executed from any terminal instance:

```bash
./sync-repo.sh <repository_path>
```

**Examples:**
```bash
./sync-repo.sh ~/.scripts  # Syncs the repository located in ~/.scripts
./sync-repo.sh $SCRIPTS    # Uses an environment variable to specify the path
```

The script also gracefully handles cases where there are:
- No changes to pull from the remote repository.
- Local uncommitted changes, prompting the user to manage them appropriately.

---

> [!TIP]  
> **Potential Improvements:** 
> - Consider adding support for displaying commit messages in a more user-friendly format.
> - Implement a notification system for successful syncs or errors that can integrate with desktop notifications.
> - Logging the output of each command to a log file could help in debugging issues more efficiently in the future.