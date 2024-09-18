# FZF File Manager Script

---

**fzf-file-manager.sh**: A file manager script using fzf for fuzzy finding and eza for enhanced file listings.

---

### Dependencies

- `bash`: The shell in which the script is written and executed.
- `fzf`: A command-line fuzzy finder that allows for interactive selection of files and directories.
- `eza`: An enhanced `ls` replacement with more features and visual capabilities.
- `bat`: A cat clone with syntax highlighting. Used for previewing files.
- `pastel`: A command-line tool for managing colors, particularly useful for formatting output.

### Description

This script serves as a file manager utility that integrates with `fzf`, providing a fuzzy search interface to browse directories and files. Utilizing the `eza` command for enhanced listing, it displays files with colors and icons, leveraging other tools like `bat` for syntax highlighting and `rg` (ripgrep) for searching cell configurations.

Key functionalities include:

- **get_color**: Fetches and formats color settings based on environment variables.
- **eza_def**: Configures file listings with various options like long format, colors, icons, and timestamp formatting.
- **ls_cmd**: Collects and organizes file listings, highlighting directories first and sorting them by name.
- **preview_cmd**: Provides a preview of the selected file, adapting based on the file type (directories, images, or standard files).
  
Additional commands such as `full_screen_preview`, `info_cmd`, and `cmd_list` serve for full screen viewing, information display about the fzf session, and command menu respectively.

### Usage

To run the script, simply execute it in a terminal. It can take additional parameters for listing specific directories or files, e.g.:

```bash
bash ~/path/to/fzf-file-manager.sh /path/to/directory
```

While the file manager is running, you can utilize the following key bindings:

- `Alt + P`: Toggle file preview.
- `Alt + Space`: Open the selected file in full screen using `bat`.
- `Alt + H`: Change the prompt and reload file listings.
- `Alt + F`: Jump to relevant files.
- `Esc`: Cancel or clear the current action (commented out).

All your interactions will happen dynamically inside the `fzf` interface, which provides a clean and minimalistic view.

---

> [!TIP] 
> Consider adding more error handling, especially for cases when dependencies are missing or when the selected files or directories cannot be accessed. Additionally, improving the preview functionalities to support more file types (e.g., PDFs) can enhance the user experience.