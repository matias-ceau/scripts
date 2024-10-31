# Improved FZF Menu with Alacritty

---

**improved-fzfmenu.sh**: Enhanced fzf integration with Alacritty, supports piping output

---

### Dependencies

- `alacritty`: A modern terminal emulator, required to display the fzf menu.
- `fzf`: A command-line fuzzy finder, used for interactive selections.
- `bash`: The script is written in Bash.

### Description

The `improved-fzfmenu.sh` script serves as an enhanced wrapper for the `fzf` utility that integrates with the `alacritty` terminal. The script processes command-line arguments to configure the behavior of the fzf session. Key features include setting a custom window title, allowing output piping, and potentially supporting different terminal types and window sizes in the future.

- **Customization Options**:
  - **Title**: The terminal window title can be altered by passing an argument prefixed with `title_is_`. 
  - **Class**: Sets the window class to `floating` for ease of interaction within tiling window managers like `qtile`.
  - **Piping**: Control output behavior via a `--pipe` argument, enabling standard output redirection.

### Usage

To use the script, you can execute it from the terminal with optional parameters for customization:

```bash
# Basic usage without piping
./improved-fzfmenu.sh

# Customize the title of the window
./improved-fzfmenu.sh title_is_MyFzfMenu

# Pipe the output to another process
./improved-fzfmenu.sh --pipe | tee output.txt

# Combine fzf arguments
./improved-fzfmenu.sh --bind=ctrl-r:reload

# Example with a custom title and piping the output
./improved-fzfmenu.sh title_is_CustomTitle --pipe > selected.txt
```

Assigning this script to a hotkey in `qtile` would allow quick access to the fzf menu from anywhere in your environment.

---

> [!CAUTION]
> While the script works as intended, improvements could be considered. For example, introducing support for other terminals (e.g., `kitty`) and allowing users to adjust the size of the terminal window dynamically would increase flexibility. Also, more robust error handling and documentation of potential failures could improve usability.