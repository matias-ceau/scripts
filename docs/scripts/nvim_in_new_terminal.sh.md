# Neovim in a Floating Terminal

---

**nvim_in_new_terminal.sh**: Open a floating Alacritty terminal running Neovim for a given file

---

### Dependencies

- `bash` — script interpreter
- `setsid` (from `util-linux`) — detaches the terminal from the current session
- `alacritty` — terminal emulator used to spawn the editor
- `nvim` — Neovim editor
- `qtile` (implicit) — relies on your WM rules to make the window float via class

### Description

This script launches Neovim inside a new Alacritty window, detached from the current process/session. It’s designed for a qtile workflow where a dedicated window class triggers floating behavior.

Key details:
- `setsid ... &` spawns Alacritty in a new session and backgrounds it. This prevents the terminal from being killed if the parent process (e.g., a launcher, keybinding command, or shell) exits.
- `alacritty -T nvim-term --class 'floating'` sets:
  - a window title (`nvim-term`) to help you identify it,
  - a WM class (`floating`) so qtile can match it and force floating.
- `-e nvim "$1"` executes Neovim with the first argument as the target file path.

### Usage

Run from a terminal:
- `~/.scripts/bin/nvim_in_new_terminal.sh ~/.config/qtile/config.py`
- `~/.scripts/bin/nvim_in_new_terminal.sh /tmp/note.md`

Typical qtile keybinding usage (example):
- bind a key to: `~/.scripts/bin/nvim_in_new_terminal.sh /path/to/file`

Notes:
- Only the first argument is used. If you pass nothing, Neovim will open without a file (interactive).

---

> [!TIP]
> Consider adding argument handling and safety checks:
> - Show usage when `$1` is empty, or open `nvim` without args intentionally.
> - Support multiple files (`"$@"`) instead of only `"$1"`.
> - Add `--working-directory` (Alacritty) or `nvim +"lcd …"` if you want predictable CWD.
> - Ensure your qtile rules match `wm_class == "floating"` for consistent floating behavior.