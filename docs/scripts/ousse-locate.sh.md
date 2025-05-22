# ousse-locate: a database/search helper for Ousse data

---

**ousse-locate.sh**: Experimental script for managing and searching local `.db` databases with preview support.

---

### Dependencies

- `eza`: Modern replacement for `ls`, used for directory listing and info.
- `awk`: Text processing.
- `du`: Disk usage estimator.
- `cut`, `tr`, `sed`, `echo`, `date`: Standard Unix text and file manipulation utilities.
- `fzf` *(optional, WIP)*: Fuzzy finder for interactive selection.
- `bat` *(optional, WIP)*: Cat clone with syntax highlighting for previews.
- `plocate` *(optional, commented)*: Fast file locator, used for searching patterns in database files.
- `rg` *(optional, commented)*: ripgrep, for regex-driven file search.

---

### Description

`ousse-locate.sh` is a user-space helper script for inspecting and searching local databases located at `.local/share/ousse/`. It's designed to assist in visualizing, assessing, and searching `.db` files collected within that folder. The script currently demonstrates several commands (some commented as TODOs for future integration):

- Computes total bytes used by all `.db` files in `.local/share/ousse`.
- Produces a detailed listing with sizes, modification times, and absolute paths via `eza`.
- Performs some numerical calculations (relative widths, time differences), potentially for TUI displays.
- Provides an example block for constructing a pipeline with `dust` (space analyzer), `sed`, `bat` (highlighted preview), and `fzf` (fuzzy selection).
- Includes a detailed snippet of supported `plocate` search options and a sample chain to preview matches or open found files in `nvim` via `fzf`.

The script is experimental and full interactive capability or fuzzy selection is not yet fully implemented—it mainly demonstrates various info gathering via `awk`, `eza`, and shell arithmetic. The TODOs note intentions for further development, particularly age-aware database checks and more direct fuzzy selection/search integration.

---

### Usage

For now, invoke the script directly to display information on your `.db` files:

```
~/.scripts/dev/ousse-locate.sh
```

This prints:

- The total size in bytes of `.local/share/ousse`.
- A line with column-wise proportional info (potential TUI progress bar).
- A line with time-deltas between now and each file's modification time.
- A re-listing of files for further inspection.

**Note:** There is no direct argument parsing at this stage; most interactivity or filtering is left as future development per the TODO section. If you want basic interactive search, refer to the commented `fzf`/`plocate`/`rg` blocks as starting points:

```sh
plocate -d .local/share/ousse/mydb.db 'PATTERN'
# or try ripgrep/fzf manually:
rg --color=always "pattern" | fzf --ansi --preview 'bat --color=always {1} --highlight-line {2}'
```

---

> [!TIP]
>
> This script is still very much a prototype, more a "notebook" than a finished utility:
> - It presently does not process arguments or perform actual database searching—it only outputs info about `.db` files.
> - Several features are commented (e.g., `fzf`, `bat`, `plocate` usage) but not connected.
> - Output is difficult to interpret without further formatting; it also assumes existence of `.local/share/ousse` and compatible environment.
> - Consider modularizing feature blocks into functions as the script grows, and adding proper CLI argument handling.
> - You may want to add error handling for missing directories/deps, and use absolute paths for robustness. 
> - Great starting point for a richer fuzzy-locate explorer tailored for your data!