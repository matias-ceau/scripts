# Simple Repository Synchronization Script

---

**sync-repo-simple.sh**: Automates syncing a git repository, handling conflicts, and providing sync summaries.

---

### Dependencies

- `git`: Essential for interacting with git repositories.
- `bash`: Required to execute the script.
- `realpath`: Used for obtaining the absolute path of the provided repository.
  
### Description

This script automates the synchronization process of a git repository by executing a series of git commands. It addresses common scenarios encountered during repository synchronization, such as merge conflicts and stashing local changes. The script handles the repository specified by the user, changes directories, and performs operations like fetch, pull, stash, and push, ensuring the repository is up-to-date with its remote counterpart.

Key functionalities include:
- **Conflict Resolution**: Provides options for resolving merge conflicts and stashing conflicts, allowing users to choose between local, remote, or manual resolutions.
- **Commit Message Generation**: Automatically generates a commit message reflecting the number of changes and user details.
- **Error Handling**: Outputs errors and halts proceedings if critical issues are encountered.
- **Sync Summary**: Displays a summary including commit information, changes, and timestamps post-sync.

### Usage

To run the script, use the command line and provide the path to your repository:

```bash
chmod +x /home/matias/.scripts/bin/sync-repo-simple.sh
/home/matias/.scripts/bin/sync-repo-simple.sh /path/to/your/repo
```

- The script can be executed directly from a terminal.
- It can also be set as a keybinding in qtile or included in automation scripts.
- Provides help output with `--help` or `-h` flags.
  
### Example

```bash
/home/matias/.scripts/bin/sync-repo-simple.sh ~/projects/my-repo
```

---

> [!TIP]
> While the script effectively handles basic repository synchronization, it could be enhanced by providing clear output for the `help` command or invalid input cases. Additionally, incorporating more detailed logging or verbose mode could aid in debugging and transparency of operations.