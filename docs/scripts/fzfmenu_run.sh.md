# Dmenu Replacement with Fzf

---

**fzfmenu_run.sh**: A lightweight dmenu replacement using fzf within a floating xterm terminal.

---

### Dependencies

- `dmenu`: A dynamicmenu for X11, providing a way to present a list of items in a graphical interface.
- `fzf`: A command-line fuzzy finder, which allows you to filter through text efficiently.
- `xterm`: A terminal emulator for the X Window System that displays the output of shell commands.

### Description

This script serves as a convenient replacement for the traditional `dmenu` launcher, instead leveraging `fzf` for enhanced fuzzy searching capabilities. When executed, it gathers a list of available menu items from the `dmenu_path` command, which generally lists applications and commands available in the system. The output is then piped into `fzfmenu.sh`, a script that presumably utilizes `fzf` to allow users to search through the list interactively.

The selected command is then passed to `xargs`, which executes the command in a new `xterm` instance. This makes it possible to launch applications or commands quickly while maintaining terminal access in a manageable floating window. The use of background execution (`&`) ensures that the terminal remains available for further use while the chosen command runs.

### Usage

To use this script, simply run it from your terminal:

```bash
bash /home/matias/.scripts/fzfmenu_run.sh
```

You will be presented with a menu where you can start typing to filter through the applications listed by `dmenu_path`. Once you find your desired application or command, select it, and it will open in a new `xterm` window.

You can also bind this script to a key in your window manager or launcher for quick access. For example, in `qtile`, you can add a keybinding in your configuration like this:

```python
Key([mod], "r", lazy.spawn("/home/matias/.scripts/fzfmenu_run.sh")),
```

---

> [!TIP] 
> Consider implementing error handling for cases where `dmenu_path` returns no results or `fzfmenu.sh` is not found. Additionally, you might want to customize the appearance of the `xterm` window to better fit your workflow or desktop environment. For example, adding options such as `-bg` for background color or `-fg` for foreground color can help improve visibility depending on your setup.