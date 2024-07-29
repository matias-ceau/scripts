# edit_chezmoi_cfg_files.sh

# Script Documentation

## Overview

This Bash script enhances the functionality of [fzf](https://github.com/junegunn/fzf) by providing a preview feature when managing files with [chezmoi](https://github.com/twpayne/chezmoi). It allows users to select and edit managed files using `neovim` (`nvim`).

## Functionalities

1. **File Selection with Preview**:
   - The script uses `chezmoi managed` to list all files managed by `chezmoi`.
   - It then pipes the list to `fzf`, a command-line fuzzy finder, with an enhanced preview window.

2. **Preview Configuration**:
   - The preview displays the content of the file using [`bat`](https://github.com/sharkdp/bat), which provides syntax highlighting and line numbers if the item is a file.
   - If the item is a directory, it uses [`eza`](https://github.com/eza-community/eza), a modern replacement for `ls`, to list the contents of the directory with icons and sorted by modification time.

3. **Editing Selected File**:
   - If a file is selected (`$selected` is non-empty), the script opens the file for editing using `nvim` with `chezmoi edit`.

## Requirements

- `chezmoi`
- `fzf`
- `bat`
- `eza`
- `nvim`

## Usage

1. **Run the Script**:
   ```bash
   ./script.sh
   ```

2. **Interact with `fzf`**:
   - Use `fzf`'s fuzzy searching to find the file or directory you want to preview or edit.
   - The preview will be shown on the right side of the terminal, occupying 60% of the width.
   - Files will display their content with syntax highlighting and line numbers.
   - Directories will list their contents with icons, color-coding, and sorted by modification date.

3. **Edit the Selected File**:
   - Once you have selected a file, it will be opened in `nvim` for editing.

## Example

```bash
#!/bin/bash

# Launch fzf with improved preview
selected=$(chezmoi managed | fzf \
    --preview 'if [ -f {} ]; then bat --style=numbers --color=always --terminal-width="$FZF_PREVIEW_COLUMNS" {}; elif [ -d {} ]; then eza -1 --color="always" --icons=always --sort=modified -m {}; fi' \
    --preview-window=right:60%:wrap\
    --walker-root="$HOME")

if [ -n "$selected" ]; then
    EDITOR=nvim chezmoi edit "$selected"
fi
```