# FZF File Manager Script

---

**fzf-file-manager.sh**: A script to enhance file browsing with fzf and color-enhanced listings

---

### Dependencies

- `bash`: The Bourne Again SHell for executing the script.
- `fzf`: A command-line fuzzy finder that helps in quick searching.
- `eza`: A modern replacement for `ls` with additional features and options.
- `bat`: A `cat` clone with syntax highlighting and Git integration.
- `rg` (ripgrep): A very fast grep alternative that works recursively in directories.
- `pastel`: A command-line tool to generate, analyze, convert and manipulate colors.
- `kitten` (from kitty terminal): A graphics communicator for image manipulation in terminal.

### Description

This script acts as a sophisticated file manager using the capabilities of `fzf` for file searching and `eza` for colorful file listings. The script customizes the file previewing process, allowing you to preview files with `bat` or view images directly in the terminal if the right terminal emulator (like kitty) is used. The design of the script is such that it allows toggling and transformation of preview environments seamlessly. It heavily relies on `fzf`'s capabilities to bind key actions to various interactive elements within the file manager, enhancing navigational efficiency.

Functions like `get_color`, `eza_def`, `ls_cmd`, and `preview_cmd` work together to deliver not only visually pleasing but also functionally efficient file management experience. This script tailors its output based on whether an item is a directory or a file, optimizing previews accordingly, and ensuring that you get the necessary information at a glance.

### Usage

To start using the script, ensure it is executable. You can integrate it into your workflow by running it from a terminal:

```bash
chmod +x /home/matias/.scripts/fzf-file-manager.sh
/home/matias/.scripts/fzf-file-manager.sh
```

Here's a brief rundown of how you can navigate through the file manager:

- **Alt + p**: Toggle file preview.
- **Alt + Space**: View the current file in full-screen preview via `bat`.
- **Alt + h**: Toggle hidden files view.
- **Alt + f**: Jump between search results.
- **Resize**: Automatically refresh preview for better adaptability.

This script can be conveniently bound to a key in your `qtile` wm, offering quick access.

---

> [!TIP]
> The script could be improved by ensuring compatibility with more terminal emulators for features like image previews, potentially detecting or setting this at runtime. Additionally, simplifying some of the nested command executions or breaking the script into smaller, manageable sub-scripts might enhance maintainability and readability.