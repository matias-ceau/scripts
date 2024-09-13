# Script Launcher 

---

**script_launcher.sh**: Run scripts with fzf

---

### Dependencies

- `fzf`: A command-line fuzzy finder that allows for script selection.
- `bat`: A clone of `cat` with syntax highlighting and Git integration, used for displaying script contents.
- `pastel`: A utility for terminal colors, required for color formatting.

### Description

The `script_launcher.sh` script is a Bash utility designed to provide a convenient interactive interface for executing various scripts within a directory. Utilizing `fzf`, it allows users to browse and select scripts with real-time previews and various actions. 

Key features of the script include:

- **Preview functionality**: When a script is selected, detailed documentation (if available) or the script source can be viewed in a preview window.
- **Color-coded outputs**: Different file types (like `.sh`, `.xsh`, and `.py`) are color-coded for quick visual identification, enhancing user experience.
- **Keybindings**: The interface supports custom keybindings for executing scripts, editing source files, and toggling preview types.
- **Flexibility for expansion**: The script outlines several TODO items for future features, including the possibility to render documentation in different formats (e.g., PDF, HTML).

### Usage

To run the script, execute it from your terminal:

```bash
bash /home/matias/.scripts/script_launcher.sh
```

Once running, you can navigate the list of scripts using the keyboard. Here are some keybindings you can use:

- **Enter**: Execute the selected script.
- **Alt + Enter**: Run the script in a new terminal.
- **Ctrl + E**: Open the script in `nvim`.
- **Alt + E**: Open the script in `nvim` in a new terminal.
- **Alt + S**: Switch to source preview of the script.
- **Alt + D**: Switch back to documentation preview.

As the interface generates the list using `fd`, ensure your scripts are organized correctly in the `$SCRIPTS` directory.

---

> [!TIP]  
> The script has potential for enhancements. Consider implementing multi-selection capabilities, which would allow for executing multiple scripts at once. Additionally, the inclusion of arguments for functions could make this tool more flexible for various workflows.