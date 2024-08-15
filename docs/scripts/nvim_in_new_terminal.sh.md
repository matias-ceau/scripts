# Open NVIM in Floating Terminal

---

**nvim_in_new_terminal.sh**: Opens a floating terminal to edit a file with nvim

---

### Dependencies

- `alacritty`: A modern terminal emulator that is required to run this script.
- `nvim`: Neovim, an editor that serves as an enhanced version of Vim and is used for editing files.

### Description

The `nvim_in_new_terminal.sh` script is designed to provide a seamless way to open files in Neovim (`nvim`) within a floating terminal. This can be particularly useful for users of qtile who want a quick method to edit files while maintaining their workflow. 

When run, this script:
1. Uses the `setsid` command to start a new session, ensuring that the terminal can run independently.
2. Launches the `alacritty` terminal emulator, which will open a specified file with `nvim` in a floating window.

The script takes one argument, which is the filename that the user wishes to edit. If the file exists, it will be opened; if not, `nvim` will create a new file with that name.

### Usage

To use this script, you must have both `alacritty` and `nvim` installed. You can run the script from the terminal or bind it to a key combination in your window manager (qtile).

To execute the script, simply provide the file you want to edit as an argument:

```bash
./nvim_in_new_terminal.sh myfile.txt
```

This command will open `myfile.txt` in a floating `alacritty` terminal window running `nvim`. If the specified file does not exist, it will create a new file with that name.

---

> [!TIP]  
> The script assumes that `alacritty` is properly configured to be used in floating mode. Consider adding checks to ensure that the necessary programs are installed before executing the command. Additionally, implementing error handling would improve user feedback, especially if a file does not exist or if `nvim` fails to launch.