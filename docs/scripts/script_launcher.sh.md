# Script Launcher for FZF

---

**script_launcher.sh**: Launch scripts interactively with fzf, featuring live previews.

---

### Dependencies

- `fzf`: A command-line fuzzy finder.
- `bat`: A command-line tool for viewing files with syntax highlighting and Git integration.
- `improved-fzfmenu.sh`: A custom script that enhances fzf functionality.
- `fd`: A simple, fast and user-friendly alternative to `find`.

### Description

The `script_launcher.sh` script is designed to facilitate the interactive execution of scripts in a user-friendly manner using **fzf** (fuzzy finder). By leveraging `fd` to find scripts in the specified directory, this script allows users to search, preview, and execute scripts with several convenient keybindings.

Here is how the script operates:
- It defines two preview commands using `bat`: one for displaying documentation in Markdown (`preview_cmd_docs`), and another for presenting the source code (`preview_cmd_source`). 
- Using `fd`, it lists all executable scripts within the `$SCRIPTS` directory and pipes the result to the custom script `improved-fzfmenu.sh`.

Key functionalities are controlled through several keybindings:
- **Enter**: Executes the selected script directly in the current terminal session.
- **Alt + Enter**: Runs the selected script in a new terminal using a custom script.
- **Alt + E**: Opens the script in `nvim` (Neovim) for editing.
- **Insert**: Launches the script in a new terminal with Neovim.
- **Alt + S / Alt + D**: Switches between documentation and source-preview modes.

### Usage

To use the `script_launcher.sh`, simply run the script from your terminal. Ensure that your environment variable `$SCRIPTS` is set to your scripts directory containing the executables.

```bash
bash /home/matias/.scripts/script_launcher.sh
```

Once the fzf interface appears, type to filter the list of scripts. Use the defined keybindings for specific actions:
- Press **Enter** to run the script.
- Press **Alt + E** to edit it in Neovim.
- Use **Alt + S** and **Alt + D** to toggle between source and documentation previews.

---

> [!TIP]  
> Consider adding more user-friendly error handling (e.g., checking if the dependencies are installed) along with more detailed documentation about the `improved-fzfmenu.sh` functionalities. Implementing the TODO of rendering a PDF/HTML of documentation could significantly enhance the script's utility.