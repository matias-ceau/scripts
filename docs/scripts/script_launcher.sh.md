# Script Launcher

---

**script_launcher.sh**: Launch scripts with fzf and provides rich previews 

---

### Dependencies

- `fzf`: A command-line fuzzy finder used for searching and filtering through available scripts. 
- `bat`: A cat clone with syntax highlighting and Git integration, used for previewing files.
- `improved-fzfmenu.sh`: A custom menu that enhances the capabilities of `fzf`.

### Description

This script provides an interactive launcher for executing various user-defined scripts using `fzf`. It leverages `bat` to provide detailed previews of text files such as documentation and source scripts, enhancing the user experience.

The script begins by defining parameters for the preview commands, customizing outputs based on the structure of your scripts. It allows users to preview documentation in markdown format or source code, depending on their selection:

- `preview_cmd_docs`: Prepares a `bat` command to display documentation for the selected script.
- `preview_cmd_source`: Prepares a `bat` command to show the source code of the selected script.

The script also includes ANSI color codes for styling the menu header, making it visually appealing. The main part of the script utilizes `fd`, a simple, fast, and user-friendly alternative to `find`, to list available scripts in the `$SCRIPTS` directory. 

The built `fzf` menu offers various bindings, such as:
- Pressing `Enter` to execute the selected script.
- `Alt+Enter` to run the script in a terminal.
- `Ctrl+E` to edit the selected script with `nvim`.

### Usage

To run the script, ensure that you have the appropriate dependencies installed:

```bash
bash ~/path/to/script_launcher.sh
```

You can customize key bindings or functionalities by editing the script directly, accommodating your workflow better.

#### Example Command:

```bash
bash ~/scripts/script_launcher.sh
```
- This command launches the script selection menu where users can navigate through available scripts and utilize the various bindings mentioned above.

---

> [!TIP] 
> The script provides a comprehensive solution, but it has some areas for improvement. For example, adding options to render documentation in PDF/HTML format could enhance usability. Implementing additional features like multi-selection could streamline workflows by allowing batch processing of scripts. Consider implementing user-friendly error handling for better runtime resilience and experience.