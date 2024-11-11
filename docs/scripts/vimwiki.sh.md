# Vimwiki Note Opener

---

**vimwiki.sh**: Open a note in Vim using `fzf` for selection

---

### Dependencies

- `bash`: The script is executed within the Bash shell environment.
- `vim`: A highly configurable text editor used for efficient text editing.
- `fzf`: A command-line fuzzy finder that helps you locate and open files with ease.

### Description

This script provides a straightforward way to open notes stored in the `~/notes` directory using Vim. It leverages the power of `fzf`, a fuzzy finder tool, to allow you to quickly search and select which note you'd like to open. Once a note is selected, it's opened in Vim for editing or viewing.

The script first lists all files in the `~/notes` directory and pipes this list to `fzf`. The user can then interactively search through the list and choose a file. The selected filename is captured and Vim is launched to open the corresponding note.

### Usage

To use this script, ensure it is executable and run it from the terminal. Here is a simple way to use and bind this script in your Arch Linux environment, potentially in combination with the qtile window manager:

1. **Run Script Manually:**
   ```
   /home/matias/.scripts/bin/vimwiki.sh
   ```

2. **Bind to a Key in Qtile:**
   Modify your qtile config to include a keybinding for the script. Here's an example snippet:
   ```python
   Key([mod], "n", lazy.spawn("/home/matias/.scripts/bin/vimwiki.sh")),
   ```
   This binds "mod + n" to open the vimwiki note selector.

3. **Automation:**
   If you wish to run this script regularly (e.g., upon startup), you can add it to your shell's startup script, such as in `.bashrc` or a qtile autostart script.

---

> [!TIP]
> Consider adding error handling for empty selections or verifying that the `~/notes` directory exists. This can make the script more robust in face of unforeseen situations or misconfigurations.