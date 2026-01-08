# gsi — Improved Git sync helper (fetch/rebase/commit/push)

---

**gsi.sh**: One-shot git sync: fetch, fast-forward/rebase, auto-commit, push (optional dry-run)

---

### Dependencies

- `git` (with an upstream set for the current branch)
- `bash`
- `realpath` (from `coreutils`)
- `sed`, `awk`, `grep`, `wc` (core userland)
- `bat` (optional) — prettier command/output rendering
- `glow` (optional) — nicer markdown-ish headings in terminal
- `$EDITOR` (optional) — used during conflict resolution (defaults to `vim`)

### Description

`gsi.sh` is a convenience sync script for your repos on Arch + qtile setups where you want a consistent “update & publish” routine.

What it does, in order:

1. Validates the target path and ensures it’s a Git repository.
2. Detects the current branch (`git branch --show-current`) and remote (`git remote`).
3. Fetches updates (`git fetch --all --prune`).
4. If the branch is behind its upstream:
   - stashes local uncommitted changes (if any),
   - tries `git merge --ff-only @{u}`,
   - falls back to `git pull --rebase <remote> <branch>`,
   - offers an interactive conflict handler (abort / skip / open editor).
   - re-applies the stash.
5. Shows `git status -s`, and if there are changes:
   - stages everything (`git add -A`),
   - auto-creates a commit message like `N change(s) from user@host`,
   - pushes, retrying after a fast-forward pull if needed.
6. Runs `git maintenance run` and prints a short “log/changes” summary.

### Usage

tldr:

- Sync a repo:
  - `gsi.sh ~/.scripts`
- Dry run (prints what would be executed):
  - `gsi.sh ~/.scripts --dry-run`

Notes:

- Designed to be run from anywhere (it `cd`s into the repo and returns).
- Works well as a shell alias or a qtile keybinding launching a terminal command:
  - `alacritty -e gsi.sh ~/path/to/repo`

---

> [!TIP]
> Improvements to consider:
> - `REMOTE="$(git remote)"` can return multiple remotes; prefer `git remote show` or default to `origin`.
> - `git diff --quiet "$LOCAL" "@{u}"` assumes an upstream exists; add a guard with `git rev-parse --abbrev-ref --symbolic-full-name @{u}`.
> - `handle_conflicts`: “skip” uses `git reset --hard` (destructive). Consider `git rebase --skip` when rebasing, or detect merge vs rebase state.
> - Auto-commit of *all* changes may be risky in repos with generated files; consider an allowlist, prompts, or `--no-commit` mode.