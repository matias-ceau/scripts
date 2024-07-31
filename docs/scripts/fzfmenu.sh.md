# FZF Menu Launcher

---

**[fzf.sh](fzf.sh)**: A wrapper script to launch fzf in a terminal for menu selection.

---

### Dependencies

- `fzf`: A command-line fuzzy finder that allows for efficient searching of items.
- `xterm`: A terminal emulator for the X Window System; required to display the fzf interface interactively.

### Description

This script serves as a helper function to create a menu interface utilizing `fzf` within an `xterm` terminal emulator. It allows users to leverage the fuzzy finding capabilities of `fzf` for selecting items from a stream of input. This functionality is similar to `dmenu`, but it makes use of `fzf`'s advanced features for a more enhanced user experience.

Upon execution, the script opens an `xterm` window titled 'fzfmenu' and runs `fzf` in an interactive mode. The script captures standard input, allowing users to provide a list of items, which `fzf` will filter in real-time as the user types. The selection is then outputted to standard output, making it easy to capture the chosen item for further processing.

### Usage

To use this script, simply execute it in your terminal. You can pass additional parameters to `fzf` as needed. Here's the basic command:

```bash
/home/matias/.scripts/fzfmenu.sh
```

You can also use it in conjunction with command output. For example, if you want to select from a list of files:

```bash
ls | /home/matias/.scripts/fzfmenu.sh
```

This will pipe the output of `ls` into the `fzf` menu, allowing you to pick a file interactively.

You can integrate this script into your window manager or keybindings. For instance, in `qtile`, you might set a keybinding to launch this script directly from your keyboard.

---

> [!TIP]  
> Consider adding error handling to ensure that dependencies are installed before attempting to run the script. Additionally, enabling options for customizing `fzf` parameters (like `--height`, `--preview`, etc.) through command-line arguments could improve user experience and flexibility.
