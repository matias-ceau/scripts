# Script Launcher

---

**script_launcher.sh**: Launch scripts using fzf with customizable previews and commands.

---

### Dependencies

- `fzf`: A command-line fuzzy finder, essential for script selection.
- `fd`: A simple, fast and user-friendly alternative to `find`.
- `bat`: A cat clone with syntax highlighting and Git integration, used for previewing script documentation.
- `improved-fzfmenu.sh`: A custom script that enhances the functionality of `fzf`.

### Description

This script provides an interactive menu for running other scripts stored in a specified directory. Utilizing `fzf`, it enables users to quickly find and execute scripts with enhanced functionality, such as previews of documentation and source files. 

The essential logic flows as follows:

1. **Preview Commands**:
   - The script builds two preview commands using `bat`:
     - `preview_cmd_docs`: Displays the documentation for the script.
     - `preview_cmd_source`: Shows the source code of the selected script.

2. **Script Selection**:
   - It utilizes `fd` to find scripts in the `$SCRIPTS` directory, presenting them through `improved-fzfmenu.sh` with interactive behavior:
     - Pressing **Enter** executes the selected script.
     - Alt + E opens the selected script in `nvim`.
     - Alt + S switches the preview to the source code.
     - Alt + D reverts the preview to the documentation.

### Usage

To use the `script_launcher.sh`, simply execute it in your terminal:

```bash
bash /home/matias/.scripts/script_launcher.sh
```

You can navigate through the presented list of scripts by typing or using the arrow keys, and then select them using **Enter**.  

Here are some example keybindings:
- **Enter**: Run the script.
- **Alt + E**: Edit the script using `nvim`.
- **Alt + S**: Preview the source code of the script.
- **Alt + D**: Preview the documentation of the script.

---

> [!TIP]
> Consider adding error handling for scenarios where `fd` doesn't find any scripts or where external commands (like `bat` or `nvim`) fail to execute. This will make the script more robust and user-friendly. Additionally, clarifying the `$SCRIPTS` variable definition in the documentation would enhance user comprehension.