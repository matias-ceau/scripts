# nvim in Floating Terminal

---

**nvim_in_new_terminal.sh**: Open a file in `nvim` inside a floating Alacritty terminal window

---

### Dependencies

- `alacritty`: GPU-accelerated terminal emulator for X11/Wayland.
- `nvim` (Neovim): Modern Vim-based text editor, used for file editing.
- `setsid`: Run a program in a new session (standard GNU tool).
- A window manager (e.g., `qtile`) with rules for the `"floating"` window class.  
  → Requires custom window rules for `"floating"` to ensure desired appearance.

---

### Description

This script provides a convenient way to open any file in `nvim` within a floating terminal window by leveraging `alacritty` and qtile's window management. The key components are:

- **setsid**: Guarantees the spawned terminal runs in a new session, preventing it from being tied to the parent shell or session.
- **alacritty**: Launched with the title `nvim-term` and a custom X11/WM class of `floating`. The `-e` flag starts `nvim` on the file specified by the first argument ($1).
    - The `"floating"` class allows qtile to apply dedicated rules (e.g., always start as floating, centered), providing optimal integration.

Typical uses:
- Launch from a keybinding to quickly edit configuration files, scripts, etc., in a distraction-free floating terminal.
- Easily adaptable for use by other scripts that need floating editing functionality.

---

### Usage

The script can be executed directly from a terminal or integrated into qtile or other WM keybindings.

**Command-line:**
```
nvim_in_new_terminal.sh <path/to/file>
```

**Examples:**
```
nvim_in_new_terminal.sh ~/.config/qtile/config.py
nvim_in_new_terminal.sh /tmp/notes.txt
```

**Qtile Keybinding Example**:
In your qtile `config.py` (after ensuring the script is executable and on your PATH):
```python
Key([mod], "e", lazy.spawn("nvim_in_new_terminal.sh ~/.local/todo.txt")),
```

*Note:* For best results, ensure qtile floating rules are set for the 'floating' class, e.g.:
```python
@hook.subscribe.client_new
def set_floating(window):
    if window.window.get_wm_class() and 'floating' in window.window.get_wm_class():
        window.floating = True
```

---

> [!TIP]
> **Potential Issues & Suggestions:**
>
> - The script will silently do nothing if no file argument is given. Consider adding input validation to check for an argument and display a usage message if missing.
> - It assumes both `alacritty` and `nvim` are in the PATH and available. Adding checks for dependencies could improve robustness.
> - The `"floating"` class requires a matching window rule in `qtile`. If this is missing or misconfigured, the terminal may not float as expected.
> - Does not handle the case where multiple words/spaces are present in the filename; quoting is correct but further validation could be helpful.  
> - For improvement: Allow passing additional arguments to `nvim`.
