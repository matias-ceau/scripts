# Git Repository Synchronization Script

---

**sync-repo.sh**: Automates synchronization of a Git repository with support for conflict handling.

---

### Dependencies

- `git`: Essential for version control operations.
- `bat`: Enhances output readability with syntax highlighting.
- `glow`: Formats markdown output prettily in the terminal.
  
Both `bat` and `glow` are optional, but recommended for better visual output.

### Description

This script automates the process of keeping your local Git repositories synchronized with their remote counterparts. It checks for dependencies like `bat` and `glow` to improve the user interface but functions without them. Key functionalities include:

- **Fetch and Prune**: It fetches updates from all remotes while pruning obsolete references.
- **Conflict Resolution**: Manages merge conflicts and stashed changes with manual resolution options in the default editor.
- **Commit Automation**: Auto-generates commit messages based on changes detected.
- **Dry-run Mode**: Simulates actions without making actual changes.
  
The script includes several parameters for customization and a suite of utility functions for error handling, command printing, and output formatting.

### Usage

Run in the terminal or bind it to a key in your qtile configuration for automatic execution:

```bash
./sync-repo.sh /path/to/repo [--dry-run] [--help]
```

- `<repository_path>`: Path to the Git repository you wish to sync.
- `--dry-run`: Executes the script in a simulation mode without making any changes to the repository.
- `--help` or `-h`: Displays usage instructions.

**Examples:**

- Sync with actual changes:
  ```bash
  ./sync-repo.sh ~/my-repo
  ```
- Perform a dry run:
  ```bash
  ./sync-repo.sh ~/my-repo --dry-run
  ```

---

> [!TIP]
> The script currently assumes no other long-running processes are interfacing with the repository. Integrating this into a larger automation pipeline should ensure no simultaneous operations are being executed on the same Git directory. Additionally, considering implementing a log output option might help track changes and processes executed by the script for future debugging or review.