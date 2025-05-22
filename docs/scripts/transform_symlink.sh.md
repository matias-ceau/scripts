# transform_symlink.sh

---

**transform_symlink.sh**: Convert symlinks into copies of their targets (both files and directories).

---

### Dependencies

- `fd`: A fast, user-friendly alternative to `find`. Used here to discover symlinks recursively.
- `fzf`: Command-line fuzzy finder. Provides an interactive menu to select symlinks for transformation.
- `bat`: (Optional but used in the preview) For pretty-print file previews within `fzf`.
- Standard GNU utils: `readlink`, `cp`, `rm`.

---

### Description

This script's core purpose is to **"unsymlink"**: it takes symlinks (files or directories that point elsewhere) and replaces each with a copy of the data they point to, deleting the link in the process.

Key logic/features:

- If run **without arguments**, it uses `fd` to list all symlinks (depth 5 by default) below `$PWD`, filters the selection via `fzf`, and transforms the selected symlink.
- If run **with one or more arguments**, each argument is handled as a symlink path and processed in turn.
- Helpful `usage` function with colored terminal output details available options, synopsis, and examples.
- Handles basic error situations: not a symlink, or target does not exist.
- Symlink transformation is performed by:
    1. Validating the symlink and its target.
    2. Removing the symlink.
    3. Copying the target (using `cp -r`) into the original symlink's path.

---

### Usage

Run without arguments for interactive selection (uses `fzf`):

```
transform_symlink.sh
```

Run with explicit paths to transform:

```
transform_symlink.sh /path/to/link1 /path/to/link2
```

Print help:

```
transform_symlink.sh --help
```

**In your Qtile config:**  
You can bind a key to run this script (e.g., in a terminal):

```python
Key([mod], "F7", lazy.spawn("alacritty -e ~/.scripts/bin/transform_symlink.sh"))
```

---

> [!TIP]
> The script is very useful for “materializing” data that might otherwise be lost if a symlink’s target is deleted. Here are some potential enhancements:
>
> - **Relative Symlink Targets:** The script assumes `readlink` outputs an absolute path. If the symlink uses a relative target, `cp` could fail or act unpredictably. Consider resolving to an absolute path first.
> - **Overwrite Warnings:** The script always replaces the symlink, destroying any data present at that path if a copy fails midway. Adding a backup or prompt would be safer.
> - **Multiple Selection:** In interactive mode, only one symlink can be selected. Consider allowing multi-select via `fzf`’s `--multi`.
> - **Robustness:** Better handling of symlink edge cases (e.g., broken symlinks, links with spaces/newlines).
> - **Preview Dependency:** If `bat` is missing, the preview in `fzf` fails silently; consider fallback to `cat`.
> 
> Otherwise, the script achieves its purpose efficiently and fits well into your Arch + Qtile workflow!