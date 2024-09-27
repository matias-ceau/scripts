# Sync Git Repository

---

**sync-repo.sh**: A script to synchronize a local Git repository with its remote counterpart.

---

### Dependencies

- `git`: The version control system utilized for managing source code.
- `bat`: A clone of `cat` with syntax highlighting and Git integration. It enhances the readability of output.
- `glow`: A terminal markdown renderer that allows formatted output for better visibility.

### Description

`sync-repo.sh` is a Bash script designed for Arch Linux users using the Qtile window manager to facilitate the synchronization of a local Git repository with a remote repository. The script incorporates various functionalities to enhance usability and provide visual feedback on operations.

Key features include:

- Color-coded output for warnings and errors, enhancing the user experience.
- Integration of `bat` for pretty-printing commands and their outputs.
- Usage of `glow` to display formatted messages when supported.
- Support for stashing local changes, pulling updates from the remote, handling merge conflicts with interactive choices, and pushing commits.

The script is modular with clearly defined functions for command execution, error handling, displaying usage information, and summarizing sync results.

### Usage

To use the script, run it from the terminal by providing the path to the repository you wish to sync:

```bash
./sync-repo.sh <repository_path>
```

**Examples:**

- Syncing the repository located under `~/.scripts`:
    ```bash
    ./sync-repo.sh ~/.scripts
    ```

- Syncing a repository using an environment variable:
    ```bash
    ./sync-repo.sh $SCRIPTS
    ```

- Syncing a repository if you have set an alias for the script (e.g., `git_sync`):
    ```bash
    git_sync $SCRIPTS
    ```

If the script detects that it is being executed without arguments, it will display a usage guide.

---

> [!TIP]  
> Consider improving the error handling, especially for nested Git operations. Currently, the script aborts on the first failure; adding a feature to prompt the user for resolution can enhance workflow. Additionally, integrating logging functionality could trace operations for better troubleshooting in complex scenarios.