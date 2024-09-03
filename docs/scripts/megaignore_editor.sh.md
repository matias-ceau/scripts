# Megaignore Editor

---

**megaignore_editor.sh**: A script to manage and edit `.megaignore` files using `fzf` and `nvim`.

---

### Dependencies

- `bash`: The shell environment in which the script is executed.
- `fd`: A simple, fast and user-friendly alternative to `find`. It's used here to search for `.megaignore` files.
- `fzf`: A command-line fuzzy finder; it provides a user interface to search through the found files.
- `bat`: A cat clone with syntax highlighting and Git integration. It's used to preview file contents.
- `nvim`: Neovim text editor; allows you to edit the selected `.megaignore` file.

### Description

This script is designed for users who want to streamline their workflow when dealing with `.megaignore` files located in their home directory and external mounts (like `/mnt`). It makes use of `fd` to find `.megaignore` files, `fzf` for a user-friendly selection experience, and `nvim` for editing the selected file. 

The script operates in an infinite loop, allowing users to repeatedly search for `.megaignore` files. Upon a search, it displays the results in `fzf`, where users can easily preview the file contents using `bat`. Users can also execute specific commands: pressing `Enter` opens the selected file in `nvim`, while `Ctrl+D` deletes the file.

### Usage

To run the script, simply execute it from the terminal:

```bash
bash ~/path/to/megaignore_editor.sh
```

You can navigate through results using arrow keys and interact with files as follows:

- **Enter**: Open selected `.megaignore` file with `nvim`.
- **Ctrl+D**: Delete the selected `.megaignore` file.
  
After each operation, you will be prompted to continue or exit:

```
Continue? [y]/n:
```

You can type `n` to exit the script, or just press `Enter` to continue searching.

---

> [!TIP] 
> The script lacks validation for file deletion and could potentially delete important files without further confirmation. It could be enhanced by adding a safety prompt before executing the `rm` command, or by implementing a move to trash functionality instead of permanent deletion. Additionally, consider providing an option to customize search paths or the file pattern to enhance usability.