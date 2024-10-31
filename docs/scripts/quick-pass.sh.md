# Quick Password Manager

---

**quick-pass.sh**: Interactive script to quickly search and manage passwords with `pass`

---

### Dependencies

- `fd`: A simple, fast and user-friendly alternative to `find`. Used for searching and listing `.gpg` files.
- `pass`: The standard unix password manager. Used for retrieving and editing password entries.
- `fzf`: A general-purpose command-line fuzzy finder. Used to interactively select a password entry.
- `xdotool`: A command-line X11 automation tool. Used to automatically type out the password.
- `sort`, `sed`, `xargs`, `cut`: Standard Unix utilities used for processing and piping text data.

### Description

This script is designed to help users rapidly search and interact with their password store managed by `pass`. It utilizes the `fd` command to locate all `.gpg` files under the specified directory, formats them, and pipes the results to `fzf`, which allows the user to select a password entry interactively. Users can press `ctrl-e` to edit a password entry with `pass` or `ctrl-x` to type out the password using `xdotool`. Finally, the selected entry is picked with `cut` and `xargs` to execute a `pass` retrieval command.

### Usage

To use this script, ensure all dependencies are installed on your system and execute the script in a terminal:

```bash
/home/matias/.scripts/bin/quick-pass.sh
```
- Navigate the list using the arrow keys and select by pressing `Enter`.
- Use `ctrl-e` to edit a password entry.
- Use `ctrl-x` to type the password into an active window with `xdotool`.

This script can also be integrated with your `qtile` WM as a custom keybinding for quick access.

---

> [!NOTE]
> Consider redirecting outputs or errors more explicitly, as the script does not handle exceptional cases elegantly.
> Additionally, completing the TODO to write to `qutebrowser` FIFO would extend its functionality to web browsers.
> It's worth mentioning that `PASSWORD_STORE_DIR` should be correctly set for the script to work properly.