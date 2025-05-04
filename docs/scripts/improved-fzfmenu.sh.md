# Improved Fzfmenu with Alacritty

---

**improved-fzfmenu.sh**: Fzfmenu integration with `alacritty`, capable of piping output and customizable through arguments.

---

### Dependencies

- `alacritty`: A fast, cross-platform, OpenGL terminal emulator.
- `fzf`: A general-purpose command-line fuzzy finder necessary for the script's core functionality.
- `systemd-run`: Required to run the terminal as a systemd user scope for better process handling.

### Description

This script provides a more featureful integration between the `fzf` fuzzy finder and the `alacritty` terminal. It allows for customizations such as:

1. Specifying a custom terminal window title (`title` option, via `title_is_TITLE_NAME`).
2. Assigning a pipe mode via the `--pipe` argument, which redirects the output of `fzf`.
3. Custom `fzf` arguments, enabling advanced functionalities like filtering or previewing files.

**Key Features:**
- **Pipe Mode (`--pipe`)**: Activates output redirection.
- **Custom Titles (`title_is_`)**: Dynamically updates terminal titles.
- **Systemd Scope**: Makes use of `systemd-run --user --scope` for better isolation and resource management.

The script parses its arguments to determine its behavior, and it constructs an `fzf` command accordingly. It then spawns the `alacritty` terminal to execute this dynamic command within the user systemd scope. This improves script portability and enhances process control.

### Usage

To execute the script, run it from the terminal and provide arguments as needed:

```bash
improved-fzfmenu.sh <fzf_arguments> [--pipe] [title_is_<custom_title>]
```

**Examples:**
1. **Basic Usage**:  
   Open `fzf` within `alacritty` with no pipes or custom title:
   ```bash
   ./improved-fzfmenu.sh
   ```
   
2. **Custom Title**:  
   Set a terminal window title:
   ```bash
   ./improved-fzfmenu.sh title_is_MyFzfMenu
   ```

3. **With Pipe Mode**:  
   Enable pipe mode for redirecting `fzf`'s output:
   ```bash
   ./improved-fzfmenu.sh --pipe
   ```

4. **Custom Fzf Arguments**:  
   Pass specific filtering or preview arguments to `fzf`:
   ```bash
   ./improved-fzfmenu.sh --reverse --preview "bat --style=numbers --color=always {}"
   ```

---

> [!TIP]
> - The script could benefit from a configurable terminal option, as noted in the TODO section (e.g., supporting `kitty` for graphical previews).
> - Adding argument for sizing (e.g., setting terminal dimensions or position) could enhance flexibility, especially in floating environments like `qtile`.
> - Consider including error checking for cases where `alacritty` or `fzf` might not be installed, to guide users effectively. For instance, a simple dependency check at the beginning:  
>   ```bash
>   command -v alacritty &>/dev/null || { echo "Error: alacritty is not installed."; exit 1; }
>   ```
