# Quick Pass Script

---

**quick-pass.sh**: Launches a fuzzy finder for passwords stored in a specified directory.

---

### Dependencies

- `fd`: A simple, fast and user-friendly file explorer. It is used here to find password files in the specified directory.
- `fzf`: A command-line fuzzy finder that allows for quick searching and selecting of items.

### Description

The `quick-pass.sh` script is a convenient tool designed to simplify the process of retrieving passwords from a specified password storage directory. Utilizing `fd` for fast file discovery and `fzf` for interactive fuzzy searching, this script allows users to quickly navigate through their password files without manually guessing filenames.

Here's how the script works:
- It executes the `fd` command to find all files in the directory specified by the environment variable `PASSWORD_STORE_DIR`. 
- The output of `fd` is piped into `sed`, which strips away the path leading to the `PASSWORD_STORE_DIR`, leaving only the filenames.
- The cleaned filenames are then passed to `fzf`, which provides a user-friendly interface for selecting the desired password file interactively.

### Usage

To use the `quick-pass.sh` script, ensure that the `PASSWORD_STORE_DIR` environment variable is set to the directory containing your password files. You can run the script directly from the terminal:

```bash
./quick-pass.sh
```

After running the command, a list of your password files will appear in a fuzzy search menu provided by `fzf`. Use arrow keys to navigate and `Enter` to select a password.

You may also consider binding this script to a key combination in your window manager to access it quickly. In `qtile`, you can add it to your configuration by including something like this in your keybindings:

```python
Key([mod], "p", lazy.spawn("path/to/quick-pass.sh")),
```

---

> [!TIP]  
> The script assumes that `PASSWORD_STORE_DIR` is always set. It would be beneficial to add error handling to check if this variable is defined and if the directory it points to contains any files. Additionally, consider adding options to copy the selected password to the clipboard or display it directly for convenience.