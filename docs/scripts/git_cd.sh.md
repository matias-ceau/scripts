# Git repo directory picker (via locate + fzf)

---

**git_cd.sh**: Fuzzy-pick a git repo directory from `locate` and print its path

---

### Dependencies

- `bash`
- `locate` (from `mlocate`/`plocate`) — provides the `.git` database search
- `sed` — strips `.git` and swaps `/home/matias` ↔ `~`
- `eza` — pretty one-line directory listing (icons/colors)
- `fzf` — interactive fuzzy finder (uses `--ansi`)
- `awk` — extracts the selected path from `eza` output

### Description

This script builds a list of Git repositories by searching your `locate` database for paths ending in `.git`. It then:

1. Removes the trailing `/.git` to get the repo root directory.
2. Formats the directories with `eza` (colored, icons, one entry per line).
3. Replaces `/home/matias` with `~` for readability in the picker.
4. Pipes the list into `fzf` so you can fuzzy-search and select a repo.
5. Extracts the directory field and converts `~` back to `/home/matias`.

If a selection is made, it prints the resolved destination path. Note: although it calls `cd`, directory changes won’t persist unless the script is sourced or wrapped in a shell function/alias.

### Usage

Run interactively (opens `fzf` UI):

    ~/.scripts/bin/git_cd.sh

Typical “tldr” patterns:

- Print the chosen repo (for other commands):

      repo="$(~/.scripts/bin/git_cd.sh)"
      [ -n "$repo" ] && nvim "$repo"

- Make it actually change your current shell directory (recommended):

      gcd() { cd "$(~/.scripts/bin/git_cd.sh)" || return; }

- Then use:

      gcd

---

> [!TIP]
> `cd` inside a standalone script won’t affect your current terminal; use a shell function (or `source` the script) to make it behave like “jump to repo”. Also, parsing `eza` with `awk '{print $2}'` is fragile (spacing/format changes); consider feeding raw paths to `fzf` (and optionally using `--preview 'eza -la --color=always {}'`). Finally, `locate` results depend on an updated database—ensure your locate DB is regularly refreshed.