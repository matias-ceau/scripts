# Fuzzy Finder Menu for Running Commands

---

**fzfmenu_run.sh**: A script to replace DMenu with fzf for executing commands in a floating terminal.

---

### Dependencies

- `dmenu`: A dynamic menu for X. It is required for retrieving the list of commands to execute.
- `fzf`: A command-line fuzzy finder that allows filtering through items like commands easily.
- `xterm`: A terminal emulator for the X Window System, used to execute and display commands.

### Description

This script utilizes `dmenu` to fetch a list of available commands, processes that list through `fzf` for an enhanced user experience, and then executes the selected command in a floating `xterm` terminal. This is particularly useful for lightweight window managers like `qtile`, as it provides a straightforward and efficient way to run applications without cluttering the screen.

The command execution process works as follows:

1. `dmenu_path` generates a dynamic list of executable commands based on the user's environment PATH.
2. The output is piped into `fzfmenu.sh`, which handles the fuzzy searching of the command list.
3. Once a command is selected, it is passed through `xargs` to execute it in a newly opened `xterm` terminal window.

### Usage

To run this script, you simply need to execute it from the terminal. An ideal way to integrate it is using a keybinding in `qtile`, which can be set up in your `config.py`. Here is a basic example of how to call it directly from a terminal:

```bash
bash /home/matias/.scripts/fzfmenu_run.sh
```

You might want to bind it to a key in your `qtile` configuration:

```python
Key([mod], "r", lazy.spawn("bash /home/matias/.scripts/fzfmenu_run.sh")),
```

With this setup, pressing `mod + r` will trigger the script, allowing you to quickly run commands.

---

> [!TIP] This script could benefit from error handling, particularly when executing commands. For instance, if a command fails to run or is not found, it would be prudent to provide user feedback. Additionally, incorporating options for customizing the appearance and behavior of `xterm` would enhance the user experience, such as setting specific colors or window sizes.