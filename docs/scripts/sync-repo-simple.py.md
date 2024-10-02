# Simple Git Repository Synchronization Script

---

**sync-repo-simple.py**: Automates syncing a local git repository with its remote counterpart.

---

### Dependencies

- `git`: The version control system that the script interacts with.
- `python3`: The programming language used to run the script.
- `bash`: The shell environment for command execution.

### Description

This script is designed to simplify the synchronization of a local git repository with its remote version. Designed primarily for users running on Arch Linux with the Qtile window manager, it handles a variety of git operations seamlessly.

The script operates through a series of functions that implement git commands, providing error handling in cases of conflicts during merging or stashing. Key functionalities include:

- **Command Execution**: The `run_command` function executes shell commands and captures their output.
- **Commit Message Generation**: Automatically creates meaningful commit messages based on local changes.
- **Conflict Resolution**: Provides interactive prompts to resolve merge and stash conflicts, allowing user choices to manually edit or discard local changes.
- **Summary Display**: After execution, it summarizes the sync operations, including commit times and last changes.

### Usage

To use the script, navigate to the terminal and execute the following command, providing the path to the git repository as an argument:

```bash
python3 /home/matias/.scripts/sync-repo-simple.py /path/to/your/repo
```

#### Example
```bash
python3 /home/matias/.scripts/sync-repo-simple.py ~/projects/my-project
```

In absence of the repository path, the script will return an error and exit. Ensure your working directory is a valid git repository; otherwise, it will notify about invalid conditions.

The script also prompts for choices when conflicts arise during merges or stashes, making it user-friendly for resolving issues without requiring deep git knowledge.

---

> [!TIP] 
> While this script effectively handles basic git operations, consider adding features like logging individual command outputs to a file for advanced troubleshooting. Adding unit tests could also help ensure that future changes do not break existing functionality.