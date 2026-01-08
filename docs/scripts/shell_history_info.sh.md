# Shell history frequency inspector

---

**shell_history_info.sh**: Show most frequent lines/words/chars/options in your shell history

---

### Dependencies

- `bash`
- `rg` (ripgrep) — used for filtering empty lines and matching options (`^-`)
- `sed` — cleanup, zsh history prefix stripping, character splitting
- `sort`, `uniq`, `tr`, `cat` — coreutils for counting and normalization
- `bat` — pretty-prints the built-in help snippet when arguments are wrong (optional but recommended)
- `$XDG_STATE_HOME/zsh/history`, `$XDG_STATE_HOME/bash/history` — expected history locations on your system

### Description

This script aggregates your Zsh and Bash history files (in `$XDG_STATE_HOME`) and produces frequency tables for different “units”:

- **Lines**: full commands as entered (after stripping zsh’s `: <epoch>:<duration>;` prefix).
- **Words**: splits commands on spaces and counts token frequency.
- **Characters**: removes all whitespace, then counts per-character frequency.
- **Options**: counts tokens that look like CLI flags (words starting with `-`).

Internally, it follows a consistent pipeline:

1. `get_history`: concatenates both history files and normalizes zsh history lines.
2. Tokenization (optional): split to words or characters.
3. `clean_up`: trims leading/trailing spaces and removes empty lines.
4. `sort_by_occurence`: counts occurrences, sorts numerically, formats as `COUNT<TAB>ITEM`, and hides low-frequency entries (≤5).

### Usage

Run from a terminal (or bind in qtile to spawn a terminal with the command):

- Most frequent full commands:
  - `shell_history_info.sh --lines`
- Most frequent words:
  - `shell_history_info.sh --words`
- Most frequent characters:
  - `shell_history_info.sh --character`
- Most frequent options/flags:
  - `shell_history_info.sh --option`

tldr:
- `shell_history_info.sh -l | tail`
- `shell_history_info.sh -w | tail -n 50`
- `shell_history_info.sh -o | tail`

---

> [!TIP]
> Consider making the cutoff configurable (currently hard-coded to hide counts ≤5, despite the comment saying “>10”). Also, word-splitting on spaces misses quoted strings and multiple whitespace; a more robust tokenizer (or `awk`/shell parsing) could improve accuracy. Finally, guard against `$XDG_STATE_HOME` being unset and optionally fall back to `~/.bash_history` / `~/.zsh_history`.