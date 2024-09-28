# Package Installer Script

---

**install_dependencies.sh**: Automated script to install a list of necessary packages using `paru`.

---

### Dependencies

- `paru`: An AUR helper for Arch Linux. This script relies on `paru` to install packages, so ensure it is installed and configured on your system.

### Description

This script automates the installation of a predefined list of packages required for your Arch Linux environment set up on qtile. It utilizes the `paru` package manager with the `--needed` flag to install packages only if they are not already present. The packages are specified between a `cat` and `EOF` block, which is a convenient Bash technique for providing input through a here-document. Here is the list of packages:

- `git`: Version control system.
- `fd`: A simple, fast and user-friendly alternative to `find`.
- `bat`: A `cat` clone with syntax highlighting and Git integration.
- `fzf`: A command-line fuzzy finder.
- `ripgrep`: A line-oriented search tool that recursively searches your directory for a regex pattern.
- `neovim`: A hyperextensible Vim-based text editor.
- `chezmoi`: A manager for your dotfiles.
- `dmenu`: A fast and minimal dynamic menu.
- `findutils`: Collection of tools to fine-tune searches.
- `rofi`: A window switcher, application launcher, and dmenu replacement.
- `dunst`: Lightweight and customizable notification daemon.
- `python-pandas`: Data analysis library for Python.
- `python-colorama`: Conveniently handles colored terminal text in Python.
- `light`: Display backlight control.
- `xdotool`: Simulate keyboard input and mouse activity.

### Usage

To use the script, simply run it from the terminal. Make sure you have execution permissions with `chmod +x install_dependencies.sh` if necessary.

```bash
./install_dependencies.sh
```

This script is designed to be run interactively in your terminal. Alternatively, it can be integrated into automated scripts or system setup routines.

---

> [!TIP]  
> The use of `paru` is efficient, but ensure that the user running the script has the necessary permissions and that `paru` is correctly configured. Additionally, consider checking for existing installations before populating the list to avoid redundant or conflicting installations. This can optimize the script's execution and ensure smoother package management.
