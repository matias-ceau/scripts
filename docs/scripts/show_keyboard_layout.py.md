# Show Keyboard Layout (ASCII cheat sheet)

---

**show_keyboard_layout.py**: Print a preformatted keyboard layout map to stdout

---

### Dependencies

- `python` (Python 3 interpreter; Arch: `python` package)

### Description

This is a tiny helper script that prints an ASCII-art representation of your current (or intended) keyboard layout directly to standard output. The layout is embedded as a raw triple-quoted string (`r""" ... """`), which preserves backslashes and minimizes escaping issues—useful for keyboard diagrams that include characters like `\|`, quotes, and various diacritics.

The diagram appears to correspond to a customized layout (likely a variant with extended symbols/diacritics and an `AltGr` layer). Because the content is hardcoded, the script is deterministic: it does not query `setxkbmap`, `localectl`, Wayland/X11 state, or Qtile. That makes it ideal as a quick “cheat sheet” you can display anywhere (terminal, scratchpad, keybinding action, etc.) without worrying about system dependencies.

Typical uses in your Arch + Qtile workflow:
- Quickly recall uncommon symbols (e.g., currency signs, diacritics, special punctuation)
- Keep a layout reference in a terminal popup/scratchpad
- Pipe it into other tools (`less`, `rofi`, notifications) for more convenient viewing

### Usage

Run interactively in a terminal:

    show_keyboard_layout.py

Or explicitly with Python:

    python /home/matias/.scripts/bin/show_keyboard_layout.py

Handy pager view:

    show_keyboard_layout.py | less -R

Qtile keybinding idea (spawn a terminal showing it):

    lazy.spawn("alacritty -e show_keyboard_layout.py")

---

> [!TIP]
> - Consider adding a proper shebang for Python 3 (`#!/usr/bin/env python3`) to avoid ambiguity if `/usr/bin/python` is missing or points to an unexpected version.
> - If you want the script to reflect the *current* active layout, you could optionally integrate `setxkbmap -query` (X11) or `localectl status` and print the detected layout name alongside the diagram.
> - For better integration with your desktop, you could add flags like `--pager` or `--notify` and route output to `less`, `zenity`, or a notification daemon.