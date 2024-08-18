# Improved Fzf Menu with Alacritty

---

**improved-fzfmenu.sh**: A script to enhance fzf interface in Alacritty terminal, with output piping option.

---

### Dependencies

- `fzf`: A command-line fuzzy finder, which the script relies on for interactive selection.
- `alacritty`: A terminal emulator used for launching the fzf interface.

### Description

This script serves as an enhanced wrapper around the `fzf` fuzzy finder, allowing it to run within the Alacritty terminal emulator. It simplifies the user experience by handling arguments and providing an option to pipe the output of the selection to standard output. Its structure allows for clear separation of functionalities, with specific handling for options provided during invocation.

Key features include:

- **Terminal support:** Currently defaults to `alacritty`, but plans to include support for other terminals like `kitty`.
- **Output piping:** The script can optionally output the selected item either to the terminal or redirect it to other commands if the `--pipe` option is used.

The script makes extensive use of command substitution and argument parsing to effectively manage user inputs.

### Usage

To execute the script, simply call it from the terminal as follows:

```bash
/path/to/improved-fzfmenu.sh [fzf_options]
```

Examples:

1. Launch fzf without piping:
   ```bash
   /home/matias/.scripts/improved-fzfmenu.sh --height=40% --preview 'cat {}'
   ```

2. Launch fzf with piping option:
   ```bash
   /home/matias/.scripts/improved-fzfmenu.sh --pipe --height=40%
   ```

In these examples, you can replace `[fzf_options]` with any valid options you wish to pass to `fzf`. Remember, using the `--pipe` flag changes the behavior of the output.

---

> [!TIP]  
Consider adding error handling to check if `alacritty` and `fzf` are installed before executing commands. This can improve user experience by providing meaningful feedback when dependencies are missing. You could also enhance the script by allowing dynamic terminal selection and adding resizing options for the terminal.