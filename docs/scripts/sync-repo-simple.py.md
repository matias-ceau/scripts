# Simple Git Repository Synchronization Script

---

**sync-repo-simple.py**: A script to automate synchronization of a local git repository with its remote counterpart

---

### Dependencies

- `python3`: Required to run the script.
- `git`: Required for executing git commands.
- `argparse`: Built-in python library for parsing command line arguments.
- `subprocess`: Built-in python library for executing shell commands.

### Description

This script is designed to automate the process of synchronizing a local git repository with its remote. It manages fetching, pulling changes, and handling commit conflicts using merge or rebase strategies. Key functionalities include:
- **Merge & Stash Conflict Handling:** Offers options to resolve conflicts manually or by choosing between local and remote changes.
- **Commit Message Generation:** Dynamically generates commit messages based on changes and user environment variables.
- **Status Display & Summary:** Provides a detailed overview of the sync process including changes, commit history, and timestamps.

It intelligently uses `subprocess` to execute shell commands and capture their output, allowing for dynamic interaction with the git workflow. 

### Usage

To use the script, it must be executed from a terminal session. Here's a quick guide:

```sh
./sync-repo-simple.py /path/to/your/repo
```

Ensure you have provided the path to your local git repository as an argument. The script automates the following processes:
1. **Fetching and Pulling:** It fetches all remote branches and attempts to fast-forward or rebase if necessary.
2. **Conflict Management:** If conflicts arise, it offers interactive options for resolution.
3. **Committing & Pushing:** Checks for local changes, stages them, and pushes to the remote.
4. **Summary Display:** Concludes with a brief summary of the operations performed.

You can bind this script to a key combination in your qtile configuration for quick access.

---

> [!WARNING]
> The script currently uses basic input() calls for handling user decisions during conflict resolution. This does not support non-interactive environments. Consider replacing these with environment-specific solutions or flags for better automation and error handling in scripts without user presence.
