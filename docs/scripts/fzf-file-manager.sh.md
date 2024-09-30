# FZF File Manager Script

---

**fzf-file-manager.sh**: A file manager script utilizing `fzf` for efficient file navigation.

---

### Dependencies

- `bash`: The shell interpreter used for executing the script.
- `fzf`: Command-line fuzzy finder used for interactive file selection.
- `eza`: An enhanced version of `ls` for colorful and informative file listings.
- `pastel`: A tool to manipulate colors in the terminal.
- `bat`: A cat clone with syntax highlighting and other features.

### Description

The `fzf-file-manager.sh` script provides a versatile command-line file manager using `fzf` for navigation and file manipulation. The script features several functions that enhance the user experience, including:

- **Color Functions**: Uses the `get_color` function to fetch and format colors based on certain environment variables.
  
- **File Display**: The `eza_def` function sets up various options for displaying files, such as long format, icons, and sorting.

- **Preview Handling**: The `preview_cmd` function allows users to preview files of different types, such as text files, images, and directories, using `bat` and `kitten`.

- **Command Binding**: The script provides various keyboard bindings for seamlessly interacting with the file manager, including toggling previews and jumping to directories.

### Usage

To use the script, simply execute it in a terminal:

```bash
bash /home/matias/.scripts/fzf-file-manager.sh
```

The script navigates the current directory allowing for multi-selection of files and directories. Use the following commands while the script is running:

- **Navigation**:
  - **Enter**: Select the file or directory.
  - **Alt + P**: Toggle file preview.
  - **Ctrl + H / Ctrl + L**: Move backward/forward through directories.
  - **Esc**: Exit the file manager.

- **Fuzzy Searching**: Start typing to filter the file list interactively.

- **Special Preview Features**: Image files can be previewed directly in the terminal using `kitten`.

---

> [!TIP]  
Consider enhancing the script's error handling. For instance, if a command fails (such as during file reading), providing informative user feedback will improve usability. Additionally, think about implementing configuration options for `fzf` settings to tailor the user's experience even further.

