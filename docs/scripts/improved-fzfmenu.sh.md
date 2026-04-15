# Improved floating fzf menu launcher

---

**improved-fzfmenu.sh**: Launch `fzf` in a floating terminal, optionally preserving pipes

---

### Dependencies

- `bash`
- `fzf` — the interactive selector
- `systemd-run` — used to spawn a user scope so the terminal is detached/managed cleanly
- One of:
  - `footclient` (preferred, requires foot server) / `foot`
  - `alacritty`
  - `kitty`

### Description

This script is a wrapper around `fzf` designed for a qtile “floating menu” workflow. It launches `fzf` inside a terminal window with a consistent WM class (`floating`) and a configurable terminal title (default: `i_fzfmenu`).

A key feature is preserving stdin/stdout behavior even though `fzf` is executed in a new terminal process. It achieves this by explicitly wiring input/output through the current process’ file descriptors:

- Input is always taken from the caller via `< /proc/$$/fd/0`
- If `--pipe` is provided, output is forwarded back to the caller via `> /proc/$$/fd/1`

Arguments are parsed as:
- `--pipe` toggles output piping
- `--terminal-title=...` sets the terminal title
- everything else is appended (safely quoted) to `fzf` arguments

Terminal preference order: `footclient` → `foot` → `alacritty` → `kitty`. All are launched under `systemd-run --user --scope --quiet` to keep them isolated from the parent process/session.

### Usage

Basic interactive menu (no piping):
- `improved-fzfmenu.sh`

Pipe in, select, print selection to your terminal:
- `printf "%s\n" a b c | improved-fzfmenu.sh --pipe`

Pass extra `fzf` options:
- `printf "%s\n" * | improved-fzfmenu.sh --pipe --height 40% --reverse`

Set a custom window title (helpful for qtile rules):
- `printf "%s\n" a b | improved-fzfmenu.sh --pipe --terminal-title=Apps`

Qtile keybinding idea: call it from a prompt/menu script and let the selection continue in the original pipeline.

---

> [!TIP]
> Consider adding an explicit `--terminal=` option (and/or `--class=`) instead of a fixed preference chain; qtile rules often rely on stable classes. Also, `footclient --server-socket` is a bit unusual as a “server running” check; a more robust probe (or a timeout) could avoid false negatives. Finally, `fzf_args` as a string is workable, but an array would be safer and simpler than manual quoting/concatenation.