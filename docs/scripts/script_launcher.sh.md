# Script Launcher for Qtile

---

**script_launcher.sh**: Simple script launcher utilizing fzf for enhanced command execution.

---

### Dependencies

- `fzf`: Command-line fuzzy finder used for efficient file searching and selection.
- `bat`: A cat clone with syntax highlighting and Git integration, used for previewing files and documentation.
- `pastel`: A tool for manipulating colors in shell scripts.

### Description

The `script_launcher.sh` script allows users to execute scripts efficiently using the `fzf` fuzzy finder. It provides an intuitive interface with previews of documentation and source files while allowing users to execute selected commands easily. 

Upon running, it checks if the `--embedded` flag is given. If not, it uses a custom fzf script `improved-fzfmenu.sh` with a specified title. Two preview commands are defined for showing either documentation or the source of scripts selected by the user. The `hex2ansi` function converts hex colors into ANSI format for better terminal visuals.

The script reads directories and formats the output with different colors based on the file types (e.g., Python, shell scripts). It leverages the `fd` command to find scripts in the `$SCRIPTS` directory and presents them in an interactive `fzf` interface with customizable key bindings for executing the selected commands.

### Usage

To use the script, simply execute it from the terminal. You can pass the `--embedded` flag to run `fzf` directly. Consider the following command examples:

```bash
bash /home/matias/.scripts/script_launcher.sh
```

Or in embedded mode:

```bash
bash /home/matias/.scripts/script_launcher.sh --embedded
```

With `fzf`, you can:
- Press **Enter** to run the selected script.
- Press **Alt + Enter** to execute the script in a dedicated terminal.
- Use **Ctrl + E** to edit the script in `nvim`.
- Press **Alt + E** to edit the script in a new terminal instance.
- Utilize **Alt + D** or **Alt + S** to switch between documentation and source previews.

---

> [!TIP]  
> This script has several opportunities for improvement, such as adding support for rendering a PDF or HTML documentation page as indicated by the TODO comments. You might also consider integrating features for multiple selections and improved preview handling with page up/down functionality.