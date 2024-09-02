# Improved FZF Menu Script

---

**improved-fzfmenu.sh**: Launches FZF in Alacritty with options for piping the output

---

### Dependencies

- `fzf`: A general-purpose command-line fuzzy finder. This script utilizes `fzf` for interactive menu selection.
- `alacritty`: A terminal emulator that is used to execute the FZF command in a floating window.

### Description

The `improved-fzfmenu.sh` script is designed to enhance user interaction by launching `fzf` (Fuzzy Finder) within the Alacritty terminal emulator. This script allows users to pipe the output from `fzf` back to the shell or other commands, providing seamless integration and usability across different contexts.

Key features of this script include:

- **Terminal Selection**: The script defaults to using Alacritty but can potentially be modified to support other terminal emulators in the future, such as Kitty, per the `TODO` comments.
- **Argument Handling**: It efficiently processes command-line arguments, escaping each to ensure that they are handled correctly by the shell. The user can specify a "--pipe" option to decide whether to pipe the output.
- **Dynamic Options**: The script is set up for future modifications, such as changing terminal windows or adjusting sizing parameters for the FZF interface.

### Usage

To utilize the `improved-fzfmenu.sh`, it can be executed in a terminal as shown below. You can pass optional arguments to customize the behavior:

```bash
./improved-fzfmenu.sh [OPTIONS]
```

- To run `fzf` without piping:
```bash
./improved-fzfmenu.sh
```

- To run `fzf` with output piped to another command:
```bash
./improved-fzfmenu.sh --pipe | some_other_command
```

Here, `[OPTIONS]` could represent filters or flags for `fzf`. This script is intended to run directly from a command line, but it can also be easily assigned to a keybinding for quick access in your workspace.

---

> [!TIP]  
> Consider implementing error handling to manage situations where `alacritty` or `fzf` is not installed or accessible. Additionally, allowing the user to specify the terminal as an argument or through a configuration file could enhance the script's flexibility. Including documentation within the script itself can further help users understand how to customize and utilize options effectively.