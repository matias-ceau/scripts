# Simple Git Repo Sync Script

---

**sync-repo-simple.py**: Automates syncing a git repository, handling conflicts, stashing, and summary output.

---

### Dependencies

- `python3` - The script runs as a Python 3 interpreter.
- `git` - All operations use Git CLI commands.
- `awk`, `sed`, `grep` - Used in parsing remote URLs (ensure these standard POSIX tools are available, typically present on Arch Linux).
- ENV variables: `EDITOR` or falls back to `vim`/`nvim` for manual conflict resolution.

### Description

This script efficiently automates the process of synchronizing a git repository. It is specifically geared for day-to-day command-line workflow, such as on an Arch Linux system managed by qtile. The core functionality includes:

- **Fetching and pulling (with rebase fallback):** Detects local/remote divergence; if a fast-forward is not possible, a rebase is attempted.
- **Conflict Handling:** Handles both merge and stash conflicts, prompting for user intervention when required. It leverages your `$EDITOR` (default `vim` or `nvim`) to resolve merge or stash conflicts interactively.
- **Stashing:** If local changes are present before pulling, they're automatically stashed and re-applied after remote updates, with dedicated handling for conflicted files.
- **Automatic Commit and Push:** If changes are detected in the repository, the script adds, commits (with an auto-generated message describing user and host), and pushes them.
- **Summary Output:** At the end of the sync, prints a contextual summary showing commit times and a diffstat of the recent change.

The script is designed to be robust, stopping on errors for manual intervention, and aiming for minimal interaction except in cases of conflicts.

### Usage

You can run this script directly from the terminal or integrate it into a keybinding or shortcut within qtile or your shell. Example usage:

```bash
sync-repo-simple.py /path/to/your/repo
```

**Arguments:**
- `repo_dir` (*required*): Path to the git repository you wish to sync.
  
**Example:**
```bash
sync-repo-simple.py ~/projects/mydotfiles
```

- The script prints diagnostic and status information throughout the process.
- On conflicts, you'll be prompted interactively in the terminal to resolve them.

**Editor for Conflicts:** Set your preferred editor in your environment:
```bash
export EDITOR=nvim
```
or let it default to `vim`/`nvim`.

---

> [!TIP]
> **Critique:**  
> - The script assumes only one remote; in multi-remote setups, its behavior may not be as intended.
> - Command-line parsing is minimal; no verbosity flags or dry-run mode.
> - Using `shell=True` with user data in commands introduces potential security issues; safer subprocess argument handling is recommended.
> - Uses repeated subprocess calls (`git status -s` is run several times), which could be minimized for performance.
> - Error messages are printed to stderr, but exit codes are inconsistent (for example, unsuccessful pushes try again but don't alert if the retry fails).
> - The script’s remote URL parsing is a bit brittle, relying on shell command composition; using pure python (e.g., `gitpython`) would be more robust.
> - Good scripting discipline overall; could benefit from modularization or adapting a library like `GitPython` for advanced setups.