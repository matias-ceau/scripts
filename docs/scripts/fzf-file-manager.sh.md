# Fuzzy File Manager with fzf

---

**fzf-file-manager.sh**: Interactive terminal-based file manager leveraging `fzf` and `eza` for rapid navigation.

---

### Dependencies

- `fzf` : Fuzzy finder for the terminal, provides search and selection UI.
- `eza` : Enhanced `ls` replacement, used for directory listings and preview formatting.
- `bat` : Syntax-highlighting cat clone, renders content previews.
- `rg` (ripgrep): Rapid grep tool, used for environment variable searching and file content matching.
- `pastel` : Command-line color manipulation tool, formats color for previews.
- `kitten icat` : For inline image previews in compatible terminals.
- `awk`, `sed`, `file` : Standard command-line tools for processing outputs.
- `notify-send` : Sends desktop notifications, used for debug/informational purposes.

---

### Description

This script implements a robust, interactive file manager for your terminal window manager (like qtile), utilizing a rich set of tools for both navigation and file previewing. The workflow pivots around the powerful fuzzy searching provided by `fzf`, which is deeply integrated with `eza`'s colorful and featureful directory listings. 

Key Features:
- **Directory Navigation**: Navigate up and down the directory tree using fuzzy search results, with support for both 'forward' and 'backward' movement via line selection.
- **File Preview**: Inline preview for:
  - Directories (tree with `eza`)
  - Text files (syntax highlighting with `bat`)
  - Image files (shown inline using `kitten icat` when supported)
  - File and directory metadata (via `file`, `eza_def`, and labels)
- **Custom Theming**: Color extraction from the environment (expecting `FLEXOKI*` variables) for fine-tuned appearance.
- **Interactive Controls**: Keybindings within `fzf` for toggling preview, changing prompt, jumping, directional navigation, and refreshing preview.
- **Continuous Navigation Loop**: Loops until an entry is selected or quit, updating the current directory based on selection logic.

---

### Usage

#### Run Directly in Terminal
```sh
bash ~/.scripts/bin/fzf-file-manager.sh
```

#### Assign to a Keybinding (qtile example)
Add to your `.config/qtile/config.py`:
```python
Key([mod], "e", lazy.spawn("bash ~/.scripts/bin/fzf-file-manager.sh")),
```

#### Key Interactions While Running
Within the `fzf` interface:
- `Alt+P`: Toggle preview window.
- `Alt+Space`: Execute a fresh preview of the selection.
- `Alt+H`: Toggle prompt label and reload listing (shows hidden files).
- Directional navigation is embedded based on the "forward" or "backward" lines in the file details.
- `Ctrl+H` / `Ctrl+L`: Move backward/forward in navigation.

**Note**: The script expects your terminal to support truecolor and the Kitty graphics protocol for image preview.

---

> [!WARNING]
> - The script is quite monolithic and complex; breaking functionality into smaller scripts (e.g., dedicated preview/render helpers) could improve readability and maintenance.
> - Error handling is minimal: if dependencies (like `kitten icat`) are missing, previews silently fail or produce odd behavior.
> - Certain features seem experimental or commented out, and some bindings are not fully documented—adding an in-script help display would enhance usability.
> - Assumes a specific environment with color variables set (`FLEXOKI*`), which could cause issues on other setups; fallback defaults or checks for these would improve portability.