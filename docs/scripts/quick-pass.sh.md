# Quick Pass Script

---

**quick-pass.sh**: A script to quickly search and display password entries using fzf.

---

### Dependencies

- `fd`: A simple, fast and user-friendly alternative to `find`.
- `fzf`: A command-line fuzzy finder that allows quick searching through text.

### Description

The `quick-pass.sh` script provides a streamlined way to browse password entries stored in the `PASSWORD_STORE_DIR` directory. It utilizes the `fd` command to find all entries in this directory and pipes them into `fzf` for a fuzzy search experience.

This script performs the following operations:

1. Uses `fd` to traverse the directory specified in the environment variable `PASSWORD_STORE_DIR`, filtering for files (`. -tf`).
2. The output from `fd` is then processed with `sed`, which removes the path prefix from the search results to present a cleaner list to the user.
3. Finally, the processed file names are displayed in a fuzzy searchable interface through `fzf`, allowing users to easily locate their desired password entry.

### Usage

To utilize the `quick-pass.sh` script, ensure that you have both `fd` and `fzf` installed on your Arch Linux setup. Once the dependencies are satisfied, you can run the script directly from the terminal.

```bash
bash /home/matias/.scripts/quick-pass.sh
```

You may also consider assigning this script to a keybinding in your window manager (Qtile) or integrating it into your custom workflows for quick access to passwords.

---

> [!TIP] 
> While the script efficiently utilizes `fd` and `fzf`, it lacks error handling. Consider adding checks to verify if `PASSWORD_STORE_DIR` is set and if `fd` or `fzf` are installed, to enhance the user experience. Additionally, you might want to handle cases when no results are returned from `fd`, informing the user appropriately.