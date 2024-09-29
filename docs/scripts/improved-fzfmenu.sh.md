# Improved FZF Menu

---

**improved-fzfmenu.sh**: A script that utilizes `fzf` in an `alacritty` terminal, with output piping support.

---

### Dependencies

- `fzf`: Command-line fuzzy finder that provides an interactive selection interface.
- `alacritty`: A fast, GPU-accelerated terminal emulator.
  
### Description

This script enhances the functionality of the `fzf` fuzzy finder by launching it in a specified terminal emulator, which defaults to `alacritty`. It allows users to pass various arguments to `fzf`, enabling flexible configurations and user preferences.

Key features include:

- **Terminal & Title Configuration**: Users can customize the terminal type and window title when launching `fzf`.
- **Piping Capability**: The script can conditionally pipe the output of `fzf` to different file descriptors based on the provided arguments.

The script processes command-line arguments to determine if output piping is needed and what title to use for the terminal window. It uses bash features such as string manipulation and conditionals to achieve this.

### Usage

Run the script directly from the terminal. You can specify different options based on your needs. Here’s a quick usage guide:

- To run `fzf` without output piping while showing in `alacritty`:

```bash
./improved-fzfmenu.sh
```

- To customize the terminal title:

```bash
./improved-fzfmenu.sh title_is_CustomTitle
```

- To enable piping for output:

```bash
./improved-fzfmenu.sh --pipe
```

You can combine these commands by passing multiple arguments:

```bash
./improved-fzfmenu.sh title_is_MyTitle --pipe --reverse --height=20%
```

This command provides a custom title, enables output piping, and modifies `fzf` settings.

---

> [!TIP]  
> Consider implementing enhancements like allowing users to select different terminal emulators (e.g., `kitty`) directly through an argument, thereby making the script more versatile. Additionally, providing options for window sizing and layout customization could improve user experience significantly.