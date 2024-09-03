# Open Neovim in a Floating Terminal

---

**nvim_in_new_terminal.sh**: Opens a floating terminal to edit a file with Neovim.

---

### Dependencies

- `alacritty`: A modern terminal emulator that supports tiling and floating windows
- `nvim`: Neovim, an extensible and cross-platform text editor, providing a powerful interface for text editing.

### Description

This script is designed to enhance the workflow by allowing users to easily open files using Neovim (`nvim`) in a dedicated floating terminal. Utilizing `alacritty`, a highly efficient terminal emulator, the script creates a new instance of a terminal for editing purposes without disrupting the current workspace.

The script leverages the `setsid` command to ensure that `alacritty` runs in a new session, preventing it from being affected by the current terminal's session. The `-T 'floating'` option sets the terminal window title, and the `-e nvim "$1"` command executes Neovim with the file specified as the first argument.

### Usage

To use the script, you must provide the path to the file you want to edit as an argument. Here’s how to do it:

1. Ensure the script is executable. You can make it executable by running:
   ```bash
   chmod +x /home/matias/.scripts/nvim_in_new_terminal.sh
   ```

2. Run the script from your terminal, providing the filename as an argument:
   ```bash
   /home/matias/.scripts/nvim_in_new_terminal.sh path/to/your/file.txt
   ```

3. This will open `alacritty` with `nvim`, editing the specified file in a floating terminal.

---

> [!TIP]
> The script currently opens `alacritty` as a floating terminal with the default size and behavior. Consider adding options for custom window size or position to enhance user experience. Additionally, you could implement error checking to ensure that the file passed as an argument exists, preventing errors in case of typos or nonexistent files.