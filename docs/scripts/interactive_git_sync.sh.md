# Interactive Git Sync Picker

---

**interactive_git_sync.sh**: Pick a repo via fzf and run your sync-repo.sh on it

---

### Dependencies

- `bash`
- `fzf` — interactive fuzzy finder used to select the repo to sync
- `awk` — builds the per-repo command list
- `$SCRIPTS/sync-repo.sh` — the actual sync logic (this script is just a picker/dispatcher)
- Environment variables providing repo paths: `$CHEZMOI`, `$SCRIPTS`, `$LOCALDATA`, `$PSYRIS`, `$GIT_REPOS`

### Description

This script is a small interactive launcher to “sync” one of several Git repositories on demand. It defines a list of candidate repositories in `opts` (one path per line), then constructs a corresponding list of commands of the form:

- `$SCRIPTS/sync-repo.sh <repo_path>`
- optionally with `--dry-run`

It feeds that command list into `fzf`, letting you fuzzy-search and pick the one you want. With `--select-1`, if there is only a single match, it will be selected automatically. The initial query is taken from the first argument (useful for quickly filtering).

Finally, if a selection was made, it executes the chosen command via `eval`.

This pairs well with an Arch + qtile workflow: bind it to a key to quickly sync whichever repo you’re currently working on, without remembering paths.

### Usage

Run interactively (terminal required because of `fzf`):

    interactive_git_sync.sh

Start with an initial filter query:

    interactive_git_sync.sh chezmoi
    interactive_git_sync.sh ondansetron

Dry-run (passes through to `sync-repo.sh`):

    interactive_git_sync.sh --dry-run
    interactive_git_sync.sh --dry-run scripts

Suggested qtile keybinding (example idea):

- spawn: `~/.scripts/bin/interactive_git_sync.sh`

---

> [!TIP]
> Consider avoiding `eval` here: since you already control the command structure, you can store repo paths and call `"$SCRIPTS/sync-repo.sh" "$repo"` directly (safer with spaces/special chars). Also, `awk "{print \"$cmd\",\$1}"` splits on whitespace, so any path containing spaces would break; using a line-based read loop would be more robust. Finally, the `--height=~100%` syntax may not be portable across all `fzf` versions—`--height=100%` is the common form.