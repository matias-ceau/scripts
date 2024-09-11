# Open NVim in New Terminal

---

**nvim_in_new_terminal.sh**: Opens a floating terminal to edit a file with NVim.

---

### Dependencies

- `alacritty`: A terminal emulator that supports multiple functionalities including floating windows.
- `nvim`: The Neovim text editor, which enables modern text editing features.

### Description

This script provides a convenient way to open a file in Neovim within a floating terminal window. It uses `alacritty`, which supports floating terminal capabilities, allowing users to keep their workflow tidy by not cluttering their desktop with full-window terminal sessions.

When executed, the script uses the `setsid` command to create a new session for `alacritty`, which is launched with a title `nvim-term` and a specific class for styling purposes. The `-e` flag specifies the command to run within that terminal instance, which in this case is `nvim` followed by the file provided as an argument ($1).

### Usage

To use this script effectively, you need to provide the file path of the file you want to edit as an argument when executing the script. It can be run from the terminal as shown below:

```bash
/home/matias/.scripts/nvim_in_new_terminal.sh path/to/your/file.txt
```

This command will open `file.txt` in Neovim within a floating terminal window. You can also create a keybinding in your window manager (qtile) to trigger this script, enhancing productivity during file editing tasks.

---

> [!TIP]  
> Consider adding error handling for situations where no argument is given or the specified file does not exist. This would improve the user experience by providing informative messages rather than failing silently. Also, you could make the script more versatile by allowing it to accept multiple files for editing at once.