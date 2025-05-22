# QuickPass: Interactive Password Selection & Autofill

---

**quick-pass.sh**: Fuzzy-find and copy your pass(1) passwords using `fzf` with one-click paste/edit support.

---

### Dependencies

- `fd`: Fast, user-friendly alternative to `find` (used here for searching GPG files).
- `fzf`: Command-line fuzzy finder for interactive selection.
- `pass`: Standard Unix password manager (`pass(1)`).
- `xdotool`: Simulates keyboard input (used for autofill via `ctrl-x`).
- `sort`, `sed`, `xargs`: Standard Unix core utilities.
- _Arch Linux packages: `fd`, `fzf`, `pass`, `xdotool`_

_Note_: `PASSWORD_STORE_DIR` environment variable should be set (defaults to `~/.password-store` for `pass`). 

---

### Description

This script provides a terminal-based interactive interface to your `pass` password store:

- **File Discovery:** Uses `fd` to quickly locate all `.gpg` files in your password-store directory.  
- **Pretty Formatting:** Formats output with `fd` using nerd font icons and color codes for better readability in the selector.  
- **Fuzzy Search:** Pipelined to `fzf`, allowing for fuzzy interactive selection of entries.
- **Actions:**
  - `CTRL-E`: Edit the selected entry with `pass edit`.
  - `CTRL-X`: Typing the password into the active window via `xdotool type`.
  - `Enter`: Copies the selected password to your clipboard with `pass` (as per normal `pass` behavior).

The selected entry is always extracted cleanly (stripping paths/extensions) and fed to `pass`.

---

### Usage

You can run the script from your terminal or bind it to a key in Qtile for faster access:

#### TL;DR

```sh
quick-pass.sh
```

#### Example Integration (Qtile keybinding)

```python
# In your Qtile config.py
Key([mod], "p", lazy.spawn("~/.scripts/bin/quick-pass.sh")),
```

#### Keyboard Shortcuts Inside fzf

- Navigate with arrow keys, filter with fuzzy search.
- `Enter`: Reveal/password to clipboard.
- `Ctrl-E`: Edit password entry.
- `Ctrl-X`: Autofill password in the currently focused window with simulated keystrokes.

---

> [!TIP]
>  
> - There is a partial TODO for writing passwords directly to `qutebrowser` via FIFO; consider implementing this to expand browser integration.
> - The color formatting (`fd_fmt`) assumes your terminal supports true color and nerdfont (for Unicode icons).
> - As currently written, the script just outputs the password to stdout rather than copying it directly to the clipboard; consider using `pass -c` or piping output to `xclip`/`wl-copy` if you prefer that workflow.
> - Ensure that `xdotool`-based paste with `ctrl-x` is only used in trusted contexts, as it types out your password.
> - For portability, some hardcoded color codes and prompt formatting could be extracted into variables or config files. Handle edge cases like spaces in paths with care (wrap in quotes inside the script).
