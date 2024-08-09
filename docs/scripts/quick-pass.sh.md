# Quick Pass

---

**quick-pass.sh**: Quickly select a password from your password store using fzf.

---

### Dependencies

- `fd`: A simple, fast and user-friendly alternative to `find`.
- `sed`: A stream editor for filtering and transforming text.
- `fzf`: A general-purpose command-line fuzzy finder with an interactive interface.

### Description

The `quick-pass.sh` script is designed to facilitate easy access to your passwords stored in a specific directory defined by the environment variable `PASSWORD_STORE_DIR`. The script utilizes `fd` to find all files (password entries) within that directory and then pipes the output to `sed` to format the text for better readability. Finally, `fzf` is used to provide a user-friendly interactive interface for selecting a password.

Here's the breakdown of the command:
- `fd . -tf $PASSWORD_STORE_DIR`: This command uses `fd` to recursively search for files (`-t f` for files) in the directory specified by `PASSWORD_STORE_DIR`.
- `sed -e "s#${PASSWORD_STORE_DIR}/##g"`: This removes the directory path from the displayed filenames, so only the password names are shown.
- `fzf`: It allows users to interactively filter through the list of passwords with fuzzy searching.

### Usage

To run the script, make sure your `PASSWORD_STORE_DIR` is set correctly to where your passwords are stored. You can execute the script directly from a terminal. Simply run:

```bash
bash /home/matias/.scripts/quick-pass.sh
```

Upon execution, you will see a list of passwords available for selection. You can navigate through the list using the arrow keys or by typing to search it interactively. Once you find the desired password, you can press `Enter` to confirm your selection.

Optionally, you can create a keybinding in your window manager (Qtile) to execute this script quickly without needing to type the command each time.

---

> [!TIP]
> The script currently does not handle cases where the `PASSWORD_STORE_DIR` is not set, which could lead to unexpected results or errors. To improve robustness, consider adding a check for this variable and provide a user-friendly error message when it is not defined. An additional feature could also involve copying the selected password to the clipboard automatically for easier use.