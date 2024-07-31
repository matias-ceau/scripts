# Edit Chezmoi Configuration Files (edit_chezmoi_cfg_files.sh)

---

Launches an interactive file selector to edit Chezmoi-managed configuration.

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

- `chezmoi` - for managing dotfiles.
- `fzf` - for fuzzy file selection.
- `bat` - for syntax highlighting and file viewing in the preview.
- `eza` - a modern replacement for `ls`, providing improved listing with icons.

<a name="description" />

### Description

<a name="overview" />

#### Overview

This script is designed to facilitate the editing of files managed by Chezmoi, a popular dotfile management tool. It utilizes `fzf`, a command-line fuzzy finder, to allow users to select configuration files or directories interactively. The script provides a preview of the selected item using:

- `bat` for files, with line numbers and syntax highlighting,
- `eza` for directories, giving a well-formatted overview including icons.

When a selection is made, the script utilizes the Neovim (`nvim`) text editor to open the chosen file for editing.

Here's how the main components of the script work:
- `chezmoi managed` lists files managed by Chezmoi.
- `fzf` enhances user experience with a preview of the selected items and the ability to navigate through a structured file tree.

---

<a name="usage" />

#### Usage

1. Make sure the script is executable:
    ```bash
    chmod +x /home/matias/.scripts/edit_chezmoi_cfg_files.sh
    ```

2. Run the script in your terminal:
    ```bash
    /home/matias/.scripts/edit_chezmoi_cfg_files.sh
    ```

3. Use the fuzzy search interface to locate and select a file or directory.
4. Once selected, the file will be opened in Neovim.

<a name="examples" />

#### Examples

- Open a terminal and type:
    ```bash
    /home/matias/.scripts/edit_chezmoi_cfg_files.sh
    ```
- Start typing the name of the configuration file, navigate with arrow keys, and press `Enter` to open it.

---

<a name="notes" />

### Notes

- Ensure that all required dependencies are installed and properly configured on your system to avoid runtime errors.
- The preview window size can be adjusted by modifying the values for `--preview-window`.

> **Critique:**
> 
> The script effectively integrates `fzf` with `chezmoi`, providing a user-friendly way to edit configuration files. However, it assumes all dependencies are installed, which might lead to confusion for users unfamiliar with the required tools. Consider adding a dependency check at the beginning of the script to alert the user if any are missing. Additionally, a brief message could inform the user on how to exit the fzf interface, enhancing usability for newcomers.