# Script Launcher

---

**script_launcher.sh**: A script to launch other scripts with fzf and documentation previews.

---

### Dependencies

- `fzf`: A command-line fuzzy finder to help select scripts visually.
- `bat`: A modern alternative to `cat` for displaying files with syntax highlighting.
- `fd`: A simple, fast, and user-friendly alternative to `find`.
- `improved-fzfmenu.sh`: A custom script to enhance fzf functionality.

### Description

The `script_launcher.sh` script allows users to run various scripts stored in a designated directory using a fuzzy finder interface provided by `fzf`. This script enhances the user experience by providing previews of either documentation or source code.

Key features include:

- **Previewing**: The script uses `bat` for displaying the contents of script files in a user-friendly format. Depending on the user's selection, the documentation (`*.md` files) or source code can be previewed.
  
- **Dynamic Keybindings**: Users can utilize various keybindings to perform different actions:
  - **Enter**: Run the selected script.
  - **Alt + Enter**: Execute the script in a new terminal.
  - **Alt + E**: Open the source of the script in `nvim`.
  - **Alt + S**: Change the preview to the script's source.
  - **Alt + D**: Switch back to the documentation preview.
  
By leveraging `fd`, the script dynamically builds a list of scripts from a specified `$SCRIPTS` directory. 

### Usage

To use this script:

1. Ensure your scripts are located in the directory specified by the `$SCRIPTS` environment variable.
2. Run the script from your terminal:

```bash
bash /home/matias/.scripts/script_launcher.sh
```

3. Navigate through the list of scripts using arrow keys.
4. Use the defined keybindings for actions:
   - Press `Enter` to run the selected script.
   - Press `Alt + Enter` to open it in a new terminal.
   - Press `Alt + E` to edit the script.
   - Use `Alt + S` and `Alt + D` to toggle between documentation and source previews.

Make sure to have the required dependencies installed for optimal functionality.

---

> [!TIP] 
> The script currently lacks a feature to render documentation in PDF or HTML format, which could enhance usability for users who prefer reading documentation in those formats. Implementing such a feature could greatly improve the value of the script. Additionally, handle cases where the `$SCRIPTS` directory is empty or contains no valid script files for better user feedback.