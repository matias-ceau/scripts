# Vox amp options browser (CLI)

---

**vox.py**: Print and filter a Vox amp-model option table from the terminal

---

### Dependencies

- `python`
- `python-pandas` (Arch package: `python-pandas`) — data handling via `DataFrame`
- `python-tabulate` (Arch package: `python-tabulate`) — pretty-print tables in terminal

### Description

`vox.py` is a small CLI helper that contains a hardcoded catalog of amp models (name/mode/color/optional “real” amp name/description). It’s meant for quick lookup while dialing tones, without having to open manuals.

The script builds a `pandas.DataFrame` with these columns:

- `name`: family name (e.g. `VOX AC30`, `UK METAL`)
- `mode`: `STD` / `SPL` / `CST`
- `color`: shorthand filter (`g`, `o`, `r`)
- `amp_name`: optional real-world reference (often empty)
- `description`: full text; truncated to 40 chars in list views

Behavior depends on the first argument:

- no args: prints the full table (descriptions truncated)
- numeric arg: prints a detailed view for that row index, including full description
- `g|o|r`: filters by `color` and prints the table
- anything else: substring search against `name` (case-insensitive by uppercasing the query)

This is ideal as a quick terminal tool, and can be bound to a qtile key to pop a terminal with results.

### Usage

List everything (compact):

    vox.py

Show one entry by index (full details):

    vox.py 15

Filter by “color”:

    vox.py g
    vox.py o
    vox.py r

Search by name substring:

    vox.py vox
    vox.py metal
    vox.py ac30

Example qtile idea (spawn in your preferred terminal):

    lazy.spawn("alacritty -e /home/matias/.scripts/bin/vox.py")

---

> [!TIP]
> `df['description']` is truncated in-place for list views; if you call multiple modes in the same process (e.g., later refactor to an interactive TUI), you’ll lose the full text. Prefer using a temporary column (e.g. `desc_short`) or `assign()` for printing. Also consider `args[0].isdigit()` vs `isnumeric()` edge cases, and add a `--help`/`argparse` interface for discoverability (plus column headers via `tabulate(..., headers="keys", showindex=True)`).