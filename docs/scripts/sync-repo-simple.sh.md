# Simple Git repo sync (fetch/pull/stash/commit/push)

---

**sync-repo-simple.sh**: One-shot sync for a git repo with stash + conflict helpers

---

### Dependencies

- `git` — fetch/pull/rebase/commit/push workflow
- `bash` — script runtime (`/usr/bin/bash`)
- `realpath` — resolve the repo path (from `coreutils`)
- `$EDITOR` (fallbacks: `vim` / `nvim`) — used when conflicts require manual edits

### Description

This script is a “good enough” repo synchronizer designed for quick daily use on Arch (and easy binding from qtile). Given a repository path, it:

1. **Parses args**: expects exactly one positional argument: the repo directory. Performs basic validation (`.git` must exist).
2. **Fetches & integrates upstream**:
   - Runs `git fetch --all --prune`.
   - If the local branch differs from its upstream (`@{u}`), it stashes local modifications (if any), then tries:
     - `git merge --ff-only @{u}` (fast-forward),
     - otherwise falls back to `git pull --rebase`.
   - If pull/rebase hits conflicts, `handle_merge_pull_conflicts` offers interactive options (abort / skip / open editor and commit).
   - If stashed changes fail to re-apply, `handle_stash_conflict` lets you pick *theirs/ours/manual* per conflicted file.
3. **Commits & pushes local changes**:
   - If `git status -s` is non-empty, it stages everything (`git add -A`),
   - creates a simple commit message based on the number of changed files and host/user,
   - pushes to the detected remote and current branch, retrying after a fast-forward pull if needed.
4. **Prints a quick summary** with recent commit times and `git diff --stat HEAD^`.

### Usage

Run from anywhere (interactive when conflicts occur):

    sync-repo-simple.sh ~/path/to/repo

Help (minimal):

    sync-repo-simple.sh -h
    sync-repo-simple.sh --help

qtile keybinding idea (run in a terminal because it may prompt):

    alacritty -e sync-repo-simple.sh ~/dev/dotfiles

---

> [!TIP]
> Potential issues/improvements:
> - `REMOTE="$(git remote)"` may return multiple remotes; `git push $REMOTE $LOCAL` will break if more than one exists. Prefer a single remote (e.g. `origin`) or detect the upstream remote via `@{u}`.
> - The stash-pop logic is inverted: `if ! [[ $(git stash list) ]]; then ...` triggers when the stash list is empty. It should likely be `if [[ $(git stash list) ]]; then ...`.
> - `git diff --quiet "$LOCAL" '@{u}'` will error if no upstream is set; consider checking `git rev-parse --abbrev-ref --symbolic-full-name @{u}` first.
> - `handle_merge_pull_conflicts` uses `git reset --hard` for “skip”, which can discard work; consider safer alternatives or clearer wording.