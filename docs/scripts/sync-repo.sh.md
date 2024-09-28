# Sync Git Repository Script

---

**sync-repo.sh**: Script to synchronize a local git directory with its remote counterpart, utilizing color-coded output and optional formatting with external tools.

---

### Dependencies

- `bat`: Enhances syntax highlighting and formatting of command outputs.
- `glow`: Renders markdown in the terminal for improved readability.

### Description

The `sync-repo.sh` script is designed for users on Arch Linux using qtile as their window manager. It automates the process of synchronizing local git repositories with their remote counterparts. The script does so through several sophisticated steps:

- It verifies the presence of dependencies (`bat` and `glow`) to enhance the output but gracefully warns the user if they are missing.
  
- Utilizes colored output to differentiate between commands, status messages, and errors, enhancing the readability of terminal sessions.

- Provides a comprehensive user experience by offering color-coded command lines with potential for error handling and conflict resolution.

- Handles typical sync operations such as fetching, rebasing, stashing, committing, and pushing changes, while providing a mechanism to resolve conflicts via user selection.

### Usage

To use the `sync-repo.sh` script, execute it from the terminal followed by the path to your local git repository:

```bash
./sync-repo.sh <repository_path>
```

#### Examples

- Synchronizing when the script is in the `PATH` and the repository is in `~/.scripts`:

  ```bash
  sync-repo.sh ~/.scripts
  ```

- Using an environment variable for the path:

  ```bash
  sync-repo.sh $SCRIPTS
  ```

- Using an alias (e.g., `git_sync`) set to simplify the command:

  ```bash
  git_sync $SCRIPTS
  ```

---

> [!NOTE]
> The script is robust and handles many common scenarios, such as missing directories or non-git repositories. However, consider adding logging capabilities to help troubleshoot failed operations or errors. Also, the script defaults to `vim` for conflict resolution (`${EDITOR:-vim}`), which might cause issues if `vim` is not installed or configured as default. Ensure compatibility with this editor or provide an option to customize it.