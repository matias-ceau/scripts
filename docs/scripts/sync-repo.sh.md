# Sync Git Repository Script

---

**sync-repo.sh**: A script for syncing a Git repository, including fetching, pulling, and handling conflicts.

---

### Dependencies

- `git`: Version control system required for repository operations.
- `bat`: A cat clone with syntax highlighting and Git integration for better output display.
- `glow`: A markdown viewer for terminal that enhances the display of markdown formatted output.

### Description

This script automates the process of syncing a Git repository by fetching the latest changes, rebasing them onto local branches, and handling potential merge conflicts interactively. It begins by checking for necessary tools like `bat` and `glow`, providing warnings if they are not installed. The script features custom functions for output formatting, command execution, and error handling. It intelligently manages local changes by stashing them before pulling updates and applies them afterward.

Key functions include:

- **strip_ansi**: Removes color codes from text for cleaner output in certain contexts.
- **print_command**: Displays commands being executed, highlighting them with `bat` if available.
- **handle_conflicts**: Offers options to resolve conflicts during a rebase, enhancing user interactivity.

### Usage

To use the script, run it from the terminal with the path to the repository as an argument:

```bash
./sync-repo.sh <repository_path>
```

**Examples:**

- Sync a repository located at `~/.scripts`:
    ```bash
    ./sync-repo.sh ~/.scripts
    ```
- If you have defined an alias in your shell configuration:
    ```bash
    git_sync $SCRIPTS
    ```

### Important Commands

The script performs several essential Git operations:
- **git fetch**: Grabs the latest changes from the remote repository.
- **git pull --rebase**: Integrates changes, reapplying local commits on top of incoming changes.
- **git stash**: Temporarily saves local modifications to allow for safe pulling of updates.

---

> [!TIP] 
> This script could benefit from additional logging capabilities to help users troubleshoot issues more effectively. Additionally, it implies user interaction during conflict resolution, which might be automated for advanced users to improve workflow efficiency. Consider encapsulating logic that checks for changes before performing network operations, thus streamlining the process further.