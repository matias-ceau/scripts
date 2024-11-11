
# Script Launcher

---

**script_launcher.sh**: Launch and manage scripts using fzf with preview and execute options

---

### Dependencies

- `fzf`: A command-line fuzzy finder.
- `bat`: A cat clone with syntax highlighting.
- `fd`: A simple, fast, and user-friendly alternative to `find`.
- `ripgrep (rg)`: A line-oriented search tool that recursively searches directories for a regex pattern.
- `pastel`: A command-line tool to generate, analyze, convert and manipulate colors.
- `improved-fzfmenu.sh`: A customized fzf script for enhanced visual navigation.
- `nvim`: Neovim editor.
- Environment variables (`FLEXOKI_*` colors, `SCRIPTS` path).

### Description

This script, `script_launcher.sh`, is designed to help manage and execute scripts through an interactive menu powered by `fzf`. Depending on the arguments, it uses either `fzf` directly or an improved version through `improved-fzfmenu.sh`. It previews script documentation or the script source itself using `bat`. The displayed scripts are color-coded based on their file extensions, enhancing visibility (`.xsh`, `.py`, `.sh`, etc.). The script defines several keybindings for quick actions, such as executing a script directly, editing it in `nvim`, or switching between viewing the script's documentation and source.

### Usage

The script should be executed from the terminal. Keybindings provided within `fzf` allow different actions, such as:

- **Execute a script**: Press `Enter`.
- **Edit script in Neovim**: `Ctrl-e`.
- **Open in a new terminal for editing**: `Alt-e`.
- **View documentation/source**: Toggle with `Alt-s` and `Alt-d`.
  
```bash
# To run the script launcher
bash script_launcher.sh

# To run with the embedded fzf
bash script_launcher.sh --embedded
```

---

> [!TIP] While feature-rich, the script can benefit from a graphical or textual guide during its use to enhance user understanding of its capabilities, especially for new users. Also, consider documenting or automating the setup for necessary environment variables such as `$FLEXOKI_*` colors and `$SCRIPTS`.