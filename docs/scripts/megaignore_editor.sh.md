# Megaignore Editor

---

**megaignore_editor.sh**: A script to edit `.megaignore` files using fzf and nvim.

---

### Dependencies

- `fd`: A fast and user-friendly alternative to `find` for searching files.
- `fzf`: A general-purpose command-line fuzzy finder.
- `bat`: A cat clone with syntax highlighting and Git integration.
- `nvim`: A modern text editor based on Vim.

### Description

The `megaignore_editor.sh` script provides a convenient way to browse and edit `.megaignore` files located in your home directory and a specified mount point (`/mnt`). It utilizes `fd` to search for files named `.megaignore`, and `fzf` for fuzzy finding among the results. 

When you run the script, it enters an infinite loop where it executes the following process:

1. **File Searching**: The script uses `fd` to look for `.megaignore` files within two specified directories: your home directory (`$HOME`) and the mount point (`/mnt`).

2. **Interactive Selection**: The results of the `fd` search are piped into `fzf`, allowing you to visually browse the files. You can preview the contents using `bat` by pressing the preview key, and either:
   - Open the selected file in `nvim` by pressing Enter.
   - Delete the file using Ctrl+D.

3. **Continue?**: After an action, the script prompts you to continue browsing or exit the loop. Typing `n` will end the script, while pressing Enter will continue searching.

### Usage

To use the script, simply run it from your terminal:

```bash
bash ~/scripts/megaignore_editor.sh
```

Once the script is running, follow these steps:

1. Navigate through the `.megaignore` files using arrow keys.
2. Press `Enter` to edit the selected file in `nvim`.
3. Press `Ctrl+D` to delete a highlighted file.
4. When prompted with "Continue? [y]/n:", type `n` to exit or just press Enter to continue.

---

> [!TIP]
> The script could be improved by adding error handling to manage situations where dependencies are not installed or when `.megaignore` files cannot be found. Additionally, implementing a more customizable search path could enhance usability for users with different directory structures.