# Script Launcher with FZF Integration

---

**script_launcher.sh**: Launch and manage scripts via an interactive fzf interface, with source and documentation preview capabilities.

---

### Dependencies

- `fzf`: Command-line fuzzy finder for interactive script selection.
- `improved-fzfmenu.sh`: Custom script wrapper for fzf with title integration.
- `bat`: A cat clone with syntax highlighting and Git integration.
- `pastel`: Utility for color manipulation in scripts.
- `fd`: A simple, fast, and user-friendly alternative to 'find'.
- `rg` (ripgrep): Line-oriented search tool for filtering file types.
- `nvim` (Neovim): Hyperextensible Vim-based text editor.

### Description

The `script_launcher.sh` script is designed to help users on Arch Linux with qtile interactively run various scripts located in their `$SCRIPTS` directory. It leverages `fzf` for displaying and selecting the scripts, along with `bat` for previewing documentation and source code with syntax highlighting.

Two styles of FZF commands are supported, determined by the presence of the `--embedded` flag. If `--embedded` is used, only `fzf` is called; otherwise, it uses `improved-fzfmenu.sh`.

The script offers enhanced preview features through `bat` for both documentation and source code, utilizing dynamically assigned color variables for a visually appealing interface. Highlighting and filtering of scripts are enhanced by leveraging `rg` to classify script types by extensions—such as `.sh`, `.py`, and `.xsh`.

### Usage

Run the script from the terminal using the following command:

```bash
bash /path/to/script_launcher.sh [--embedded]
```

- With `--embedded`: Uses standard `fzf` command.
- Without `--embedded`: Uses the custom `improved-fzfmenu.sh`.

### Keybindings within FZF

- **Enter**: Run the selected script.
- **Alt-Enter**: Execute script in a new terminal.
- **Ctrl-E**: Edit the selected script in `nvim`.
- **Alt-E**: Edit script in a new terminal using `nvim`.
- **Alt-S**: Switch preview to source code.
- **Alt-D**: Switch back to documentation.

---

> [!NOTE]
> Consider adding support for generating PDFs/HTMLs of documentations and implementing new features such as multiple selections, enhanced header toggling, and additional argument functionalities in the fzf commands.