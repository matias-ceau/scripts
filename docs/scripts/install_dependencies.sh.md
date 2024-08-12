# Install Dependencies Script

---

**install_dependencies.sh**: Installs essential development and productivity tools on Arch Linux

---

### Dependencies

- `bash`: This script is written in Bash and requires it to be executed.
- `sudo`: Necessary for executing commands with superuser privileges.

### Description

The `install_dependencies.sh` script is a straightforward Bash script designed to automate the installation of various essential development and productivity tools on an Arch Linux system using the `pacman` package manager. This script includes popular utilities that can greatly enhance your development workflow and overall system functionality.

The following packages are installed by the script:

- `git`: A version control system to manage your code repositories.
- `fd`: A fast and user-friendly alternative to `find`.
- `bat`: A cat clone with syntax highlighting and Git integration.
- `fzf`: A general-purpose command-line fuzzy finder.
- `ripgrep`: A fast text searching tool that recursively searches your current directory.
- `neovim`: A modernized version of Vim influenced by extensibility and usability.
- `chezmoi`: A tool for managing your dotfiles easily.
- `dmenu`: A dynamic menu for X11 that displays a list of choices.
- `findutils`: A package providing tools like `find`, `locate`, and `updatedb`.
- `rofi`: A window switcher, application launcher, and dmenu replacement.
- `dunst`: A lightweight notification daemon.
- `python-pandas`: A powerful data analysis and manipulation library for Python.
- `python-colorama`: A library to colorize terminal text in Python applications.

### Usage

To use the script, simply execute it from the terminal. Make sure that you have the necessary permissions and `sudo` access:

```bash
bash install_dependencies.sh
```

Alternatively, if you find yourself often needing to install these dependencies, you can create a keybinding in your window manager (qtile) that executes the script:

```python
from libqtile.config import Key
from libqtile.command import lazy

keys = [
    Key(["mod4"], "d", lazy.spawn("bash /home/matias/.scripts/install_dependencies.sh")),
]
```

This allows you to install dependencies quickly with a simple key press.

---

> [!TIP]
> The script currently does not check if the packages are already installed before attempting to install them. Consider adding logic to verify the installation status of each package to avoid unnecessary operations or notify the user if any fail to install. This could be accomplished using conditional statements or by querying the package manager before installation.