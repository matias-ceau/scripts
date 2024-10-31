# Pacman Fuzzy Search Script

---

**pacman-fuzzy-search.sh**: A script for enhanced fuzzy searching of Arch Linux packages using `paru` and `fzf`.

---

### Dependencies

- `paru`: An AUR helper designed to work seamlessly with pacman, used for performing package queries.
- `rg` (ripgrep): A fast search tool used for string pattern matching within the script.
- `bat`: A cat clone with syntax highlighting and Git integration.
- `fzf`: A general-purpose command-line fuzzy finder to enhance user interaction with search results.
- `notify-send`: A utility to send notifications from the script to the Arch Linux desktop environment.

### Description

This script is designed for Arch Linux users who want an interactive, fuzzy search experience for managing packages. It employs `fzf` for rendering a refined user interface with preview capabilities. The searching mechanism is based on `paru`, providing a mix of official repository and AUR package details.

**Functions and Utilities**:
- **preview_cmd**: Constructs a preview of package details using `paru` with formatting and styling by `bat`.
- **paruSl**: Customizes the package list display with colors and removes 'unknown-version' anomalies.
- **search_cmd**: Utilizes regex to filter packages based on repository or installation status, enhancing relevancy.
- **fzf_cmd**: Invokes `fzf` for user interaction with multiple binding options for resizing windows or changing modes.

### Usage

To execute the script, run it from the terminal. You can integrate this script with a hotkey using a window manager like qtile or execute it manually:

```bash
bash /home/matias/.scripts/bin/pacman-fuzzy-search.sh
```

Keyboard shortcuts within `fzf`:
- `Alt-w`: Modifies the preview window.
- `Enter`: Installs the selected package with `paru`.
- `Ctrl-r`: Reloads search results.
- `Ctrl-s`: Refines the search term.
- `Alt-m`, `Alt-p`, `Alt-o`, `Alt-c`: Toggles modes and sorting preferences for package searching.

The script can also be run periodically in the background to keep package data up to date within a specified cache directory located at `$HOME/.cache/pacman-fuzzy-search`.

---

> [!IMPORTANT]
> While the script is powerful, it assumes the presence of specific utilities (`paru`, `rg`, `bat`, `fzf`, etc.). Ensure these are installed for the script to function correctly. Additionally, environment-specific behavior like the use of `notify-send` for notifications might not work outside of a desktop environment session.