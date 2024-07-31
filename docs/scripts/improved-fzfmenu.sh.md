# Improved FZF Menu Launcher

---

**[improved-fzfmenu.sh](/improved-fzfmenu.sh)**: A Bash script that launches `fzf` in an Alacritty terminal with custom settings.

---

### Dependencies

- `fzf`: A general-purpose command-line fuzzy finder.
- `alacritty`: A terminal emulator that is optimized for performance.

### Description

This script provides a streamlined way to launch a fuzzy finder in an Alacritty terminal window using `fzf`. It is particularly useful for users of Arch Linux and the QTile window manager who want to enhance their workflow by efficiently searching through various lists or options within a terminal.

The script begins by escaping each argument passed to it to prevent issues with special characters or spaces. This is achieved through a simple loop that utilizes `printf %q` for correct handling. After escaping the arguments, it joins them into one string for `fzf` to interpret.

The `alacritty` command is invoked with specific options:
- It sets the terminal title to `fzfmenu`.
- It configures the terminal window dimensions to a width of 150 columns and a height of 30 lines.
- It executes a Bash command to run `fzf` with the joined arguments and input redirected from the current process’s standard input.

### Usage

To use this script, you should provide the necessary arguments that will be forwarded to `fzf`. You can run it directly from the terminal as follows:

```bash
/home/matias/.scripts/improved-fzfmenu.sh --bind 'ctrl-c:abort'
```

This example runs the script, passing it the `--bind` option, which may configure how to exit `fzf`. Ensure that you adjust the provided command to meet your specific needs, such as adding more `fzf` flags or options.

You can also set this script to a keybinding in your window manager for quick access:
```bash
# Example for keybinding in QTile
Key([mod], "f", lazy.spawn("/home/matias/.scripts/improved-fzfmenu.sh"))
```

---

> [!TIP]  
> The script directly opens Alacritty shown with fixed dimensions, which may not be ideal for all screen resolutions. Consider adding functionality to detect screen size or allowing the user to customize these parameters through input arguments for better user flexibility.
