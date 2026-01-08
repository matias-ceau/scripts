# FZF Script Launcher (docs + source preview)

---

**script_launcher.sh**: Interactive launcher for `$SCRIPTS` entries with fzf + previews

---

### Dependencies

- `bash`
- `fzf` or `improved-fzfmenu.sh` (your wrapper with terminal title support)
- `bat` (preview rendering for source and markdown docs)
- `fd` (lists scripts under `$SCRIPTS`)
- `ripgrep` (`rg`, used to detect file extensions)
- `pastel` (hex → 24-bit ANSI colors)
- `nvim` (editing action)
- `$SCRIPTS/lib/env.sh` + `load_env "colors"` (provides `FLEXOKI_*` colors and env)
- `terminal_with_command.sh` (open a terminal running the chosen script)
- `nvim_in_new_terminal.sh` (edit in a new terminal)

### Description

This script is a qtile-friendly “command palette” for your personal scripts directory (`$SCRIPTS`). It enumerates executables via `fd -tx` and formats each entry with a colored icon depending on extension (`.sh`, `.py`, `.xsh`, fallback).

It then pipes the list into fzf (either plain `fzf` when `--embedded/-E` is used, or your `improved-fzfmenu.sh` wrapper otherwise). Two previews are available:

- **Source preview** (default): `bat $(which {2})` with full styling.
- **Docs preview**: `bat -lmd $SCRIPTS/docs/scripts/{2}.md` to show per-script documentation.

Keybindings are set up to run/edit scripts directly, plus toggle preview type and refresh on resize. Colors are derived from your Flexoki palette env vars and converted with `pastel`.

### Usage

Run normally (uses `improved-fzfmenu.sh`):
- `script_launcher.sh`

Run “embedded” (use raw fzf, useful inside an existing terminal):
- `script_launcher.sh --embedded`
- `script_launcher.sh -E`

Inside the UI:
- `Enter`: execute selected script (`bash -c {2}`)
- `Alt+Enter`: run in a new terminal (`terminal_with_command.sh`)
- `Ctrl+e`: edit in-place (`nvim $(which {2})`)
- `Alt+e`: edit in a new terminal (`nvim_in_new_terminal.sh`)
- `Alt+d`: preview docs (`$SCRIPTS/docs/scripts/<name>.md`)
- `Alt+s`: preview source
- Resize window: preview auto-refreshes

---

> [!TIP]
> `--nth=2` assumes fzf fields split cleanly; because the first “field” contains icons/colors, it works, but it’s fragile if filenames contain spaces. Consider outputting a delimiter (e.g., `printf "%s\t%s\n" icon name`) and using `--delimiter='\t' --with-nth=2`. Also, `bash -c {2}` and `$(which {2})` can misbehave with unusual names; using absolute paths from `fd --absolute-path` directly would be more robust.