# Script Launcher

---

**script_launcher.sh**: A script to run other scripts with fzf.

---

### Dependencies

- `fzf`: A command-line fuzzy finder that allows for efficient searching and filtering.
- `bat`: A clone of `cat` with syntax highlighting and Git integration, used for viewing files.
- `fd`: A simple, fast, and user-friendly alternative to `find` for searching files.

### Description

The `script_launcher.sh` script allows you to quickly launch scripts from a defined directory (`$SCRIPTS`) using the `fzf` interface, enriched with previews of the scripts or their documentation. This enhances productivity by providing users with the ability to see script documentation or source code before executing them, providing better context.

The script employs the following key components:
- **Preview commands**: It uses `bat` to show the documentation or source code for scripts via `fzf`:
  - `preview_cmd_docs`: Displays the documentation in markdown format.
  - `preview_cmd_source`: Shows the source code with line numbers.
  
- **fzf menu binding**:
  - Pressing **Enter** runs the selected script in the terminal.
  - Pressing **Alt + E** opens the selected script in `nvim`.
  - Pressing **Alt + S** switches the preview to show the source code.
  - Pressing **Alt + D** changes the preview back to the documentation.

### Usage

To use the script, simply execute it in your terminal:

```bash
bash /home/matias/.scripts/script_launcher.sh
```

This command will launch the `fzf` menu, displaying all scripts available in the `$SCRIPTS` directory. You can start typing to narrow down the selection, and navigate through the options. 

For example:
- To run a script named `example_script.sh`, simply select it and hit **Enter**.
- To examine its documentation, highlight the script and note the preview window on the screen.
- Press **Alt + E** to edit the script directly in `nvim`.

---

> [!TIP]  
This script could benefit from better error handling. For instance, if `$SCRIPTS` is undefined or empty, it should gracefully notify the user instead of failing silently. In addition, consider adding a help option to explain these keybindings directly in the `fzf` interface for new users.