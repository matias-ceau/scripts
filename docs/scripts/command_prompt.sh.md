# Command Prompt: FZF History Launcher

---

**command_prompt.sh**: Interactive shell history picker via fzf wrapper

---

### Dependencies

- `bash` — script interpreter
- `shell_history_info.sh` — user script; outputs history in TSV; `-l` lists entries
- `improved-fzfmenu.sh` — user script; wrapper around `fzf` with sane defaults
- `fzf` — interactive fuzzy finder (used by the wrapper)
- `cut` — from coreutils, extracts the command field

### Description

This script provides a minimal, fast command launcher backed by your shell history. It:

1) Calls `shell_history_info.sh -l` to fetch history in a table-like (TSV) format.
2) Pipes that to `cut -f2` to keep only the command text (second column).
3) Sends the list to `improved-fzfmenu.sh` with:
   - `--terminal-title=cmd_prompt` to name the terminal window,
   - `--tac` to show most recent commands first,
   - `--ansi` to preserve colored entries (if any).

The chosen command is printed to stdout. The script itself does not execute the command; this is intentional for safety and flexibility (you decide whether to run, edit, or copy it).

### Usage

TL;DR examples:

- Pick a command and print it
  ```
  command_prompt.sh
  ```

- Pick and execute (bash login shell). Empty selection does nothing.
  ```
  cmd="$(command_prompt.sh)" && [ -n "$cmd" ] && bash -lc "$cmd"
  ```

- Pick and copy to clipboard (X11)
  ```
  command_prompt.sh | xclip -selection clipboard
  ```

- Run, then open the selected command in $EDITOR for tweaks
  ```
  cmd="$(command_prompt.sh)" && [ -n "$cmd" ] && ${EDITOR:-nvim} -c "startinsert" -c "normal Go$cmd"
  ```

- Qtile keybinding: pick and execute
  ```
  # in config.py
  from libqtile.config import Key
  from libqtile.lazy import lazy

  keys += [
      Key(["mod4"], "p",
          lazy.spawn("sh -lc 'cmd=\"$(command_prompt.sh)\"; [ -n \"$cmd\" ] && bash -lc \"$cmd\"'"),
          desc="Run command from history picker"),
  ]
  ```

---

> [!TIP]
> - The script currently lacks error handling; consider `set -euo pipefail` and guarding missing dependencies.
> - It does not execute the selection; optionally add a `-x/--exec` flag to run automatically.
> - Assuming tab-delimited input, `cut -f2` is fine; if the format changes, make the delimiter explicit.
> - Consider a preview (e.g., frequency, last run time) via `fzf --preview`.
> - Multi-line commands may not be represented well; you could join or preview full entries before selection.