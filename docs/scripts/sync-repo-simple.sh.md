# Simple Git repo sync (fetch/pull/stash/commit/push)

---

**sync-repo-simple.sh**: Sync a git repo with remote, stashing local changes and auto-committing

---

### Dependencies

- `bash`
- `git`
- `realpath` (from `coreutils`) — resolves the repo path
- `awk`, `sed`, `grep`, `wc` — used for repo name parsing and commit message
- `$EDITOR` (fallbacks: `vim` for merge conflicts, `nvim` for stash conflicts)

### Description

`sync-repo-simple.sh` is an opinionated “one command sync” helper for a single repository directory. It:

1. Validates the provided path, `cd`s into it, and ensures it’s a Git repository.
2. Fetches all remotes (`git fetch --all --prune`).
3. If the local branch isn’t up to date with its upstream (`@{u}`), it:
   - stashes local modifications (if any),
   - tries a fast-forward merge (`git merge --ff-only @{u}`),
   - falls back to a rebase pull (`git pull --rebase <remote> <branch>`),
   - offers an interactive conflict handler if rebase/merge fails.
4. Re-applies stashed changes and interactively resolves conflicts file-by-file (ours/theirs/manual).
5. If there are local changes after syncing, it stages everything, generates a simple commit message (`N change(s) from user@host`), commits, then pushes. If push fails, it tries a fast-forward pull and retries the push.
6. Prints a quick summary including timestamps and `git diff --stat HEAD^`.

### Usage

Run from anywhere (it will return to your original directory):

    sync-repo-simple.sh /path/to/repo

Help (minimal):

    sync-repo-simple.sh --help
    sync-repo-simple.sh -h

Typical qtile/keybinding use (interactive on conflicts, uses `$EDITOR`):

- Bind to a terminal command (recommended), since prompts may appear:
  - Conflict resolution menu during pull/rebase
  - Per-file stash conflict choices: `r` (theirs), `l` (ours), `m` (manual)

---

> [!WARNING]
> - The stash re-apply logic is likely inverted: `if ! [[ $(git stash list) ]]; then ... git stash pop` will try to pop when the stash list is empty. Consider using `if [[ -n $(git stash list) ]]; then`.
> - `run_command()` prints and `eval`s strings: this is fragile with quoting and can be unsafe. Prefer arrays or direct `git` invocations.
> - Remote detection uses `git remote` (could return multiple). Picking the first remote explicitly (e.g., `origin`) would be more predictable.
> - `git reset --hard` in conflict handling can discard work; consider a safer option or an extra confirmation prompt.