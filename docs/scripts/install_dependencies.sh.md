# Install Dependencies Script

---

**install_dependencies.sh**: A script to install necessary packages on Arch Linux using paru.

---

### Dependencies

- `paru`: An AUR helper that simplifies the process of installing packages from the Arch User Repository.

### Description

This script automates the installation of commonly used packages for Arch Linux users, particularly beneficial for those using the QTile window manager. Instead of manually installing each package, this script utilizes `paru`, a popular AUR helper, to install multiple packages efficiently in one go.

The script defines a here-document that lists the packages to be installed. The packages included are:

- `git`: A version control system for tracking changes in source code.
- `fd`: A simple, fast, and user-friendly alternative to `find`.
- `bat`: A cat(1) clone with syntax highlighting and Git integration.
- `fzf`: A command-line fuzzy finder.
- `ripgrep`: A line-oriented search tool that recursively searches your current directory for a regex pattern.
- `neovim`: An extensible Vim-based text editor.
- `chezmoi`: A tool for managing your dotfiles.
- `dmenu`: A dynamic menu for X.
- `findutils`: Utilities for finding files in a directory hierarchy.
- `rofi`: A window switcher, application launcher, and dmenu replacement.
- `dunst`: A lightweight notification daemon.
- `python-pandas`: A data manipulation and analysis library for Python.
- `python-colorama`: A library to help add color to output in terminal.
- `light`: A lightweight command-line interface to control backlight.
- `xdotool`: A tool for simulating keyboard input and mouse activity.

### Usage

To utilize the script, simply run it in the terminal:

```bash
bash /home/matias/.scripts/install_dependencies.sh
```

This command will execute the script and install all the listed dependencies at once. Ensure that you have `paru` installed prior to running the script, as it depends on it.

---

> [!TIP]  
> Consider adding a feature to check if each package is already installed before attempting to install it. This could save time and avoid unnecessary processing when the script is run multiple times. Additionally, including error handling to provide feedback if a package fails to install could improve user experience.