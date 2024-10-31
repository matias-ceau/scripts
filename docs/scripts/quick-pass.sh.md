# Quick Pass Script

---

**quick-pass.sh**: A script to quickly access and copy GPG-encrypted passwords from a password store.

---

### Dependencies

- `bash`: The shell in which the script is written.
- `fd`: A simple and fast alternative to `find`.
- `fzf`: A command-line fuzzy finder for selecting from a list.
- `pass`: A standard Unix password manager.
- `xdotool`: A tool that simulates keyboard input and mouse activity.

### Description

This script facilitates the retrieval of GPG-encrypted passwords managed with `pass`. It utilizes the `fd` command to find files with the `.gpg` extension within the specified password store directory. Once the files are located, the script formats the output and pipes it to `fzf`, allowing the user to interactively select a password.

Here's how the script works step-by-step:

1. **File Discovery**: The `fd` command searches for files ending with `.gpg` within the directory defined by the `PASSWORD_STORE_DIR` environment variable.

2. **Output Formatting**: The script applies various formatting options using ANSI escape codes to enhance the visual representation of the found passwords.

3. **Sorting and Filtering**: The results are sorted and processed through `sed` to clean up the output by removing the preceding `./` from file names.

4. **Interactive Selection**: The cleaned list is fed into `fzf`, which presents the user with a selectable interface. Key bindings within `fzf` allow users to either edit the selected password or copy it to the clipboard.

5. **Password Retrieval**: The selected password is then piped through `xargs` to the `pass` command to output the password content.

The script has a TODO comment indicating future development to write directly to the qutebrowser FIFO.

### Usage

To use this script, simply run it from the terminal as follows:

```bash
bash /home/matias/.scripts/quick-pass.sh
```

From the `fzf` list, you can:

- Press `Ctrl + E` to edit the selected password using `pass edit`.
- Press `Ctrl + X` to copy the selected password directly into the clipboard with `xdotool`.

---

> [!TIP] 
> This script assumes that the `PASSWORD_STORE_DIR` variable is properly set and that your password store is configured correctly. Consider adding error handling to manage cases where the environment variable is unset or if `fd` cannot find any files. Additionally, integrating with qutebrowser as the TODO suggests would elevate the script's utility for users who frequently use that browser.