# Dependency Installer Script 

---

**install_dependencies.sh**: Automatically installs a set of required packages on Arch Linux.

---

### Dependencies

- `paru`: A community-driven package manager for Arch Linux that simplifies the installation of packages from the Arch User Repository (AUR).

### Description

The `install_dependencies.sh` script is a Bash script designed for Arch Linux users to streamline the process of installing essential packages. By leveraging the `paru` package manager, this script allows developers and users to easily install multiple packages from both the official repositories and the AUR in a single command.

The script defines a list of packages within a here-document, which is then passed to the `paru` command. The `--needed` flag ensures that only missing packages are installed, thereby avoiding unnecessary reinstallation of already installed software.

The packages included in this script are:

- **git**: Version control system for tracking changes.
- **fd**: A simple, fast and user-friendly alternative to `find`.
- **bat**: Command-line tool that provides syntax highlighting for files, similar to `cat`.
- **fzf**: A command-line fuzzy finder.
- **ripgrep**: A line-oriented search tool that recursively searches your current directory.
- **neovim**: An extensible Vim-based text editor.
- **chezmoi**: A tool to manage your dotfiles across multiple machines.
- **dmenu**: A dynamic menu for X.
- **findutils**: The GNU utilities to search for files in the filesystem.
- **rofi**: A window switcher, application launcher, and dmenu replacement.
- **dunst**: A lightweight and customizable notification daemon.
- **python-pandas**: A powerful data analysis and manipulation library for Python.
- **python-colorama**: A library to colorize terminal text in Python.
- **light**: A tool for controlling backlight brightness.
- **xdotool**: A utility that simulates keyboard input and mouse activity.

### Usage

To run this script, simply execute it in your terminal. Ensure that you have the necessary permissions to execute it. You can use the command:

```bash
bash /home/matias/.scripts/install_dependencies.sh
```

Alternatively, you can make it executable and run it directly:

```bash
chmod +x /home/matias/.scripts/install_dependencies.sh
/home/matias/.scripts/install_dependencies.sh
```

This will install all of the packages listed in the script if they are not already installed on your system.

---

> [!TIP]
This script could include error handling to ensure that any problems in the installation process are captured. Consider adding checks to verify if `paru` is installed before attempting to install the packages. Additionally, integrating a way to log the output of the install process could enhance the usability and troubleshooting experience.