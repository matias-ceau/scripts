# Sync Git Repository

---

**sync-repo.sh**: A script to sync a git repository, fetching changes, stashing local modifications, and pushing updates.

---

### Dependencies

- `git`: Essential for version control operations.
- `bat`: A cat clone with syntax highlighting and Git integration, used for displaying commands and outputs prettily.
- `glow`: A terminal-rendered Markdown viewer for prettier output.

### Description

This script automates the process of syncing a Git repository. It performs various tasks including fetching updates from a remote repository, checking for conflicts, stashing local changes, and applying those changes after a successful pull. 

Key functionalities include:

- **Command Handling**: The script checks for the presence of dependencies (`bat` and `glow`) to enhance output formatting. If any are missing, it warns the user.
- **Conflict Resolution**: Provides a user interface to resolve merge conflicts, allowing the user to either manually resolve, skip the commit, or abort the rebase.
- **Visual Output**: Enhanced visual output is presented based on the availability of `bat` and `glow`, providing a user-friendly experience.

### Usage

Run the script from the terminal with the following syntax:

```bash
./sync-repo.sh <repository_path>
```

**Example Usage**:

```bash
./sync-repo.sh ~/.scripts
```

This command will sync the repository located at `~/.scripts`. If no repository path is provided, the script will show usage instructions.

After fetching the latest changes and managing local modifications, it commits and pushes changes if there are any. 

Finally, it displays a summary of the sync and returns to the original directory where the script was executed.

---

> [!TIP]
> This script is well-structured, but there is room for improvement. Implementing a logging mechanism for actions taken during execution could be beneficial for debugging. Additionally, enhancing error handling could provide clearer feedback to the user. Consider using more modular functions for better maintainability, especially for conflict management and summary reporting.