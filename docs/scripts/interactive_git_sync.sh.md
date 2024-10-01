# Interactive Git Sync Script

---

**interactive_git_sync.sh**: A script to synchronize multiple Git repositories interactively.

---

### Dependencies

- `fzf`: A command-line fuzzy finder that allows for easy selection from a list.
- `sync-repo.sh`: A custom synchronization script that handles the actual sync for each repository.

### Description

The `interactive_git_sync.sh` script is designed to streamline the process of syncing multiple Git repositories with a user-friendly interface. This script leverages `fzf` for interactive selection, allowing you to choose from a list of predefined repository paths. 

The script begins by defining the paths of various repositories, stored in options variables such as `$CHEZMOI`, `$SCRIPTS`, `$LOCALDATA`, `$PSYRIS`, and a specific GitHub repository path. It constructs a command to execute the `sync-repo.sh` script with the selected repository path.

It also includes a `--dry-run` option, which allows users to see what would happen if the command were executed without making any changes. This is handled through a condition that modifies the command accordingly.

### Usage

To use this script, simply run it in your terminal:

```bash
~/ .scripts/interactive_git_sync.sh
```

You can also pass an optional argument to filter the list:

```bash
~/ .scripts/interactive_git_sync.sh <search-string>
```

To conduct a dry run simulation, use:

```bash
~/ .scripts/interactive_git_sync.sh --dry-run
```

This will display the options for synchronization without actual changes taking place.

---

> [!TIP]
> Consider enhancing the script by adding error handling to manage potential issues when executing the sync command. For instance, if the specified repository does not exist or `sync-repo.sh` fails, the user should receive a clear message instead of silent failure. Additionally, documenting each variable's source (e.g., whether they are user-defined paths or default paths) can help in troubleshooting and usability.