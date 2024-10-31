# Git Repository Sync Script

---

**sync-repo.py**: A script to automate syncing of a local git repository with its remote counterpart, handling stashing, fetching, merging, and conflict resolution.

---

### Dependencies

- `python3`: The script is written in Python and requires Python 3 to run.
- `argparse`: This is part of the Python standard library for parsing command-line options.
- `rich`: A Python library used for rich text and beautiful formatting in the terminal.
- `git`: The script relies extensively on Git commands, which have to be installed on your system.

### Description

This Python script automates the process of keeping a local git repository synchronized with its remote. It fetches updates, applies stashed changes, and resolves potential conflicts. It is built using Python's `subprocess` to execute Git commands, and `rich` for colorful and user-friendly terminal outputs.

Key features:
- **Fetch and Pull:** It fetches all updates from the remote.
- **Merge and Rebase:** If necessary, it performs a rebase or handles a merge conflict resolution via user interaction.
- **Stash Conflicts:** Handles any stashed changes and resolves conflicts with options to choose remote or local versions.
- **Commit and Push:** Automatically adds and commits any local changes and pushes them to the remote.
- **Summary Display:** At the end, it provides a comprehensive summary of the repository status using a `rich` table.

### Usage

To use the script, it can be run directly from the terminal with the path to the local git repository as an argument. Here is a quick example:

```bash
python3 /home/matias/.scripts/bin/sync-repo.py /path/to/your/repo
```

- **`repo_dir`:** The argument `repo_dir` is the path to the local git repository you want to sync. It defaults to the current directory if not specified.

The script requires an environment where it can interact with the user for conflict resolution, best run via a terminal or console.

---

> [!NOTE]
> - **Dependencies**: Consider explicitly checking for and installing the script's dependencies (`rich` and `git`) to minimize runtime errors.
> - **Error Handling**: While user prompts for conflict resolution are helpful, logging detailed errors to a file could make troubleshooting easier.
> - **Customization**: Consider adding an option for a dry-run to review changes without applying them. This could be beneficial for cautious users.