# Fuzzy `cd` to Git repositories

---

**git_cd.sh**: Pick a local git repo via fzf and output a `cd …` command

---

### Dependencies

- `bash`
- `locate` (from `mlocate`/`plocate`) — searches for `.git` directories via the locate database  
- `sed`, `awk` — string filtering/parsing
- `eza` — pretty listing of candidate directories (with icons/colors)
- `fzf` — interactive fuzzy picker (ANSI-enabled)

### Description

This script builds a list of Git repositories on your machine by querying the `locate` database for paths ending in `.git`. It then:

1. Strips the trailing `/.git` to get the repository root directory.
2. Feeds the list into `eza` to display a colorful, icon-enhanced, one-line directory view.
3. Replaces `/home/matias` with `~` for a cleaner picker UI.
4. Uses `fzf --ansi` so the `eza` color codes are preserved while searching.
5. Extracts the selected path and prints a `cd <path>` command (expanding `~` back to `/home/matias`).

Important: it *prints* the `cd` command; it does not change the directory of your current shell by itself (a child process can’t `cd` its parent).

### Usage

Run interactively in a terminal:

    ~/.scripts/bin/git_cd.sh

To actually change directory, evaluate the output in your current shell:

    cd "$(~/.scripts/bin/git_cd.sh | sed 's/^cd //')"

Or define a shell function/alias (recommended):

    gcd() { eval "$(~/.scripts/bin/git_cd.sh)"; }

Then:

    gcd

You can also bind `gcd` to a qtile keybinding that opens a terminal and runs it, but note the `cd` will only affect that terminal session.

---

> [!TIP]
> **Potential improvements:** relying on `awk '{print $2}'` assumes a stable `eza` output format; it may break with spaces in paths or different `eza` layouts. Consider avoiding `eza` for the actual value pipeline (use it only for preview) and pass raw paths to `fzf` (or use `fzf --preview 'eza -la --color=always {}'`). Also, `locate` requires an updated database; you may want to document/automate `updatedb` (or switch to `fd`/`rg` for real-time search).