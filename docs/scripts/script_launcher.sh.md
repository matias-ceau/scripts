# Script Launcher

---

**script_launcher.sh**: Run scripts with fzf for enhanced usability

---

### Dependencies

- `fzf`: A command-line fuzzy finder used to navigate and filter scripts.
- `bat`: A cat clone with syntax highlighting and Git integration, used to preview files.
- `fd`: A simple, fast and user-friendly alternative to `find`, utilized to locate scripts.
- `improved-fzfmenu.sh`: A custom script for enhanced fzf integration, required for the menu.

### Description

The `script_launcher.sh` is a versatile Bash script designed to streamline the execution of other scripts using `fzf`, a command-line fuzzy finder. This script enhances user interaction by presenting a visually pleasing selection interface, allowing users to preview documentation or source files associated with each script.

The script employs the following key components:

- **Preview Commands**: It utilizes `bat` to preview both documentation and source code. This gives users immediate context about what each script does.
  
- **Custom Color Scheme**: ANSI escape codes are used to set the colors for the headers, improving readability and aesthetics.

- **Key Bindings**: Various key bindings are configured for different actions:
  - **Enter**: Execute the selected script in the current terminal.
  - **Alt+Enter**: Execute the script in a separate terminal.
  - **Ctrl+E**: Open the script in `nvim` for editing.
  - **Alt+E**: Open `nvim` in a new terminal for editing.

The script also includes elements for user customization, aiming for an interactive experience with features such as changing previews and toggling between documentation and source views.

### Usage

To use the script, simply execute it in your terminal:

```bash
bash /home/matias/.scripts/script_launcher.sh
```

### Key Bindings Available:
- **Enter**: Execute the selected script.
- **Alt+Enter**: Run the script in a new terminal.
- **Ctrl+E**: Edit the selected script with `nvim`.
- **Alt+E**: Edit in a new terminal window.
- **Alt+S**: View the source of the selected script.
- **Alt+D**: View the documentation of the selected script.

---

> [!TIP]  
> Consider implementing missing features such as rendering documentation as PDF or HTML, enabling page up and down for preview navigation, and allowing multiple script selections. Additionally, refining the header customization could enhance the script’s adaptability and user experience. Implementing a logger function for better tracking of user interactions could also be beneficial.