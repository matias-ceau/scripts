# Script Launcher

---

**script_launcher.sh**: Run scripts with fzf for easy access and previews

---

### Dependencies

- `bat`: Provides syntax highlighting and Git integration for file viewing.
- `fzf`: A command-line fuzzy finder for search functionality.
- `improved-fzfmenu.sh`: A custom script enhancing fzf's capabilities.
- `nvim`: A powerful text editor based on Neovim.

### Description

The `script_launcher.sh` is a Bash script designed to facilitate the running and editing of user scripts with enhanced previews using `fzf`. This tool integrates the fast fuzzy finding of scripts and allows for previewing documentation in various formats. 

Key features:
- Utilizes `bat` for viewing script contents and documentation with syntax highlighting.
- Provides interactive features such as executing scripts, opening them in the editor, and changing preview modes between documentation and source code.
- Supports customizable key bindings to enhance user experience.
- The preview window can display either the script's documentation or the source code, toggled with specific key combinations.

The script reads the available scripts from a given directory and then uses `fzf` to present them in a menu, allowing the user to pick and execute them via simple keybindings. 

### Usage

To use this script, simply execute it in your terminal:

```bash
bash /home/matias/.scripts/script_launcher.sh
```

Once the script is running, you'll see a list of the available scripts. Here are some keybindings you can use:

- `Enter`: Execute the selected script in the current shell.
- `Alt + Enter`: Execute the script in a new terminal.
- `Ctrl + E`: Edit the selected script with Neovim.
- `Alt + E`: Edit the script in a new terminal window.
- `Alt + S`: Toggle preview to show the source of the selected script.
- `Alt + D`: Toggle back to the documentation preview.

Additionally, you can resize the preview window, and navigate through the suggestions using arrow keys or a predefined scroll mechanism.

---

> [!TIP]  
> There are potential areas for improvement in the script. For instance, it currently lacks a feature to render documentation as PDF/HTML. Consider implementing a way to navigate through previews using the Page Up and Down keys. Enabling multiple selections would also enhance the script's usability, along with including options for logging and statistics collection for user actions.