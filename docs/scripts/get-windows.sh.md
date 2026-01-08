# Qtile Window Lister (tab-separated)

---

**get-windows.sh**: Print Qtile windows as TSV (id, group, name, wm_class)

---

### Dependencies

- `bash`
- `qtile` (and a running Qtile session): uses `qtile cmd-obj -o root -f windows`
- `uv` (Astral): runs an inline Python snippet via `uv run -`
- `python` (provided/managed by `uv`)

### Description

This script queries your current Qtile instance for the list of managed windows and prints a tab-separated table containing a small, useful subset of fields:

- `id`: Qtile’s internal window id
- `group`: the group (workspace) the window belongs to
- `name`: window title
- `wm_class`: X11/Wayland class information (useful for rules/matching)

Internally it calls `qtile cmd-obj -o root -f windows`, which returns a list of dictionaries describing each client. An inline Python snippet filters each window dict to only the keys in `keylist`, casts values to strings, and prints one window per line joined by `\t`. The output is designed to be easily piped into CLI tools like `fzf`, `column`, `rg`, or consumed by other scripts.

### Usage

Run from a terminal inside your Qtile session:

```sh
~/.scripts/dev/get-windows.sh
```

Pretty-print as columns:

```sh
~/.scripts/dev/get-windows.sh | column -ts $'\t'
```

Filter by class/title:

```sh
~/.scripts/dev/get-windows.sh | rg -i "firefox|thunar"
```

Select a window with `fzf` (example pipeline):

```sh
~/.scripts/dev/get-windows.sh | column -ts $'\t' | fzf
```

---

> [!TIP]
> Improvements to consider:
> - Add a header row (e.g., `id\tgroup\tname\twm_class`) to make the TSV self-describing.
> - Handle missing keys safely (some window dicts may lack `wm_class` or `name`), otherwise `'\t'.join(l)` can misalign columns.
> - Avoid shell interpolation hazards: `win = $(...)` injects raw output into Python; prefer reading JSON (`qtile cmd-obj ... -f windows` supports JSON in some contexts) or capture via `subprocess.check_output(...)`.
> - Consider making `keylist` configurable via CLI args so you can reuse the script for different debugging needs.