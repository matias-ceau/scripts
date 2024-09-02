# Script Launcher

---

**script_launcher.sh**: Launch scripts with fzf and provides documentation previews.

---

### Dependencies

- `fzf`: A command-line fuzzy finder, which enables easier navigation and selection.
- `bat`: A cat clone with syntax highlighting and Git integration, used here for previewing documentation and source files.
- `fd`: A simple, fast, and user-friendly alternative to `find`, utilized for searching scripts in the specified directory.
- `improved-fzfmenu.sh`: A custom script that enhances the `fzf` interface and user interaction.

### Description

The `script_launcher.sh` script allows users to browse through a collection of scripts located in a specified directory using `fzf`. It provides a convenient searching mechanism with previews of documentation and script sources.

When initiated, this script prepares a presentation layer where:
- Users can view documentation associated with the scripts through `bat`, using a beautifully formatted and colorized display.
- Custom bindings facilitate quick actions, such as executing the scripts directly, editing them, and switching context between viewing documentation and source code.

The header adds clarity by using color formatting to distinguish between different options available to the user. The primary functionalities are driven by options in `fzf`, enabling quick navigation through scripts with powerful previewing capabilities.

### Usage

To run the script, execute the following command in your terminal:

```bash
bash /home/matias/.scripts/script_launcher.sh
```

Once running:
- Use the arrow keys to navigate through your scripts.
- Press `Enter` to execute the selected script.
- Press `Alt+Enter` to run the script in a terminal window.
- Press `Ctrl+E` to edit the selected script with `nvim`.
- Use `Alt+E` for editing in a new terminal window.
- Press `Alt+D` and `Alt+S` to toggle between source preview and documentation.

**Examples:**

- To launch the script and start searching scripts:

```bash
bash /home/matias/.scripts/script_launcher.sh
```

---

> [!TIP]  
> The script currently lacks features such as multi-selection for executing multiple scripts or advanced preview controls. Implementing these enhancements could significantly improve user experience. Additionally, consider handling cases where dependencies are missing or prompting users about the installation of required packages for smoother functionality.