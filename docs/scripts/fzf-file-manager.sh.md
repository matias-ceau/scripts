# FZF File Manager Script

---

**fzf-file-manager.sh**: A file manager script utilizing `fzf` for efficient file navigation.

---

### Dependencies

- `bash`: The shell used to run the script.
- `fzf`: A command-line fuzzy finder, required for file searching and selection.
- `eza`: A modern replacement for `ls`, providing enhanced file and directory listing capabilities.
- `rg` (ripgrep): Used for regex searching, essential for processing environment variables.
- `bat`: A cat clone with syntax highlighting and Git integration, used for file previews.
- `pastel`: A command-line tool to generate and format colors, used in the script for custom color outputs.
- `kitten`: A terminal image viewer for displaying images in the terminal.

### Description

This script serves as a file manager that utilizes `fzf` (fuzzy finder) alongside `eza` for better directory and file management in a terminal environment. It allows users to traverse through directories, preview files, and interact with them through a visually appealing and color-coded interface.

Key functions include:

- **get_color**: Retrieves color codes from environment variables filtered by `FLEXOKI`.
- **eza_def**: Configures file listing options for `eza`, enhancing visual output with colors, icons, and timestamps.
- **ls_cmd**: Lists files in a specific format, grouping directories and sorting them.
- **preview_cmd**: Shows a preview of files or directories, intelligently displaying images or file content.
- **cmd_list**: Displays a help menu that can be accessed during runtime.
- **fzf_cmd**: The main command that integrates `fzf` with file browsing functionalities.

### Usage

To run the script and start managing files, execute:

```bash
bash /home/matias/.scripts/fzf-file-manager.sh
```

The script runs in an infinite loop driving the user to navigate through the file structure. While in the interface, users can:

- Navigate using arrow keys.
- Open a directory by selecting it and pressing Enter.
- Preview files with the integrated preview feature, toggleable with keybindings like `alt-p`.
- Navigate backward using a designated key.

Example of directory navigation:

```plaintext
# Select a directory and press Enter to navigate into it.
# Use the provided keybindings to manage your files.
```

---

> [!TIP]
> While the script is functional, it lacks error handling for invalid path selections or missing dependencies. Implementing checks for commands like `eza`, `fzf`, and `bat` at the start of the script could enhance stability. Furthermore, providing the user with clearer instructions for the keybindings would improve usability.
