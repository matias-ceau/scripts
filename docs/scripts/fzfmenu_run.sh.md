# Dmenu Replacement with FZF (fzfmenu_run.sh)

---

A script to replace dmenu with fzf for launching applications in a floating terminal.

---

### Table of contents

- [Dependencies](#dependencies)
- [Description](#description)
    - [Overview](#overview)
    - [Usage](#usage)
    - [Examples](#examples)
- [Notes](#notes)

---

<a name="dependencies" />

### Dependencies

- `fzf`: A command-line fuzzy finder.
- `dmenu`: A dynamic menu for X.
- `st`: Simple terminal for X, ensuring it supports floating windows.

<a name="description" />

### Description

<a name="overview" />

#### Overview

This script serves as a lightweight replacement for the popular `dmenu` application launcher, leveraging `fzf` (Fuzzy Finder) to provide a more interactive and visually pleasing way to run commands. When executed, it utilizes the standard `dmenu_path` command to fetch all available applications and pipes this list into `fzfmenu.sh`. The choice made in the `fzf` interface is then passed to a new `st` (simple terminal) instance to run the selected command.

The construction of this script is straightforward:
- It bridges three components: `dmenu_path`, `fzfmenu.sh`, and `xargs`.
- It allows for seamless integration within a window manager like `qtile` by handling application launches within a floating terminal instance.

---

<a name="usage" />

#### Usage

To use this script:
1. Ensure the script has executable permissions. You can run:
   ```bash
   chmod +x /home/matias/.scripts/fzfmenu_run.sh
   ```
2. Execute the script directly from a terminal or link it to a keybinding in your window manager’s configuration:
   ```bash
   /home/matias/.scripts/fzfmenu_run.sh
   ```

This will trigger the fzf interface allowing you to search and select applications dynamically.

<a name="examples" />

#### Examples

- Open the application launcher:
  ```bash
  /home/matias/.scripts/fzfmenu_run.sh
  ```

- Bind to a key combination in `qtile` (e.g., `mod + r`):
  ```python
  Key([mod], "r", lazy.spawn("/home/matias/.scripts/fzfmenu_run.sh")),
  ```

---

<a name="notes" />

### Notes

- Ensure your `fzf` is properly installed and configured on your Arch Linux system.
- The floating terminal effect relies on using `st`, which must be installed and configured to support floating windows.
- You may want to customize the appearance of `fzf` and `st` further depending on your aesthetic or usability preferences.

> **Critique:** 
> 
> The script is minimalistic and effectively performs its intended function. However, enhancements could be made such as error handling for cases when no applications are available or if `st` is not installed. Additional parameters for customizing the `fzf` interface (like changing colors or options) could also be implemented for greater user flexibility.