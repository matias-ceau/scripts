# Pacman Fuzzy Search Script

---

**pacman-fuzzy-search.sh**: A script to perform a fuzzy search on packages using `paru` with a preview feature.

---

### Dependencies

- `paru`: An AUR helper and pacman wrapper that facilitates package management in Arch Linux. It is required for querying package information.
- `fzf`: A general-purpose command-line fuzzy finder used to provide a searchable interface for package selection.
- `bat`: A `cat` clone with syntax highlighting and Git integration, used here to display package information in a more readable format.
- `ripgrep` (`rg`): A line-oriented search tool that recursively searches your current directory for a regex pattern, employed to check for installed packages in this script.

### Description

This script allows you to perform a fuzzy search on Arch Linux packages using `paru` and `fzf`. It features a detailed preview of each package's information (description, installed status, and more) in the `fzf` interface. It uses a custom shell function `preview_cmd` which processes the output of the `paru` query using several `sed` commands to format the package data, then displays it using `bat` for enhanced readability.

The `preview_cmd` function decides whether to run `paru` with the `-Si` (search installed) or `-Qi` (query info) flag depending on whether the package is installed, as indicated by the presence of `[installed]` in the package information.

### Usage

To use this script, execute it from the terminal. It initiates a `paru` package search and utilizes `fzf` to allow interactive fuzzy searching:

```bash
bash /home/matias/.scripts/pacman-fuzzy-search.sh
```

- You can type in a search query during the `fzf` session to filter packages.
- The preview window, designed with `bat`, will show package information dynamically as you navigate the package list.

This script can be added to a keybinding in your window manager (like qtile) for quick access to package searching.

---

> [!TIP] Consider replacing `sed` with `awk` for more complex parsing needs, as it may provide more flexibility. Additionally, specifying the required version of `paru`, `bat`, and `fzf`, or handling their absence more gracefully (with clear error messages) could improve user experience.