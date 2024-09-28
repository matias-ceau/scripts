# Quick Password Selector

---

**quick-pass.sh**: Quickly select a password from your password store using `fzf`.

---

### Dependencies

- `fd`: A simple, fast and user-friendly alternative to `find`. Used for listing files within the password store directory.
- `fzf`: A general-purpose command-line fuzzy finder that helps with interactively selecting files from the list.

### Description

This script helps you swiftly locate and select password entries from your password store. It leverages `fd` to list all files within the directory specified by the `$PASSWORD_STORE_DIR` environment variable, which should correspond to your password store path. The absolute paths returned by `fd` are then stripped of the base `PASSWORD_STORE_DIR` path using `sed`, leaving only the relative paths to the password files.

Finally, the list of entries is piped into `fzf`, which will present you with an interactive fuzzy search interface. This allows for quick searching and selection of passwords by their entries.

### Usage

To use the script, simply run it in your terminal. Ensure that your environment variable `PASSWORD_STORE_DIR` is set to the directory where your password store is located.

```bash
export PASSWORD_STORE_DIR=~/.password-store
~/.scripts/quick-pass.sh
```

Make sure that `fd` and `fzf` are installed on your Arch Linux system:
```bash
sudo pacman -S fd fzf
```

You may also want to bind this script to a key combination in qtile for even quicker access.

---

> [!TIP]
> Currently, the script only lists and lets you select files but doesn’t open or display any content from the selected password. Consider adding functionality that opens the selected file or copies its content to the clipboard securely for convenient password retrieval.
