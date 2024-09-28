# FZFMenu Run Script

---

**fzfmenu_run.sh**: Dmenu run replacement using `fzf` within a floating xterm terminal

---

### Dependencies

- `dmenu_path`: Provides a list of executable programs in the user's `PATH`.
- `fzfmenu.sh`: A script that utilizes `fzf` to present a menu interface for selecting executables.
- `xargs`: A command that builds and executes command lines from standard input.
- `bash`: The Bourne Again Shell, required for script execution.
- A floating terminal setup in your qtile configuration.

### Description

The `fzfmenu_run.sh` script serves as a replacement for the standard `dmenu_run` by combining the power of `fzf` (a command-line fuzzy finder) with `dmenu_path` and executing commands within a floating `xterm` window. This script effectively creates a launcher for applications in your Arch Linux environment, styled to work with your qtile window manager configuration.

- The script first runs `dmenu_path`, which generates a list of all executables available in your `PATH`.
- It pipes this list to another script, `fzfmenu.sh`, which invokes `fzf` to display a searchable menu.
- Once user selection is made, `xargs` executes the chosen command within a newly spawned `xterm` window.

### Usage

To use this script, ensure it is executable and can be added to keybindings or run directly from your terminal. Before using, verify that all dependencies, particularly `fzfmenu.sh`, are properly configured.

```bash
chmod +x /home/matias/.scripts/fzfmenu_run.sh
```

Run the script interactively:

```bash
/home/matias/.scripts/fzfmenu_run.sh
```

Or assign it to a keybinding in your qtile configuration for faster access.

Example of a keybinding in qtile:

```python
Key([mod], "r", lazy.spawn("/home/matias/.scripts/fzfmenu_run.sh"))
```

Ensure `xterm` is configured to open as a floating window in your `qtile` settings for optimal user experience.

---

> [!NOTE]
> - Ensure that `fzfmenu.sh` exists and functions as expected since `fzfmenu_run.sh` relies on it.
> - Consider adding error handling to manage cases where no command is selected or `fzfmenu.sh` is missing.
> - Using `xargs -I {}` can sometimes lead to unexpected behavior with complex commands; test thoroughly.