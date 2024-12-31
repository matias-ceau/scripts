# VimWiki Note Opener

---

**vimwiki.sh**: Open a note in vim with fzf

---

### Dependencies

- `fd`: A simple, fast, and user-friendly alternative to `find`. This script uses `fd` to search for markdown files (`.md`) within the `~/notes` directory.
- `fzf`: A command-line fuzzy finder. Used here to provide an interactive interface for selecting notes.
- `bat`: A cat clone with syntax highlighting and Git integration. It provides the formatted and highlighted preview of the selected note.
- `nvim` (or `vim`): Enhanced editor used to open the selected file.

Make sure these tools are installed on your Arch Linux system. You can use `pacman` for official packages and `yay` for AUR packages if needed.

---

### Description

This script is designed to streamline the process of opening markdown notes stored in the `~/notes` directory using the `nvim` editor. It leverages the power of `fd` to search for markdown files, `fzf` to allow interactive selection of the files, and `bat` to display a preview of the files' contents before opening them.

Here’s how it works:
1. The `fd` command filters and lists all `.md` files in the `~/notes` directory.
2. The list is piped into `fzf`, which presents the user with a list of options in a TUI (text-based user interface). 
3. `fzf` also includes a preview feature that highlights the selected note using `bat`.
4. Once a selection is made, the script opens the note immediately in `nvim`.

This script makes note management efficient and smooth by combining powerful CLI tools.

---

### Usage

1. Save the script to a convenient location (e.g., `~/.scripts/bin/vimwiki.sh`).
2. Make it executable:
   ```bash
   chmod +x ~/.scripts/bin/vimwiki.sh
   ```
3. Run it directly from the terminal:
   ```bash
   ~/.scripts/bin/vimwiki.sh
   ```
4. To enhance convenience, you can create an alias in your shell configuration (e.g., `.bashrc` or `.zshrc`):
   ```bash
   alias vimwiki="~/.scripts/bin/vimwiki.sh"
   ```
   Then, simply use the alias to invoke the script:
   ```bash
   vimwiki
   ```

You can also bind this script to a keybinding in your Window Manager (e.g., Qtile) to launch it with a keyboard shortcut. Make sure the path to `vimwiki.sh` is correctly referenced when configuring the key binding.

---

> [!NOTE]
> - The script currently assumes that the `~/notes/` directory is pre-existing. If it doesn't exist, you'll need to create it manually or modify the script accordingly.
> - Instead of hardcoding the `~/notes` directory, consider allowing users to pass the directory as an environment variable or an argument to make the script more flexible.
> - The `become` binding in `fzf` is great for this use case but ensure that your system's `fzf` version supports it.
> - Using `nvim` here is hardcoded. It might be a good idea to allow users to specify their preferred editor.