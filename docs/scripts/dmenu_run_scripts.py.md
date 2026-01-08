# Rofi script launcher (via `script_identifier.xsh`)

---

**dmenu_run_scripts.py**: Rofi-based launcher for your “active” scripts using xonsh metadata

---

### Dependencies

- `python` (runs the script)
- `xonsh` (used to query script metadata)
- `script_identifier.xsh` (your script registry/indexer; must be in `$PWD` or resolvable)
- `rofi` (dmenu UI; uses `-markup-rows`)
- A working `$PATH` entry for the selected scripts (the chosen “FILE” is executed directly)

### Description

This script is a lightweight “`dmenu_run` for your own scripts”. It delegates discovery to `script_identifier.xsh`, asking it for entries matching:

- `TYPE=RUN`
- `STATUS=active`
- plus the extra tokens `HOST` and `OK` (passed as positional args)

The result is formatted as Pango markup for `rofi`:

- left column: green, padded `{FILE:<30}`
- separator: `⟶`
- right column: `{DESCR}`

`rofi -dmenu` then displays the list (case-insensitive, 30 lines, width 80). After selection, the script extracts the filename by splitting around the first `>` and next `<`, then executes it via `subprocess.run([choice])`.

This fits well in an Arch + qtile workflow as a keybound “command palette” for your personal scripts.

### Usage

Run from a terminal, or bind it in qtile.

tldr:

- Launch the menu:
  - `dmenu_run_scripts.py`
- In qtile (example):
  - `Key([mod], "p", lazy.spawn("~/.scripts/bin/dmenu_run_scripts.py"))`

Notes:

- Ensure `script_identifier.xsh` is found (either run from its directory, or adjust to an absolute path).
- The selected script must be executable and discoverable (absolute path returned, or in `$PATH`).

---

> [!TIP]
> The parsing `rofi_output.split(">")[1].split("<")[0]` is brittle: if markup changes or the user cancels (empty output), it will crash. Consider emitting machine-readable output (no markup) and using `rofi -format` or separating displayed text from the executed value. Also consider running with `check=True`, handling non-zero exit codes, and executing via `subprocess.run(choice.split())` only if you intentionally want word-splitting—otherwise prefer returning absolute paths and keeping `subprocess.run([choice])`.