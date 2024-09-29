# Install Dependencies Script

---

**install_dependencies.sh**: A script to automatically install essential dependencies on Arch Linux.

---

### Dependencies

- `paru`: An AUR helper that simplifies the process of installing packages from the Arch User Repository (AUR).

### Description

This script automates the installation of a set of essential packages commonly used in an Arch Linux environment. The script utilizes `paru`, an AUR helper, to manage package installations in a streamlined manner.

The list of packages to be installed is defined in a here-document (EOF). The following tools and utilities are included:

- `git`: A version control system for tracking changes in source code.
- `fd`: A simple and fast alternative to `find`.
- `bat`: A modern cat clone with syntax highlighting and Git integration.
- `fzf`: A general-purpose command-line fuzzy finder.
- `ripgrep`: A line-oriented search tool that recursively searches your current directory.
- `neovim`: An extensible and open-source text editor.
- `chezmoi`: A tool for managing your dotfiles across multiple machines.
- `dmenu`: A dynamic menu for X, useful for launching applications.
- `findutils`: Utilities for finding files.
- `rofi`: A window switcher, application launcher, and more.
- `dunst`: A lightweight notification daemon.
- `python-pandas`: A powerful data analysis and manipulation library for Python.
- `python-colorama`: A library for cross-platform colored terminal text in Python.
- `light`: A lightweight, easy-to-use command-line utility for managing backlight brightness.
- `xdotool`: A tool to simulate keyboard input and mouse activity.

### Usage

To use this script, make sure it has executable permissions:

```bash
chmod +x /home/matias/.scripts/install_dependencies.sh
```

You can then execute the script in your terminal by running:

```bash
/home/matias/.scripts/install_dependencies.sh
```

This will trigger an installation process for all listed packages. It's designed to run non-interactively, automatically installing packages as per the defined list.

---

> [!TIP] 
> Consider adding error handling to the script to catch any issues that may arise during installations. For example, wrapping the `paru` command in a check to verify its success would provide a clearer understanding of any failures. Additionally, allow the user to customize the package list (e.g., through command-line arguments) for greater flexibility.