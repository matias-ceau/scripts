# Script Launcher with fzf

---

**script_launcher.sh**: Run scripts with fzf for a streamlined execution and documentation preview.

---

### Dependencies

- `fzf`: A command-line fuzzy finder, used for interactive script selection.
- `fd`: A simple, fast, and user-friendly alternative to `find`, used for finding files.
- `bat`: A cat with wings. This utility is for syntax highlighting and displaying documentation.
- `improved-fzfmenu.sh`: A user-defined script that augments fzf with additional features.

### Description

This script is a powerful tool designed to efficiently run and edit scripts using `fzf`, a command-line fuzzy finder. It allows the user to browse through scripts located in the specified directory and preview their documentation or source code interactively.

Upon execution, the script utilizes `fd` to list all scripts in the defined `$SCRIPTS` directory. It then passes these results to `improved-fzfmenu.sh`, which handles the selection interface. The interface features:

- A customizable preview of each selected script's documentation using `bat` for syntax highlighting and formatting. The preview command has two modes: one for documentation (`preview_cmd_docs`) and another for source code (`preview_cmd_source`).
- Keyboard shortcuts for executing scripts directly, editing them in `nvim`, and toggling between views for documentation and source code.
- A carefully crafted header that provides quick reference to the available actions.

This script serves as an integral part of a developer's workflow, enhancing productivity by allowing for rapid script execution and documentation access.

### Usage

To use this script, simply run it from the terminal. You can customize the script to fit your specific needs by modifying the `$SCRIPTS` variable in the script where you define the path to your scripts directory.

Here are some examples of keybindings and their functionalities:

- **Enter**: Executes the selected script in a new shell.
- **Alt + Enter**: Executes the selected script within a terminal window.
- **Ctrl + E**: Opens the script in a new `nvim` editor window.
- **Alt + E**: Opens the script in `nvim` in a new terminal session.
- **Alt + S**: Switches preview to the source of the script.
- **Alt + D**: Switches back to the documentation view.

To start the script, you would run:

```bash
bash /home/matias/.scripts/script_launcher.sh
```

---

> [!TIP] 
This script could benefit from more customization options for the preview window, including size adjustments and support for multiple selections. Implementing a logging feature to keep track of executed scripts might also enhance usability and troubleshooting.