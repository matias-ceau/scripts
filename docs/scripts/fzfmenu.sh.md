# fzfmenu: A Fuzzy Finder with Xterm

---

**fzfmenu.sh**: Launches fzf in an xterm window using provided arguments.

---

### Dependencies

- `fzf`: A command-line fuzzy finder, essential for this script to function.
- `xterm`: A terminal emulator for the X Window System, used to launch the fzf interface.

### Description

This script creates a simple interface for the `fzf` fuzzy finder within an `xterm` terminal. It accepts arguments from the command line, escapes them properly, and then executes the `fzf` command within a new terminal window. 

**Key Features:**

- **Argument Handling:** The script accepts any number of arguments, escaping each one to ensure that they are safely parsed by the shell.
- **Process Redirection:** It redirects standard input and output, allowing for seamless interaction with the `fzf` command. This means you can pipe the results directly into and out of `fzf`, enhancing its interactivity.

The `fzf` interface opens in an `xterm` window with the title `fzfmenu`, providing a clean and focused environment for the user to search through the given inputs.

### Usage

To use the script, simply call `fzfmenu.sh` followed by any options or text you want to search through using `fzf`. Here are some examples:

```bash
# Open fzf with options
/home/matias/.scripts/fzfmenu.sh --preview 'cat {}'

# Fuzzy search through a list of files
ls | /home/matias/.scripts/fzfmenu.sh

# Chain with other commands, e.g., searching through history
history | /home/matias/.scripts/fzfmenu.sh
```

You can also assign this script to a keybinding in your window manager, making it accessible anytime you need to use it.

---

> [!TIP]  
> The script currently uses `xterm`, which may not be installed by default in all setups. Consider adding a check for `xterm` and providing a fallback option, such as `gnome-terminal` or printing an error message if `xterm` is unavailable. Additionally, adding `fzf` options for customization directly from the command-line arguments could enhance its flexibility.