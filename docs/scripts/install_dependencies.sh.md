# Install Dependencies Script

---

**install_dependencies.sh**: Installs a list of necessary packages using `paru`

---

### Dependencies

- `paru`: AUR helper used for installing packages on Arch Linux. `paru` is required for this script as it automates package installation from the Arch User Repository (AUR).

### Description

This script automates the installation of several useful packages for development and daily operations. It uses `paru`, an AUR helper, to install packages if they are not already present on the system. The packages are listed in a here document, which allows for easy readability and maintenance.

Packages included:
- `git`: Version control system
- `fd`: Simple, fast, and user-friendly alternative to `find`
- `bat`: Clone of `cat` with syntax highlighting and Git integration
- `fzf`: Command-line fuzzy finder
- `ripgrep`: Fast search tool written in Rust 
- `neovim`: Hyperextensible Vim-based text editor
- `chezmoi`: Manage your dotfiles across multiple diverse machines
- `dmenu`: Dynamic menu for X
- `findutils`: Tools for finding files and searching within them
- `rofi`: A window switcher, run dialog, and dmenu replacement
- `dunst`: Customizable and lightweight notification daemon
- `python-pandas`: Data analysis library for Python
- `python-colorama`: Simple cross-platform colored terminal text in Python
- `light`: Program to control backlight controllers
- `xdotool`: Command-line X11 automation tool

### Usage

To execute the script, simply run it in a terminal session. You can run this script directly by navigating to its directory and executing:

```bash
bash install_dependencies.sh
```

Alternatively, integrate it as part of your system setup routine or run it whenever you configure a new system.

---

> [!TIP]
> Consider adding error handling to the script to manage cases where `paru` is not installed or if any of the package installations fail. Additionally, integrating a confirmation step before beginning the installation could help prevent unintended package installations. Defining variables for the executables rather than embedding commands directly improves maintainability.