# Simple Git repo sync (fetch/rebase/stash + auto-commit)

---

**sync-repo-simple.py**: Sync a git repo: pull/rebase safely, auto-commit local changes, then push

---

### Dependencies

- `python` (python3)
- `git`
- `awk`, `sed`, `grep` (used to derive a human-readable repo name from `git remote -v`)
- `$EDITOR` (optional) default: `vim` for merge conflicts, `nvim` for stash conflicts

### Description

This script is a “one-shot” synchronizer for a given Git repository directory. It:

1. Validates the provided path is a directory and a Git repo (`.git` exists).
2. Detects:
   - `remote` via `git remote`
   - `local` branch via `git branch --show-current`
   - a display `repo_name` parsed from the fetch URL
3. Fetches everything (`git fetch --all --prune`), then attempts to update the current branch from its upstream:
   - If a fast-forward merge is possible: `git merge --ff-only @{u}`
   - Otherwise: tries `git pull --rebase <remote> <branch>`
   - If rebase/merge conflicts happen, it offers interactive conflict handling (abort/skip/manual editing).
4. If local changes exist before pulling, they’re stashed and later re-applied; stash conflicts are handled per-file with an interactive “ours/theirs/manual” choice.
5. If there are local changes after syncing, it stages everything (`git add -A`), generates a commit message like `N change(s) from user@host`, commits, and pushes. If push fails, it retries after a fast-forward pull.
6. Prints a quick summary including `git diff --stat HEAD^`.

### Usage

Run from anywhere (good for a qtile keybinding, but interactive when conflicts occur):

    sync-repo-simple.py ~/path/to/repo

Typical “tldr” flows:

    # Sync repo (fetch + pull/rebase + commit+push if needed)
    sync-repo-simple.py ~/.dotfiles

    # Use a custom editor for conflict resolution
    EDITOR=nvim sync-repo-simple.py ~/code/project

Notes:
- If conflicts occur, you’ll be prompted in the terminal; don’t run it “silent” in the background.

---

> [!TIP]
> Improvements to consider:
> - Bug: `git diff --quiet {local} @{u}` is missing an f-string, so `{local}` won’t expand; it should be `f"git diff --quiet {local} @{{u}}"`.
> - `remote = git remote` may return multiple remotes; consider defaulting to `origin` or letting the user choose.
> - `git reset --hard` for “skip” is destructive; a safer approach is `git rebase --skip` (when rebasing) or clearer state-dependent logic.
> - Parsing repo name via `awk/sed` is brittle; consider `git remote get-url <remote>` and Python parsing (handles SSH/HTTPS reliably).