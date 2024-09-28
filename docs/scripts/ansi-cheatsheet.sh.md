# ANSI Escape Code Cheatsheet Script

---

**ansi-cheatsheet.sh**: Command-line script to display an ANSI escape code cheatsheet in the terminal using `bat`

---

### Dependencies

- `bat`: A cat clone with syntax highlighting and Git integration. You can install it via `sudo pacman -S bat` on Arch Linux.

### Description

This script, `ansi-cheatsheet.sh`, provides an easy way to access a cheatsheet for ANSI escape codes directly from the terminal. It utilizes the `bat` command to display the cheatsheet with markdown formatting and syntax highlighting, making it easy to read and understand. The cheatsheet includes escape codes for various text formatting options, foreground and background colors, bright colors, cursor movement commands, and other miscellaneous functions.

The escape codes are essential for adding color and text effects in terminal applications or scripts. This script is especially useful for developers working with terminal-based applications or writing scripts that require text styling and cursor control.

### Usage

To use the script, simply execute it in the terminal. Ensure `bat` is installed and available in your PATH.

```bash
# To display the ANSI escape code cheatsheet
./ansi-cheatsheet.sh
```

You can also create an alias in your shell configuration file (e.g., `.bashrc` or `.zshrc`) for convenience:

```bash
alias ansicheat='/home/matias/.scripts/ansi-cheatsheet.sh'
```

After adding the alias, you can quickly access the cheatsheet by simply typing:

```bash
ansicheat
```

This script can be run interactively in a terminal or assigned to a keybinding in qtile for quick access.

---

> [!TIP]
> The script currently uses `bat` with the `-plmd` options. Ensure these options are suitable for your intended display format. Otherwise, consider customizing the flags for better readability if themes are misaligned. Moreover, adding a fallback to standard `cat` in case `bat` isn't installed could make the script more robust on systems without `bat`.