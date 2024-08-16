# Improved FZF Menu

---

**improved-fzfmenu.sh**: FZF menu integration with Alacritty, supporting output piping.

---

### Dependencies

- `fzf`: A command-line fuzzy finder that provides an interactive searching interface.
- `alacritty`: A terminal emulator designed for performance, written in Rust.

### Description

`improved-fzfmenu.sh` is a Bash script that enhances user interaction with the fuzzy finder `fzf` by running it inside an Alacritty terminal. This script allows users to pass arguments to `fzf` and optionally pipe its output. The main features of the script include:

- **Argument Handling**: The script processes command-line arguments, allowing users to specify options for `fzf` easily. The `--pipe` option enables output piping from `fzf` to the standard output (stdout).
- **Terminal Support**: The script is designed to launch `fzf` within the Alacritty terminal, providing a visually appealing interface. 

The main functionalities are achieved using conditional checks to determine whether to pipe the output or not based on the presence of the `--pipe` flag.

### Usage

To execute the script, run it from your terminal with any desired `fzf` options. Here are two examples:

**Without Piping:**
```bash
~/scripts/improved-fzfmenu.sh --height 50% --reverse --preview "cat {}"
```

**With Piping:**
```bash
~/scripts/improved-fzfmenu.sh --pipe --height 50% --reverse --preview "cat {}"
```

In the examples above:
- The first command launches `fzf` in Alacritty without output piping, allowing for interactive selection.
- The second command pipes the output from `fzf`, which can then be used for further processing in the terminal.

---

> [!TIP]  
> The script currently limits terminal options to Alacritty. Consider adding a feature to allow users to specify different terminal emulators like `kitty` or others for enhanced flexibility. Also, implementing sizing modification options would improve user experience significantly.