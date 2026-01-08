# Improved Fzfmenu Launcher (footclient + systemd-run)

---

**improved-fzfmenu.sh**: Launches `fzf` in a floating foot terminal, optionally piping output

---

### Dependencies

- `fzf` — fuzzy finder UI
- `footclient` — terminal client used to display the menu (Wayland-friendly)
- `systemd-run` — used with `--user --scope` to spawn an isolated transient scope
- `bash` — executes the composed `fzf` command string

---

### Description

This script is a small “menu runner” that opens `fzf` inside a dedicated terminal window and returns the selection to the caller. It’s designed for a qtile workflow where you want a predictable floating terminal instance (via `--app-id floating`) and a custom window title (useful for rules, scratchpads, or debugging).

Key behaviors:

- **Argument passthrough to `fzf`**: all arguments are shell-escaped (`printf "%q"`) and appended to `fzf_args`.
- **Special options**:
  - `--pipe`: when enabled, `fzf` writes its selection to the parent’s stdout (so you can chain it in pipelines).
  - `--terminal-title=<title>`: sets the foot window title (`-T`), defaulting to `i_fzfmenu`.
- **Robust stdin/stdout bridging**: `fzf` reads from `/proc/$$/fd/0` and (optionally) writes to `/proc/$$/fd/1`, ensuring that even though `fzf` runs in a new terminal process, it still consumes the original stdin and can emit to the original stdout.

The terminal is started through `systemd-run --user --scope --quiet` which keeps the process tree tidy and avoids lingering services.

---

### Usage

Run interactively, or bind it in qtile to pop up a fuzzy menu.

- Basic:
  - `improved-fzfmenu.sh`
- Pass `fzf` options:
  - `printf "%s\n" a b c | improved-fzfmenu.sh --height 40% --reverse`
- Pipe selection back to caller:
  - `chosen=$(printf "%s\n" a b c | improved-fzfmenu.sh --pipe)`
  - `printf "%s\n" a b c | improved-fzfmenu.sh --pipe | xargs -r notify-send`
- Set terminal title (helps for WM rules):
  - `improved-fzfmenu.sh --terminal-title=power_menu --pipe`

---

> [!TIP]
> The `fzf_args` string-building is generally safe thanks to `%q`, but it’s still more robust to store args in an array and avoid `bash -c` entirely. Also consider making `shell`, geometry (`-W 100x30`), and `--app-id` configurable flags, and add a `--` separator so user `fzf` args can’t conflict with script options (`--pipe`, `--terminal-title=`).