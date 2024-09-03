# Install Dependencies Script

---

**install_dependencies.sh**: Script to install essential packages on Arch Linux using pacman.

---

### Dependencies

- `sudo`: Used to run commands as a superuser.
- `pacman`: The package manager for Arch Linux, required to install software packages.

### Description

This script is a simple yet effective Bash script designed for users of Arch Linux. It streamlines the process of installing several essential packages by utilizing the `pacman` package manager. 

The script does the following:

1. Runs `sudo pacman -S` to initiate the installation.
2. Lists multiple packages to install, which include:
   - `git`: A version control system for tracking changes in source code.
   - `fd`: A fast and user-friendly alternative to `find`.
   - `bat`: A cat alternative that includes syntax highlighting and Git integration.
   - `fzf`: A general-purpose command-line fuzzy finder.
   - `ripgrep`: A line-oriented search tool that recursively searches your current directory for a regex pattern.
   - `neovim`: An extension of the popular text editor Vim, which adds features that enhance usability.
   - `chezmoi`: A tool to manage your dotfiles.
   - `dmenu`: A dynamic menu for X11.
   - `findutils`: A collection of utilities for locating files.
   - `rofi`: A window switcher, application launcher, and dmenu replacement.
   - `dunst`: A lightweight and customizable notification daemon.
   - `python-pandas`: A powerful data analysis and manipulation library for Python.
   - `python-colorama`: A library that makes terminal text colored and styled.

### Usage

To use the script, follow these steps:

1. Ensure the script is executable:
   ```bash
   chmod +x /home/matias/.scripts/install_dependencies.sh
   ```
2. Execute the script in the terminal:
   ```bash
   /home/matias/.scripts/install_dependencies.sh
   ```

**Note:** You will be prompted for your sudo password during execution to allow installation of the specified packages.

---

> [!TIP]  
> Consider enhancing script functionality by including package checks before installation. This would prevent unnecessary installation if packages are already present on the system. Additionally, it could be useful to include options for removing packages or updating them, making the script more versatile.