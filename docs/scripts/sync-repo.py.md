# Python Git Repository Synchronizer

---

**sync-repo.py**: Python utility for automating git repository synchronization with rich terminal UI, local/remote conflict handling, and progress feedback.

---

### Dependencies

- `python` (>=3.7): Required for script execution.
- `rich`: For terminal UI components (progress bars, tables, syntax highlighting, etc.).  
  > Install via: `pip install rich`
- `git`: Used for command-line git operations.
- User Environment:
  - Editor: Uses `$EDITOR` (defaults to `vim`/`nvim` in some flows).
  - Runs best in an interactive terminal.
- Other tools: (used via subprocess in subshells, typically already installed)
  - `awk`, `grep`, `sed` (for repo name extraction)

---

### Description

This script provides a streamlined workflow for synchronizing a git repository with its remote, automating fetch, pull, stash, add, commit, push, and handling both merge and stash conflicts interactively with concise feedback in a colorful Rich-style interface.

#### Core features:
- **Automatic Syncing:** Runs `git fetch`, handles fast-forwards, and rebases automatically. Attempts to keep the workflow non-blocking unless manual intervention is strictly required.
- **Stash/Conflict Handling:** If you have uncommitted local changes, they're stashed and later re-applied. Any conflicts are detected, and the script offers clear options for manual resolution, keeping local/remote, or opening your `$EDITOR` for both merge or stash conflict resolution.
- **Status and Summaries:** Summarizes repository state before and after sync, includes commit, time, and diff statistics in a tabular view.
- **Commit Automation:** Automatically creates messages indicating the number of changes and basic user/host info.

#### Functions breakdown:
- `run_command`: Prints, runs, and syntax-highlights git commands.
- `handle_merge_pull_conflicts` & `handle_stash_conflict`: User-friendly handling for git conflicts (merge or stash).
- `display_summary`: Shows key commit/diff info in a table.
- The script expects a git repo path, checks its validity, and runs in the selected folder.

---

### Usage

Simple usage example (Arch, qtile, terminal):

```
python /home/matias/.scripts/bin/sync-repo.py ~/dev/my_project
```

Or for use as a keybinding (with qtile or similar WM):

- Assign the script to a key shortcut, optionally with a dmenu prompt to select the repo path.

**Behavior summary:**
- If everything is clean: fetch/pull/commit/push quietly.
- If changes/conflicts: prompts you, guides you through resolution.

**Interactive resolution:**

- During merge conflicts:  
  - `[e]` open `$EDITOR`,  
  - `[a]` abort merge,  
  - `[s]` skip commit.
- During stash conflicts:  
  - `[r]` use remote,  
  - `[l]` keep local,  
  - `[m]` manual edit.

---

> [!TIP]
>
> - **Robustness:** Script mostly assumes origin/main structure. It could break for more complex remote configs or bare repos.
> - **Hardcoded flows:** It assumes command-line tools like `awk`/`sed` in your shell, and some git commands are not cross-repo/branch robust.
> - **Environment reliance:** Relies on `$EDITOR`, `$USER`, `$HOSTNAME` being set.
> - **Potential improvements:**
>   - Add thorough exception handling for subprocesses.
>   - Make prompts/commands more configurable (select both branch and remote explicitly).
>   - Use proper git plumbing over shell-grade command parsing for increased reliability.
>   - Support dry-run mode or add logging.
>   - Allow non-interactive operation for automation (e.g., pass options via args for CI).
>
> Despite being highly functional for daily CLI-driven syncing and conflict handling, be mindful of repo-specific edge cases and multi-remote/branch workflows!