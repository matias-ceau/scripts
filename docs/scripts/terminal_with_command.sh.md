# Floating terminal runner

---

**terminal_with_command.sh**: Open a floating Alacritty terminal, run a command, then stay open

---

### Dependencies

- `bash` (uses interactive mode `-i` and argument forwarding via `"$@"`)
- `alacritty` (terminal emulator; sets window title/class for your qtile rules)
- `qtile` (optional, but implied: match `WM_CLASS=floating` and/or title `term_w_cmd` to float)

### Description

This script spawns an Alacritty window configured for easy window-manager targeting:

- `-T term_w_cmd` sets the window title to `term_w_cmd`
- `--class 'floating'` sets the `WM_CLASS` to `floating` (handy for qtile rules)
- `-e bash -i -c '…' _ "$@"` runs a small Bash snippet:
  - executes the passed command (via `"$@"` so arguments are preserved)
  - then runs `exec "$SHELL"` to keep the terminal open after the command finishes (useful to read output, logs, errors)

Because Bash is started as interactive (`-i`), your shell startup files may run, which can be useful (aliases/functions) but may also add latency.

### Usage

Run from a terminal, a launcher, or bind it in qtile to open a temporary floating “output” terminal:

- Run a simple command:
  - `terminal_with_command.sh pacman -Qi qtile`
- Run something long-lived:
  - `terminal_with_command.sh journalctl -f -u NetworkManager`
- Run a shell pipeline (wrap it in `bash -lc`):
  - `terminal_with_command.sh bash -lc 'ps aux | rg qtile | less'`

Suggested qtile matching (conceptually): float windows with title `term_w_cmd` or `wm_class == "floating"`.

---

> [!TIP]
> Consider adding basic safety/UX improvements: check for missing args (print usage), verify `alacritty` exists, and optionally background/detach (`setsid … &`) so it doesn’t block the caller. Also note that `bash -i` can trigger interactive prompts/slow startup; if you don’t need interactive behavior, drop `-i` or switch to `bash -lc` for predictable non-interactive execution with login-like env.