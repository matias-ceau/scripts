# Improved FZF Alacritty Menu

---

**improved-fzfmenu.sh**: Launches an `fzf` session in an Alacritty floating terminal; flexible output piping.

---

### Dependencies

- `alacritty` — GPU-accelerated terminal emulator (used as the default terminal).
- `fzf` — Command-line fuzzy finder, which powers the selection UI.
- `systemd-run` — Runs the terminal as a transient systemd user service (better resource control).
- `bash` — Used as the shell interpreter.
- `procfs` (`/proc/$$/fd/0`, etc.) — Used to precisely control the input and output for the spawned `fzf`.
- Custom keybindings (suggested, if using with qtile or in scripts).

---

### Description

This script, **improved-fzfmenu.sh**, provides a highly flexible way to launch `fzf` (a powerful fuzzy finder) inside an Alacritty terminal window set to a floating class. Some features and internal details:

- **Floating Terminal:** Sets the X11 class to `floating`, which your qtile configuration can use to automatically float the window.
- **Custom Window Title:** Use `title_is_MYTITLE` as an argument to set a custom window title (useful for qtile hooks and window rules).
- **Flexible Arguments:** Any arguments not interpreted as control (like `--pipe` or `title_is_*`) are forwarded (properly quoted) to `fzf`.
- **Output Piping:** Pass `--pipe` as an argument to enable output from `fzf` to be piped through the terminal process (useful for capturing results or scripts that consume the output).
- **Process Isolation:** Uses `systemd-run --user --scope` for improved process management, which can help especially in more complex script environments.
- **Input Redirection:** Feeds `fzf` its input directly from the calling shell for maximal flexibility.

---

### Usage

You can run this script either from a terminal, or trigger it as part of a keybinding in your qtile configuration:

```sh
improved-fzfmenu.sh [--pipe] [title_is_MYTITLE] [fzf options...]
```

**Examples:**

- Basic invocation (floating fzf terminal):
  ```sh
  improved-fzfmenu.sh
  ```

- Set a custom window title (helpful for qtile rules):
  ```sh
  improved-fzfmenu.sh title_is_myMenu
  ```

- Pipe output from `fzf` to your script:
  ```sh
  improved-fzfmenu.sh --pipe
  ```

- Use a specific fzf option (e.g., preview):
  ```sh
  improved-fzfmenu.sh --preview "cat {}"
  ```

**Typical keybinding in qtile's config.py:**
```python
Key([mod], "p", lazy.spawn("~/.scripts/bin/improved-fzfmenu.sh title_is_launcher"))
```

---

> [!TIP]
> - **Potential Improvements:**  
>   - Add an option to specify the terminal (e.g., allow `kitty` for image previews).
>   - Add sizing/configuration options for better adaptability.
>   - Argument quoting could be improved if extremely complex arguments are needed.
>   - Consider error checks for missing dependencies or arguments, and provide helpful feedback if they're absent.
>   - For X11/Wayland class or title matching, ensure your qtile rules are set accordingly!
>
> Overall, the script is modular and very handy for integrating `fzf` into your window manager workflows!