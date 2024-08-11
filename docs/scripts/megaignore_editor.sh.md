# MegaIgnore Editor Script

---

**megaignore_editor.sh**: A bash script for editing and managing .megaignore files interactively

---

### Dependencies

- `fd`: A simple, fast, and user-friendly alternative to `find`. It is used to search for files.
- `fzf`: A general-purpose command-line fuzzy finder that allows for easy selection of files.
- `bat`: A cat clone with syntax highlighting and Git integration, used for file previews.
- `nvim`: Neovim, a refactored version of Vim, utilized here for editing files.

### Description

The `megaignore_editor.sh` script is designed for users who need to manage their `.megaignore` files efficiently. It leverages the power of `fd` to search for `.megaignore` files within specified directories (`$HOME` and `/mnt`), piping the results to `fzf`, which provides a fuzzy search interface for easy file selection.

The script operates in a continuous loop that allows the user to perform various actions on the found `.megaignore` files:

1. **File Search**: It searches for all `.megaignore` files using `fd`.
2. **Preview**: Each file is displayed with a preview through `bat`, enhancing usability.
3. **Edit and Manage**:
   - Pressing **Enter** opens the selected file with `nvim`.
   - Pressing **Ctrl+D** deletes the selected file.

After each operation, the user is prompted to continue or exit the script, providing flexibility to manage multiple files in one session.

### Usage

To use the `megaignore_editor.sh` script, follow these steps:

1. Make the script executable:
   ```bash
   chmod +x /home/matias/.scripts/megaignore_editor.sh
   ```
2. Execute the script directly in the terminal:
   ```bash
   /home/matias/.scripts/megaignore_editor.sh
   ```

#### Interactive Execution

- The script will yield search results from `.megaignore` files in the specified directories.
- Use arrow keys or type to filter through the results.
- Press **Enter** to edit with `nvim` or **Ctrl+D** to delete the selected file.
- After an operation, respond to the prompt to either continue or stop running the script.

---

> [!TIP] Consider implementing error handling for scenarios where the dependencies are missing, or the selected file does not exist. Also, add clearer prompts for user actions and confirmations before executing dangerous commands such as file deletions. This will enhance usability and prevent accidental data loss.