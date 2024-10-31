# fzf Enhanced File Manager

---

**fzf-file-manager.sh**: Interactive file manager using fzf with advanced features.

---

### Dependencies

- `fzf`: A command-line fuzzy finder for interactive filtering.
- `bash`: Required for running the script.
- `eza`: A modern replacement for 'ls', with additional features like icons and colors.
- `bat`: A cat clone with syntax highlighting.
- `rg` (ripgrep): High-performance search tool, works like ag but faster.
- `kitty`: For image previews (via `kitty icat`).
- `pastel`: For color formatting in ANSI codes.

### Description

This script provides a robust terminal-based file manager using `fzf`, enriched with features like colored output, directory navigation, and file preview capabilities. Utilizing `eza` for listing directory contents allows for more visually appealing and informative outputs. The `get_color` function leverages environment variables specific to your setup (`FLEXOKI`) to format colors using `pastel`. Files are previewed using `bat` or `kitty icat` for images, offering an intuitive interface for browsing files.

The script offers enhanced `fzf` bindings:
- Preview listing with `alt-p`
- Full file preview with `alt-space`
- Directory navigation shortcuts (`ctrl-h` to go back, `ctrl-l` to forward)

It effectively maintains a current directory state (`CUR_DIR`) and modifies it based on the user's navigation actions (directories and files).

### Usage

Run the script in a terminal to start navigating:

```bash
# Make sure the script is executable
chmod +x /home/matias/.scripts/bin/fzf-file-manager.sh

# Execute the file manager
/home/matias/.scripts/bin/fzf-file-manager.sh
```

Navigate through directories or view files interactively. Use the provided key bindings to enhance productivity.

Examples:

- Navigate directories:
  ```text
  ctrl-l: move forward into selected directory
  ctrl-h: move backward to previous directory
  ```

- Preview file content:
  ```text
  alt-p: toggle the preview pane
  alt-space: view full-screen preview
  ```

---

> [!TIP]
> While this script is comprehensive, the `get_color` function might be too specific to customized environment variables (`FLEXOKI`). Consider abstracting color assignments to more generic or configurable methods to enhance portability. Similarly, confirm the presence and compatibility of all dependencies to avoid runtime issues in other environments.