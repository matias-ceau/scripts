# FZF File Manager Script

---

**fzf-file-manager.sh**: A shell script to manage files interactively using fzf and eza.

---

### Dependencies

- `fzf`: A general-purpose command-line fuzzy finder.
- `eza`: A modern replacement for `ls`, which provides additional formatting options and color support.
- `bat`: A cat clone with syntax highlighting and Git integration.

### Description

The `fzf-file-manager.sh` script creates a dynamic file management interface using `fzf` for fuzzy search capabilities, paired with `eza` for enhanced file listing. The script defines several commands with specific functionalities that help users navigate and preview files and directories efficiently.

Key functions include:

- `eza_def()`: Configures `eza` with specific flags for detailed and colored output.
- `ls_cmd()`: Lists files and directories using `eza` with configuration for sorting and grouping.
- `preview_cmd()`: Previews files or directories, providing insights like file type and contents, and supports higher-level previews for directories.
- `fzf_cmd()`: Wraps the fuzzy finder with specific bindings for various commands, enhancing user interaction with quick previews, info displays, and ephemeral commands.
  
### Usage

To run this script, simply execute it in your terminal. It will open an interactive `fzf` interface with file navigation capabilities.

```bash
bash /home/matias/.scripts/fzf-file-manager.sh
```

#### Key Bindings

- `Alt-P`: Toggle preview of the selected file or directory.
- `Alt-Space`: Open the selected file in full screen.
- `Alt-H`: Change prompt and reload file list.
- `Alt-F`: Jump to a chosen file from the fzf list.

You can customize or extend the functionality by modifying the script directly to include additional commands as per your requirements.

---

> [!TIP]  
> Consider improving error handling throughout the script to manage cases where `fzf`, `eza`, or `bat` are not installed or fail to execute properly. Additionally, documenting the key bindings directly in the script or in a help command would enhance user comprehension.