# fzfmenu - Fuzzy Finder in Xterm

---

**fzfmenu.sh**: A script that uses `fzf` to provide a fuzzy search interface in `xterm`.

---

### Dependencies

- `fzf`: A command-line fuzzy finder that allows searching through a list of items.
- `xterm`: A terminal emulator for the X Window System where the `fzf` interface will be displayed.

### Description

The `fzfmenu.sh` script serves as a convenient wrapper around the `fzf` tool, enabling users to select items from a list in a terminal environment. It is designed to run within an `xterm` session, making it a lightweight alternative to `dmenu` for those familiar with `fzf`.

This script begins by escaping each argument passed to it, ensuring that any special characters do not interfere with the command-line execution. It uses a loop to iterate through the provided arguments, applying `printf %q` to each one to escape it properly. The escaped arguments are then joined into a single string, which is passed to the `fzf` command inside an `xterm` window.

When invoked, the script opens `xterm` with the title 'fzfmenu', executing the `fzf` command while redirecting the input and output appropriately, allowing interactive selection.

### Usage

To use `fzfmenu.sh`, run the script from an interactive shell. You can provide a list of items to search through as arguments. Here are some examples:

1. **Basic Usage**:
    ```bash
    ./fzfmenu.sh item1 item2 item3
    ```

2. **Using with a command**:
    You can pipe output from commands directly into the script:
    ```bash
    ls | ./fzfmenu.sh
    ```

3. **Keybindings**:
    You can bind this script to a key in your window manager configuration (for example, in Qtile):
    ```python
    Key([mod], "f", lazy.spawn("/home/matias/.scripts/fzfmenu.sh"))
    ```

---

> [!TIP]  
> The script could be improved by handling cases where no arguments are provided, potentially giving the user a graceful exit or a default list to choose from. Additionally, consider adding help information that can be displayed when executed with `-h` or `--help`.