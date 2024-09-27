# Install Dependencies Script

---

**install_dependencies.sh**: A script to install a predefined list of dependencies using paru.

---

### Dependencies

- `paru`: An AUR helper required to install packages from the Arch User Repository (AUR).

### Description

This script automates the installation of essential utilities and tools by leveraging `paru`, a popular AUR helper in the Arch Linux community. The script contains a list of packages that are commonly used and enhances productivity for users, particularly those using a tiling window manager like Qtile.

The script utilizes a here-document to provide the list of packages to `paru`, which allows for a batch installation process. The `--needed` flag prevents reinstallation of already installed packages. The complete list of dependencies includes:

- `git`: Version control system
- `fd`: A simple, fast and user-friendly alternative to `find`
- `bat`: A `cat` clone with syntax highlighting and Git integration
- `fzf`: A command-line fuzzy finder
- `ripgrep`: A line-oriented search tool that recursively searches your current directory
- `neovim`: A hyperextensible Vim-based text editor
- `chezmoi`: A tool for managing your dotfiles
- `dmenu`: A dynamic menu for X11
- `findutils`: Basic utilities for finding files
- `rofi`: A window switcher, application launcher, and ssh launcher
- `dunst`: A custom notification daemon
- `python-pandas`: A fast, powerful, flexible, and easy-to-use open-source data analysis and manipulation tool
- `python-colorama`: A library to make ANSI escape character sequences easier to use under Windows
- `light`: A command-line interface for controlling backlight brightness
- `xdotool`: A tool that simulates keyboard input and mouse activity

### Usage

To utilize this script, ensure it is executable and run it from the terminal. You can make it executable with the following command:

```bash
chmod +x /home/matias/.scripts/install_dependencies.sh
```

Execute the script by running:

```bash
/home/matias/.scripts/install_dependencies.sh
```

This command will initiate the installation process for all specified packages. If you wish to integrate this script with your custom workflow in Qtile, you could bind it to a key combination, allowing for quick access to setup or maintenance tasks.

---

> [!TIP]  
> While this script is efficient for installing a predefined workload, consider enhancing its flexibility by allowing users to pass additional arguments or specifying which packages to install. Adding error handling could also improve robustness against installation failures (e.g., if a package is already installed or not found).