# Edit Chezmoi Configuration Files

---

**edit_chezmoi_cfg_files.sh**: A script to edit configuration files managed by Chezmoi using fzf.

---

### Dependencies

- `bat`: A cat clone with syntax highlighting and Git integration.
- `fzf`: A command-line fuzzy finder that allows for quick file selection.
- `nvim`: Neovim text editor for editing the selected configuration files.
- `chezmoi`: A tool for managing your dotfiles across multiple machines.
- `eza`: A modern replacement for `ls`, providing enhanced file listing capabilities.

### Description

This script enables users to quickly access and edit configuration files managed by Chezmoi. It utilizes `fzf` for an interactive file selection with a preview capability, allowing users to see file content before opening it in `nvim`. The script features two main functions:

- `preview_command()`: This function displays a preview of the selected file using `bat` if it's a file or `eza` if it's a directory.
- `colorize_file_list()`: It ensures that the output from the `chezmoi managed` command is color-coded to easily distinguish between files and directories.

Upon execution, the script presents a list of files and directories managed by Chezmoi, enhanced by `fzf` functionalities such as highlighting and custom key binds for better user interaction.

### Usage

To run this script, simply execute it in your terminal:

```bash
bash /home/matias/.scripts/edit_chezmoi_cfg_files.sh
```

This will:
1. Display a list of configuration files managed by Chezmoi.
2. Enable file selection with a preview of the content.
3. Edit the selected file in `nvim` once chosen. 

Here are some useful key bindings when using `fzf`:
- **A-D**: Navigate to directories.
- **Tab**: Select a file for editing.
- **Alt-D**: Reload the directory list.
- **Alt-F**: Reload the file list.

---

> [!TIP]  
> The script could be improved by adding error handling for commands like `chezmoi` or `nvim`, ensuring that users receive feedback if something goes wrong. Additionally, configuration options for customizing key bindings or preview styles could enhance usability, adapting the script to different workflows.