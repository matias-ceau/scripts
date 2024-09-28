# Improved FZF Menu with Alacritty

---

**improved-fzfmenu.sh**: A customizable FZF menu utilizing Alacritty which can output piped data

---

### Dependencies

- `alacritty`: A modern terminal emulator focused on performance.
- `fzf`: A command-line fuzzy finder for quickly searching and opening files.

### Description

The **Improved FZF Menu** script is designed to launch a fuzzy finder interface using `fzf` within an `alacritty` terminal window. This script supports customization of the terminal window's title and behavior via command-line arguments. Additionally, it includes the ability to pipe results from `fzf` to other commands or outputs.

The script processes all incoming arguments, identifying those prefixed with `title_is_` to set the window title and checking if `--pipe` is present to determine if output should be piped. Arguments are safely escaped to prevent command-line injection vulnerabilities.

The `term`, `class`, and default `title` can be adjusted in the script, offering flexible usage. 

### Usage

To use this script, you can run it directly from the terminal. Below are some example usages:

```bash
# Basic usage
./improved-fzfmenu.sh

# Customize the title with a prefix
./improved-fzfmenu.sh title_is_MyTitle

# Use piped output
./improved-fzfmenu.sh --pipe
```

This script can be integrated into your `qtile` window manager for quick access, or used interactively in a terminal session.

---

> [!NOTE]  
> This script's customization options for terminal and sizing are not currently implemented, as mentioned in the TODO section. Providing users with terminal choices between `alacritty` and others like `kitty`, as well as adjustable window sizes, could enhance its utility.