# Legacy Sync Repository Script

---

**legacy-sync.repo.sh**: A script to synchronize a Git repository while providing enhanced output formatting.

---

### Dependencies

- `bat`: A `cat` clone with syntax highlighting and Git integration.
- `glow`: A terminal-based markdown viewer for enhanced output display.

### Description

The `legacy-sync.repo.sh` script is designed to streamline the process of syncing a local Git repository with its remote counterpart. It incorporates user-friendly enhancements such as color-coded outputs and formatted command displays using `bat` and `glow`.

This script starts by checking for the presence of `bat` and `glow`, issuing warnings if they aren't installed. It defines utility functions for displaying commands, handling errors, and managing conflicts during the `git pull --rebase` operation.

Key features include:
- Enhanced command output via `bat` or regular echoing, depending on availability.
- User interaction for managing merge conflicts with options to abort or skip.
- Automatic stashing of local changes before pulling updates and applying them afterward.
- A final summary displaying the log of changes after the sync process.

### Usage

To execute the script, use the following command format:

```bash
./legacy-sync.repo.sh <repository_path>
```

**Examples:**
```bash
./legacy-sync.repo.sh ~/.scripts  # Execute from the path if script is located there
./legacy-sync.repo.sh $SCRIPTS     # Use an environment variable
git_sync $SCRIPTS                  # Invoke using an alias for convenience
```

**Note:** Ensure that you are in a terminal where `bat` and `glow` are properly configured to get the intended output formatting.

---

> [!TIP]
> 
> The script makes extensive use of color coding and external utilities. If you wish to make it more universally usable, consider allowing a flag to disable these features for environments where these tools are not available. Additionally, ensure that the `git` commands are executed in an environment that has the necessary permissions to avoid runtime errors during the sync process.