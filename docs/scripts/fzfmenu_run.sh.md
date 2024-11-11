# FZF Dmenu Run Alternative

---

**fzfmenu_run.sh**: A replacement for Dmenu using `fzf` with floating `xterm` for commands.

---

### Dependencies

- `dmenu_path`: Generates a list of executable programs in the user's PATH.
- `fzfmenu.sh`: A script that likely integrates `fzf` to filter the list of executables[1].
- `xargs`: A command-line utility to build and execute commands from standard input.
- `bash`: The Bourne Again SHell, used to execute the chosen command.
- `xterm`: A terminal emulator for the X Window System, used for displaying selected outputs in a floating window.

> **Note:** Make sure `fzfmenu.sh` is executable and correctly located in your PATH.

### Description

This script serves as a Dmenu alternative that uses `fzf`, a command-line fuzzy finder, to select applications to run. The process involves generating a list of executables from `dmenu_path`, which is then piped into `fzfmenu.sh`. The chosen result from `fzf` is executed in a new floating `xterm` window using `xargs`. This allows for fuzzy searching of applications and running them in a floating terminal, offering a more visually appealing and interactive experience compared to standard Dmenu, especially in a tiling window manager like `qtile`.

### Usage

This script can be bound to a keybinding in `qtile` or run directly from the terminal.

```bash
# To execute the script from terminal
~/.scripts/bin/fzfmenu_run.sh
```

Or, if assigning to a keybinding in `qtile`, add something like this to your configuration:

```python
Key([mod], "r", lazy.spawn("~/.scripts/bin/fzfmenu_run.sh")),
```

Replace `[mod]` with your modification key of choice.

---

> [!TIP]  
> A potential improvement for this script could be to handle edge cases when no application is selected (e.g., pressing `Esc` or closing `fzf` without a selection). Additionally, documenting `fzfmenu.sh` or ensuring it is listed as a dependency would clarify its purpose within the script. Consider allowing users to configure the floating terminal dimensions or appearance directly from the script.