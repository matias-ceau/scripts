# Sync a Git repository (fetch/pull/stash/commit/push)

---

**sync-repo.py**: Sync a git repo with interactive conflict handling and rich output

---

### Dependencies

- `uv` (shebang uses `uv run --script`) to run with inline deps
- `python>=3.13`
- `git`
- `rich` (pretty console output: panels, tables, progress, syntax highlighting)
- `$EDITOR` (optional; used to resolve conflicts, defaults to `vim`/`nvim`)

### Description

This script automates a “safe-ish” sync cycle for a Git repository on your Arch/qtile setup:

- Validates the target path is a Git repo, then discovers:
  - current branch (`git branch --show-current`)
  - remote name (`git remote`)
  - repo name (parsed from `git remote -v`)
- Fetches everything (`git fetch --all --prune`) with a progress display.
- If local is behind upstream (`git diff --quiet <branch> @{u}`):
  - stashes local changes if the working tree is dirty
  - tries a fast-forward merge (`git merge --ff-only @{u}`)
  - if FF fails, falls back to `git pull --rebase <remote> <branch>`
  - if rebase/merge conflicts occur, prompts you to:
    - abort merge
    - skip (hard reset)
    - open `$EDITOR` on conflicted files and then `git add . && git commit`
  - pops the stash and, if conflicts arise, resolves per-file via:
    - remote version (`--theirs`)
    - local version (`--ours`)
    - manual edit in `$EDITOR`
- If there are local changes afterwards, it stages (`git add -A`), commits with an auto message based on `git status -s`, then pushes. If push fails, it attempts a fast-forward pull and retries.

Finally, it prints a summary table (time, current/previous commit dates) and `git diff --stat HEAD^`.

### Usage

- Run on any repo path:
  - `sync-repo.py ~/code/myrepo`
- Typical flow (tldr):
  - `sync-repo.py <repo>`  
  - if prompted during conflicts, type:
    - merge conflicts: `a` (abort) / `s` (skip) / `e` (edit)
    - stash conflicts: `r` (remote) / `l` (local) / `m` (manual)
- Works well as a qtile keybinding launching a terminal:
  - `alacritty -e sync-repo.py ~/code/dotfiles`

---

> [!TIP]
> Improvements to consider:
> - Avoid `shell=True` and piped parsing (`grep|awk|sed`) for repo name; use `git remote get-url` and Python parsing for robustness.
> - `git remote` may return multiple remotes; picking the first silently can be wrong.
> - `git reset --hard` on “skip” is destructive; consider prompting for confirmation or using safer strategies.
> - Conflict resolution commits without a message (`git commit` opens editor) which may block automation; optionally pass a message or guide the user more explicitly.
> - `git stash drop` after conflict handling may drop useful data; consider keeping the stash unless fully applied cleanly.