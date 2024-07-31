# Edit Chezmoi Configuration Files

---

**[edit_chezmoi_cfg_files.sh](edit_chezmoi_cfg_files.sh)**: A script to edit Chezmoi managed configuration files using fzf.

---

### Dependencies

- `chezmoi`: A tool for managing dotfiles across multiple machines.
- `fzf`: A general-purpose command-line fuzzy finder.
- `bat`: A cat(1) clone with syntax highlighting and Git integration, used for previewing files.
- `eza`: A modern replacement for `ls`, used here to preview directory contents.

### Description

This script is designed to facilitate the editing of configuration files managed by `chezmoi` using a fuzzy finder interface provided by `fzf`. It allows users to quickly navigate through their configuration files and edit them using their preferred text editor, in this case, `nvim` (Neovim). The script utilizes various command-line tools to enhance usability and functionality.

- The `chezmoi managed` command retrieves the list of files managed by Chezmoi.
- `fzf` is invoked to present a user-friendly interface for selecting files. The preview feature is enhanced by checking the type of the selected item:
  - If it's a file, it uses `bat` to display the file contents with line numbers and syntax highlighting.
  - If it's a directory, it uses `eza` to list the directory contents in a visually appealing format.

The selected file or directory will then be opened in `nvim` if a selection is made.

### Usage

Run the script in your terminal by executing:

```bash
bash /home/matias/.scripts/edit_chezmoi_cfg_files.sh
```

This will open `fzf` listing all files managed by Chezmoi. Once you select a file, it will be opened in Neovim for editing.

- To invoke a specific configuration file editing process, simply run the script and navigate to your desired file within the `fzf` interface.

Example of interaction:

1. Run the script.
2. Use the arrow keys or type to filter results.
3. Select a configuration file using Enter.
4. The selected file will open in Neovim.

---

> [!TIP]  
> The script could be enhanced by adding options for different text editors or supporting the editing of multiple files at once. Additionally, error handling could be improved to manage cases where commands like `nvim` or `fzf` are not installed, providing feedback to the user about missing dependencies.
