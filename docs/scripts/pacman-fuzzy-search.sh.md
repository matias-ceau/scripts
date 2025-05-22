# Pacman Fuzzy Search Script

---

**pacman-fuzzy-search.sh**: Fuzzy search and install Arch Linux packages (repo/AUR) using paru and fzf

---

### Dependencies

- `paru`: AUR helper to query and install repo and AUR packages.
- `fzf`: Command-line fuzzy finder for interactive search.
- `bat`: Colorful `cat` clone with syntax highlighting (used for pretty previews).
- `ripgrep` (`rg`): Fast grep replacement, used for filtering results.
- `notify-send`: Used to send desktop notifications.
- `sed`: Stream editor for text processing (standard on most systems).

_Ensure all dependencies are installed, preferably via pacman/AUR. Script assumes a Unix-like environment (Arch Linux), and is suitable for usage with qtile WM and interactive keybindings._

---

### Description

This script enables an advanced fuzzy search for available and installed packages (including AUR) using `paru` as the package interface and `fzf` for selection. It sets up a persistent cache directory, leverages ripgrep for filtering, and bat for syntax-highlighted previews.

**Key Features:**
- **Preview Pane**: Shows detailed package info (`paru -Si` or `paru -Qi`) in a colored panel powered by `bat`.
- **Interactive Search**: Lets you type to search across packages. Results can be filtered between AUR, repo, or installed packages.
- **Multi-select & Install**: Select multiple packages to install at once.
- **Dynamic Reloading**: Under the hood, supports reloads and border label changes (partially implemented, see commented code).
- **Keybind Support**: Suitable for mapping to a key in your qtile config for quick popup access.

#### Functions:
- `preview_cmd`: Displays package details for the selected line in `fzf` using `paru` and formats them for easier reading.
- `paruSl`: Lists all available packages (`paru -Sl`) with some visual tweaks.
- `search_cmd`: Intended to filter results based on togglable "repo" and "installed" modes (partially implemented; see commented logic for future improvements).
- `fzf_cmd`: Runs `fzf` with several custom keybinds and options for a rich TUI search/selection experience.

---

### Usage

#### Run Directly

```
~/.scripts/bin/pacman-fuzzy-search.sh
```

- Use arrow keys to browse.
- Type to search.
- Space or tab to select multiple packages.
- Press `Enter` to install selected packages (via `paru -S`).

#### Assign to qtile Keybinding

Edit your `~/.config/qtile/config.py`:

```python
Key([mod], "F12", lazy.spawn("~/.scripts/bin/pacman-fuzzy-search.sh"))
```

#### Example - TLDR

```
# Launch fuzzy search for packages
~/.scripts/bin/pacman-fuzzy-search.sh
```

---

> [!NOTE]
> While the script is robust and provides a friendly package search/install workflow, the advanced mode switching (filtering to only AUR, only installed, etc.) is incomplete—referenced via commented code in both functions and keybinding setups. Additionally, customization of border labels and dynamic reloading of results can be enhanced by finishing the commented-out logic.
> 
> The use of `bat` for previewing is visually appealing but may appear cluttered for very long package descriptions. Consider adding more intuitive filtering UI or more keybinds for filtering for a future version.