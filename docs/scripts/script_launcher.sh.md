# Script Launcher

---

**script_launcher.sh**: Run scripts with fzf

---

### Dependencies

- `fzf`: Command-line fuzzy finder, used for interactive selection.
- `bat`: A cat clone with syntax highlighting and Git integration, used for previewing scripts and documentation.
- `pastel`: A tool to generate and manipulate colors in the terminal.
- `fd`: A simple, fast, and user-friendly alternative to `find`.

### Description

The `script_launcher.sh` script acts as a script execution launcher utilizing `fzf`, a fuzzy finder, to list and execute scripts stored in a specified directory (`$SCRIPTS`). Users can view documentation for each script via a preview pane, which uses `bat` to format the output nicely. It supports colored file types for better visual identification and enables various key-bindings for quick actions.

- **Preview Commands**:
  - Shows the documentation file if it exists (`$SCRIPTS/docs/scripts/{2}.md`).
  - Displays the source code of the selected script.

- **Coloring Utility**: The script includes a function `hex2ansi` to convert hex color codes to ANSI for colored outputs, improving visual distinction among different script types.

### Usage

To use the script, run it from the terminal. It can be invoked with the optional `--embedded` argument, which changes its behavior:

- To launch in terminal:
```bash
bash ~/scripts/script_launcher.sh
```

- To launch embedded:
```bash
bash ~/scripts/script_launcher.sh --embedded
```

The script lists scripts found in the `$SCRIPTS` directory. Use the following keybindings during selection:

- `Enter`: Execute the selected script.
- `Alt + Enter`: Run the script in a new terminal.
- `Ctrl + E`: Open the script in `nvim`.
- `Alt + E`: Open `nvim` in a new terminal with the script.
- `Alt + S`: Switch to show the source code preview.
- `Alt + D`: Switch back to documentation preview.
- `Resize`: Refresh the preview window.

---

> [!TIP] 
> Review the dependencies to ensure they are installed and accessible in the `$PATH`. The script includes TODO comments for future improvements, such as adding PDF/HTML rendering, multiple script selection, and preview enhancements. Implementing these features could significantly enhance usability and functionality.