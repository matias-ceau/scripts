# FZF Menu Helper Script

---

**fzfmenu.sh**: A helper script to replicate `dmenu` functionality using `fzf` and `xterm`.

---

### Dependencies

- `fzf`: A general-purpose command-line fuzzy finder.
- `xterm`: A standard terminal emulator for the X Window System.
- `bash`: The GNU Bourne Again SHell, required for script execution.

### Description

The `fzfmenu.sh` script serves as a helper function that provides a `dmenu`-like experience through `fzf` and `xterm`. It activates an `xterm` window titled "fzfmenu", which allows you to apply `fzf` arguments for customized fuzzy finding directly within the terminal interface. This approach can be more visually appealing or intuitive for users accustomed to terminal-based environments on Arch Linux with qtile window manager.

The implementation does the following:
- Escapes each positional argument passed to the script using `printf %q` to handle special characters and whitespaces adequately.
- Creates a new string `fzf_args` containing all the properly escaped arguments.
- Launches `xterm` with `fzf` and passes the arguments, ensuring input from standard input and output is redirected appropriately.

### Usage

This script is primarily used to replace or supplement `dmenu` by providing a similar feature set with the `fzf` tool. You can easily integrate it into your keybindings or use it directly from the terminal. Below is a simple example of how you might invoke the script:

```bash
~/.scripts/bin/fzfmenu.sh --height 40% --reverse
```

In this example:
- `--height 40%`: Sets the height of the `fzf` interface.
- `--reverse`: Displays the selection area at the bottom of the terminal.

The script should accommodate any additional `fzf` flags or options seamlessly.

---

> [!NOTE]
> This script could benefit from enhanced error handling, especially regarding user inputs or if dependencies fail to load properly. Additionally, specifying default `fzf` options when none are provided might improve user experience out-of-the-box.