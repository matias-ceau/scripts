# FZF Menu Run Replacement

---

**fzfmenu_run.sh**: A script to replace Dmenu with fzf for enhanced run functionality.

---

### Dependencies

- `dmenu`: A dynamic menu for X, used to present options to the user.
- `fzf`: A command-line fuzzy finder which allows you to search through a list interactively.
- `xargs`: A command that builds and executes command lines from standard input.

### Description

This script serves as a run dialog replacement using `fzf` instead of `dmenu`. It presents a list of available commands and applications in your system, allowing users to interactively filter, select, and execute them in a floating `xterm` terminal.

Here's how the script operates:

1. It retrieves a list of commands from `dmenu_path`, which provides a list of installed applications.
2. The list is piped into `fzfmenu.sh`, which utilizes `fzf` to allow for interactive search and selection.
3. Once an item is selected, `xargs` is used to pass the selected command to `bash -c`, executing it in the background.

This combination enhances user experience by offering a powerful and flexible way to run commands directly from a terminal interface.

### Usage

To use the script, simply execute it from your terminal. 

```bash
/home/matias/.scripts/fzfmenu_run.sh
```

Alternatively, you may want to bind this script to a key in your window manager for quick access. For example, in `qtile`, you could add the following to your configuration:

```python
Key([mod], "r", lazy.spawn("/home/matias/.scripts/fzfmenu_run.sh")),
```

---

> [!TIP]  
> The script currently runs in the background and does not display any error messages if a command fails. Consider adding error handling to alert the user of any issues. Additionally, `fzfmenu.sh` might require its own documentation to clarify its role and setup.