# MegaIgnore Editor

---

**megaignore_editor.sh**: Interactive script to find and edit `.megaignore` files

---

### Dependencies

- `fd`: A simple, fast, and user-friendly alternative to `find`.
- `fzf`: A general-purpose command-line fuzzy finder.
- `bat`: A `cat` clone with syntax highlighting and Git integration.
- `nvim`: A hyperextensible Vim-based text editor.
  
### Description

The `megaignore_editor.sh` script provides an interactive interface for locating and editing `.megaignore` files across the user's home directory and mounted directories. It leverages the capabilities of `fd` to search for `.megaignore` files and lists them using `fzf`, a fuzzy finder. Users can preview the content of each file using `bat`, which gives a syntax-highlighted view. The script also binds certain keys to specific actions: pressing `Enter` opens the file in `nvim` for editing, while `Ctrl-D` deletes the selected file. 

This loop continues until the user decides to stop, allowing for multiple iterations through the files. It prompts the user after each iteration for continuation, reading user input and stopping upon receiving 'n'.

### Usage

Run the script in a terminal session to explore and manage `.megaignore` files:

```sh
bash /home/matias/.scripts/megaignore_editor.sh
```

**Within the interactive session:**

- Use the `fzf` interface to select files.
- Press `Enter` to open a file in `nvim` and edit it.
- Press `Ctrl-D` to delete the chosen `.megaignore` file.
- After each operation, respond to the continuation prompt to either go on or exit.

**Sample Response:**

```sh
Continue? [y]/n: y
```

Press 'n' to exit the loop and stop the script.

---

> [!TIP] Considerations for improvement:
> 
> - Add error handling to manage cases where dependencies are missing or commands fail.
> - It could be beneficial to add logging for delete operations to prevent accidental file loss and assist in retrieving information on deleted files if necessary.
> - Introducing a signal handler could enhance the user experience by gracefully exiting the script upon receiving interrupts (e.g., Ctrl-C).