# Read the manual history leaderboard

---

**read_the_fucking_manual.sh**: Show your most searched man/batman pages from shell history

---

### Dependencies

- `bash`
- `bat` (used to render the help text via `bat -plhelp`)
- `ripgrep` (`rg`, used to filter history lines and optionally search results)
- `sed`, `awk`, `cut`, `sort`, `uniq`, `head` (coreutils / text utilities)
- `$XDG_STATE_HOME` with:
  - `$XDG_STATE_HOME/zsh/history`
  - `$XDG_STATE_HOME/bash/history`

### Description

This script mines your Zsh and Bash history files and builds a ranked list of manual pages you’ve looked up the most via `man` or `batman`.

Pipeline overview (inside `get_searches()`):

1. Concatenates both history files.
2. Strips Zsh extended-history prefixes (`: <time>:<duration>;`) so commands look normal.
3. Keeps only lines starting with `man ` or `batman `.
4. Removes the command prefix and drops option-only invocations (lines where the page name starts with `-`).
5. Extracts the first argument (the page name), counts occurrences, sorts by frequency, and prints:  
   `pagename count`

The `case` statement then offers common views (top 10 by default, top N, above a threshold, full list) or lets you pass any `rg` query to search the ranked output.

### Usage

```sh
# Default: top 10 manual pages you searched
read_the_fucking_manual.sh

# Help
read_the_fucking_manual.sh -h
read_the_fucking_manual.sh --help

# Top N
read_the_fucking_manual.sh -n 25
read_the_fucking_manual.sh --number 25

# Only pages searched more than N times
read_the_fucking_manual.sh -m 3
read_the_fucking_manual.sh --more-than 3

# Show all ranked entries
read_the_fucking_manual.sh -a
read_the_fucking_manual.sh --all

# Search within the ranked list using ripgrep arguments
read_the_fucking_manual.sh '^systemd'
read_the_fucking_manual.sh -i 'pacman|paru'
```

---

> [!TIP]
> Consider quoting numeric args and providing defaults for `-m` when `$2` is empty (your help says default 1, but the code doesn’t enforce it). Also guard against unset `$XDG_STATE_HOME` or missing history files to avoid noisy errors. Finally, `-n` should validate `$2` (empty/non-numeric) and `get_searches` could be sped up slightly by using a single `awk` script instead of multiple processes.