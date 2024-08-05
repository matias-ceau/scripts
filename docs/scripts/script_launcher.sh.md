# Script Launcher

---

**script_launcher.sh**: A utility to run scripts with fzf and preview documentation.

---

### Dependencies

- `fzf`: A command-line fuzzy finder that allows for quick searching and selection of items.
- `bat`: A cat clone with syntax highlighting and Git integration, used for previewing script documentation.
- `improved-fzfmenu.sh`: A custom wrapper for fzf to enhance the menu interface (assumed to be user script).

### Description

The `script_launcher.sh` is a Bash script designed to facilitate the execution of various scripts located in a specified directory (`$SCRIPTS`) using `fzf` for an intuitive selection experience. The script allows users to preview associated documentation and source code for each script, making the execution process not just straightforward, but also informative.

When executed, the script utilizes the `fd` command to list all available scripts in the `$SCRIPTS` directory, formatting them appropriately for `fzf`. Users can select a script and see relevant documentation through `bat`, with different preview options depending on user input:

- Pressing **Enter** executes the chosen script.
- Pressing **Alt + e** opens the script in `nvim` for editing.
- Pressing **Alt + s** changes the preview to display the source code of the selected script.
- Pressing **Alt + d** toggles back to show the documentation.

This dynamic preview system enhances usability, allowing quick access to script usage and content.

### Usage

To run the `script_launcher.sh` script, simply invoke it from your terminal:

```bash
./script_launcher.sh
```

Make sure your `$SCRIPTS` directory is set up correctly in your environment.

Here is a quick summary of the key bindings within the fzf interface:

- **Enter**: Execute the selected script.
- **Alt + e**: Edit the selected script in `nvim`.
- **Alt + s**: Change the preview to the source of the script.
- **Alt + d**: Change the preview back to the documentation.

Feel free to adapt the script to include additional functionality or preferences as desired.

---

> [!TIP]  
> Consider adding error handling to the script for cases where no scripts are found or when `bat` is not installed. Utilizing `$EDITOR` as a variable for editing could also simplify the process if a different editor is preferred.