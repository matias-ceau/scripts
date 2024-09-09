# Improved FZF Menu

---

**improved-fzfmenu.sh**: A versatile FZF menu launcher that uses Alacritty terminal.

---

### Dependencies

- `fzf`: Command-line fuzzy finder that processes the input and helps create an interactive menu.
- `alacritty`: A fast terminal emulator that is required to launch the FZF menu. 
- `bash`: The script is written in Bash.

### Description

The **improved-fzfmenu.sh** script launches an FZF (Fuzzy Finder) interface within the Alacritty terminal. It allows you to interactively choose from items presented in a fuzzy-search style. The script accepts several optional parameters allowing customization such as the terminal title and enabling piping of output.

When the script is executed, it processes various command-line arguments:

1. **--pipe**: If this argument is included, the output from FZF can be piped to the standard output stream.
2. **Title Customization**: You can customize the terminal window title by providing a parameter that begins with `title_is_`.

The script initializes variables for the terminal (`term`), title (`title`), class (`class`), and whether to enable piping (`pipe`). It then aggregates any additional arguments for FZF by escaping them for proper processing.

### Usage

To use the script, simply execute it from your terminal with any desired options. Here are some examples:

```bash
# Basic usage without piping or title customization
/home/matias/.scripts/improved-fzfmenu.sh "Option 1" "Option 2" "Option 3"

# Using title customization
/home/matias/.scripts/improved-fzfmenu.sh title_is_Custom_Title "Option A" "Option B"

# Enabling piping
/home/matias/.scripts/improved-fzfmenu.sh --pipe "Select this" "Or that"
```

---

> [!TIP] 
> Consider enhancing your script by implementing error handling for invalid arguments and terminal launching failures. Furthermore, adding options for different terminal emulators (e.g., `kitty`) and supporting window sizing would significantly increase its versatility.