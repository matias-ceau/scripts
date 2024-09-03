# Improved FZF Menu Integrator

---

**improved-fzfmenu.sh**: A script to launch FZF in Alacritty, with optional output piping.

---

### Dependencies

- `fzf`: A command-line fuzzy finder used for interactive selection.
- `alacritty`: A fast terminal emulator that supports modern OpenGL-powered rendering.

### Description

The `improved-fzfmenu.sh` script provides a streamlined way to integrate the FZF fuzzy finder with the Alacritty terminal emulator on Arch Linux, specifically designed for window managers like Qtile. The script accepts arguments and determines whether to pipe the output of FZF or not based on user input.

Key functionalities include:

- **Terminal Selection**: Currently set to `alacritty`, but the script has room for expanding to additional terminals (e.g., `kitty`).
- **Output Piping**: Users can toggle the output between standard output and piping to another command using the `--pipe` argument.
- **Argument Handling**: Automatically escapes arguments to ensure compatibility with the shell environment.

### Usage

To run the script, simply execute it from the terminal with any arguments you wish to pass to FZF. Here are a few examples:

**Basic Usage:**
```bash
~/scripts/improved-fzfmenu.sh
```
This command opens the FZF menu in Alacritty with no specific arguments.

**Using with Arguments:**
```bash
~/scripts/improved-fzfmenu.sh --height 40% --preview 'cat {}'
```
This runs FZF with a specific height and a preview of the selected item.

**Using with Output Piping:**
```bash
~/scripts/improved-fzfmenu.sh --pipe
```
This command executes FZF and pipes the selected output, which can be handled differently in your workflow.

---

> [!TIP] 
> The script currently defaults to Alacritty. It would be beneficial to implement dynamic terminal selection through a command-line argument, enhancing the script's versatility. Additionally, as the TODO comment suggests, adding functionality for terminal sizing would make it more user-friendly and adaptable to various screen configurations. Consider implementing verbose logging for easier debugging and monitoring of script behavior.