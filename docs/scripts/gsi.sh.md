# Git Repository Sync and Info Utility

---

**gsi.sh**: Interactive, robust script for syncing a local Git repository with its remote, handling merges, conflicts, and summary display.

---

### Dependencies

- `git`: Core functionality for all sync operations.
- `bat`: Pretty-prints command lines and outputs for improved readability.
- `glow`: Markdown rendering for information and summaries in the terminal.
- `realpath`, `sed`, `awk`, `date`, `wc`, etc.: Standard GNU/Linux utilities for bash scripting.
- Optionally uses `${EDITOR:-vim}` for conflict resolution.
- Expects `bash` as the interpreter.

---

### Description

This script provides an enhanced, interactive command-line tool for keeping a local Git repository in sync with its remote, with a particular focus on visual clarity and safe automation. Features include:

- **Colorized, bat-highlighted command outputs** for easier tracking of actions.
- **Markdown rendering** (via `glow`) for readable summaries.
- **Intelligent handling of local changes:**
  - Warns about and stashes local modifications before pulling.
  - Attempts fast-forward merges, followed by rebase if necessary.
  - Can handle merge conflicts interactively: opens your $EDITOR, allows aborting/skipping, or manual resolution.
- **Dry-run support** to preview actions without making changes (via `--dry-run`).
- **Convenient push/commit logic:** if local changes are detected, automatically adds, commits (with informative message), and pushes.
- **Repository maintenance:** runs `git maintenance run` post-sync.
- **Human-friendly summary** printed using Markdown and glow.
- **Robust error handling**: colored messages and immediate exit on errors.
- **Usage and example display** when not enough arguments are given.

This script is particularly well-suited for workflow automation (e.g., bound to a key with Qtile), but is equally useful interactively. It's designed for fast switching between multiple Git repos, such as dotfiles or script collections.

---

### Usage

Basic usage from the terminal:
```
./gsi.sh <repository_path> [--dry-run]
```
#### Arguments:
- `<repository_path>`: (Required) Path to the git repository you want to sync.
- `--dry-run`: (Optional) Show what would happen, but make no changes.

#### Examples:
```
./gsi.sh ~/.scripts
./gsi.sh $SCRIPTS
./gsi.sh $HOME/repos/dots --dry-run
```
You can also alias in your shell or bind to a key in Qtile for rapid access.

#### On merge conflicts:
The script will prompt you for:
- `e`: Open $EDITOR to resolve conflicts (or default to vim)
- `a`: Abort
- `s`: Skip this commit

---

> [!TIP]
> - The script is functionally robust, but a few improvements are possible:
>   - No check for untracked files or dirty state pre-stash (could prompt the user or show a diff).
>   - Usage of `eval` for command execution in `run_command()` can be dangerous if input data is not well-controlled.
>   - For multi-remote repositories or detached HEAD state, remote/branch detection may not always yield the intended targets.
>   - The conflict handler covers only merge conflicts, but fails for non-merge-related errors (e.g., rebase problems).
>   - Some external tools (`bat`, `glow`) are optional, but script behavior might be less readable without them.
>   - Error messages could be enhanced to offer remediation advice directly.
>
> Overall, this script is very powerful for personal workflow on Arch Linux + Qtile!