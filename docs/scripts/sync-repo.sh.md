# sync-repo — sync a Git repo (fetch/pull/commit/push) with nice TTY output

---

**sync-repo.sh**: Sync a local git repo with remote, stashing/rebasing and auto-committing changes

---

### Dependencies

- `bash`
- `git`
- `realpath` (typically `coreutils`)
- `sed`, `awk`, `grep`, `wc` (standard GNU userland)
- `bat` (optional) — pretty “command” blocks and framed messages
- `glow` (optional) — renders markdown-like headings/messages nicely in terminal
- `$EDITOR` (optional) — used for conflict resolution (`vim`/`nvim` fallback)

### Description

This script is a “one-shot” repository synchronizer for your Arch Linux workflow: given a repo path, it will:

1. Detect current branch (`LOCAL`) and remote (`REMOTE`) and show a formatted header.
2. `git fetch --all --prune`.
3. If the upstream differs:
   - stashes local changes (if any),
   - tries `git merge --ff-only @{u}` first,
   - falls back to `git pull --rebase $REMOTE $LOCAL`,
   - provides an interactive merge-conflict handler (abort/skip/open editor).
4. Pops the stash and, if conflicts occur, prompts per-file resolution:
   - keep remote (`--theirs`), keep local (`--ours`), or manual edit.
5. If working tree has changes: stages everything, auto-generates a commit message (`N change(s) from user@host`), commits, pushes (retrying after a fast-forward pull if push fails).
6. Runs `git maintenance run` and prints a short log/stat-style summary.

`--dry-run` prints the intended Git commands without modifying the repo.

### Usage

```sh
sync-repo.sh <repository_path> [--dry-run] [--help]
```

Examples (tldr-style):

```sh
sync-repo.sh ~/.scripts
sync-repo.sh "$SCRIPTS"
sync-repo.sh "$SCRIPTS" --dry-run
```

Good fits:
- bind to a qtile key to sync dotfiles/scripts quickly (interactive on conflicts)
- run manually in a terminal when you want “fetch → rebase → commit → push” in one step

---

> [!TIP]
> Improvements to consider:
> - `REMOTE="$(git remote)"` may return multiple remotes; prefer `git remote get-url origin` (or select `origin` by default) and handle missing upstream (`@{u}` can fail).
> - Commit message generation is labeled “llm” but currently static; either remove the comment or integrate the external generator.
> - `git diff --stat '@{1}'` in `display_summary` is fragile; consider capturing `OLD_HEAD=$(git rev-parse HEAD)` before syncing and diff against it afterward.
> - `git commit -m "$MESSAGE"` can break if message contains quotes/newlines; safer: `git commit -m "$MESSAGE"` after sanitizing, or use a temporary file with `-F`.