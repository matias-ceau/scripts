# Keyboard layout helper (floating viewer)

---

**keyboard-help.sh**: Open a floating xterm showing your current keyboard layout

---

### Dependencies

- `bash`
- `show_keyboard_layout.py` (must be in `PATH`) — prints the keyboard layout text that will be displayed  
- `xterm` — terminal window used for the floating viewer
- `bat` — pager/highlighter used here as a plain pager (`--style=plain`)
- `setsid` — detaches the process from the current session (usually provided by `util-linux`)
- `which` — locates `show_keyboard_layout.py` (usually provided by `which`)

### Description

This script is a quick “what’s my keyboard mapping right now?” helper designed for a WM workflow (nice for qtile keybindings). It locates `show_keyboard_layout.py` via `which`, then spawns an `xterm` window detached from the current shell using `setsid`.

The `xterm` is configured with:

- title: `KB_layout_floating` (useful for qtile rules, e.g. float-by-title)
- font size: `-fs 20` for readability
- command: runs the Python layout script and pipes its output into `bat` with paging enabled:
  - `bat --paging=always --style=plain`

The whole thing is backgrounded (`&`), so triggering it from a keybinding won’t block qtile or your current terminal.

### Usage

Run directly:

    keyboard-help.sh

Typical qtile keybinding idea:

    # in qtile config
    Key([mod], "F1", lazy.spawn("keyboard-help.sh"))

If you want it to float automatically, match on the xterm title `KB_layout_floating` in your qtile floating rules.

---

> [!TIP]
> Consider handling missing dependencies more gracefully. If `show_keyboard_layout.py` isn’t found, `which` returns an empty string and `bash -c ""` will run and `bat` will sit waiting. You could add a guard like `command -v show_keyboard_layout.py >/dev/null || exit 1`. Also, if your goal is purely paging, `less -R` (or `batcat` naming differences on some systems) may be simpler. Finally, `setsid` + `&` is slightly redundant; you could keep one depending on whether you need full detachment from the controlling terminal.