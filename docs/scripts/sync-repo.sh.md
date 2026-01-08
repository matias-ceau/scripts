# Sync Git Repository (fetch/pull/commit/push)

---

**sync-repo.sh**: Sync a git repo: fetch, rebase/ff, stash, auto-commit, push, pretty output

---

### Dependencies

- `git` — core operations (fetch/merge/rebase/stash/commit/push/maintenance)
- `bash` — script runtime (`#!/usr/bin/bash`)
- `realpath` — resolve repository path (from `coreutils`)
- `sed`, `awk`, `grep`, `wc` — small parsing helpers
- `bat` *(optional)* — nicer command/message rendering
- `glow` *(optional)* — renders markdown-like headings/messages in terminal
- `$EDITOR` *(optional)* — used for conflict resolution (`vim`/`nvim` fallback)

### Description

`sync-repo.sh` is an “opinionated” Git synchronizer for a single repository path. It:

1. Validates the target directory is a Git repo and records current directory.
2. Detects `REMOTE` (via `git remote`) and `LOCAL` (current branch).
3. `git fetch --all --prune`.
4. If upstream differs:
   - stashes local modifications (if any),
   - attempts a fast-forward merge (`git merge --ff-only @{u}`),
   - otherwise tries `git pull --rebase <remote> <local>` and offers an interactive conflict handler.
   - re-applies stash (`git stash pop`) and offers per-file conflict handling (`ours/theirs/manual`).
5. If working tree has changes, it stages everything, commits with an auto-generated message (`N change(s) from user@host`), then pushes; on push failure it pulls fast-forward and retries.
6. Runs `git maintenance run` and prints a short summary/log view.

Output is enhanced when `bat`/`glow` are installed, making it comfortable to run in a terminal or a qtile keybinding that spawns a terminal.

### Usage

```sh
sync-repo.sh <repository_path> [--dry-run] [--help]
```

Examples (tldr-style):

```sh
sync-repo.sh ~/.scripts
sync-repo.sh "$SCRIPTS"
sync-repo.sh ~/.scripts --dry-run
sync-repo.sh --help
```

- `--dry-run`: prints the Git commands that would run, without modifying the repo.
- Interactive steps occur only on conflicts (merge/rebase or stash pop).

---

> [!TIP]
> Potential improvements:
> - `REMOTE="$(git remote)"` may return multiple remotes; pushing to multiple words can break (`git push origin upstream main`). Prefer `git remote get-url origin` and default to `origin`.
> - `git diff --quiet "$LOCAL" '@{u}'` assumes an upstream is set; add a guard (`git rev-parse --abbrev-ref --symbolic-full-name @{u}`) with a clearer error.
> - `eval` in `run_command` is unnecessary and can be risky; prefer executing arrays or direct commands.
> - Commit message generator comment mentions an LLM, but implementation is static; either wire it in or adjust the comment.