# Display Qutebrowser Scripts

---

**show-all-qutebrowser-scripts.sh**: Display the scripts associated with Qutebrowser

---

### Dependencies

- `pacman`: The package manager for Arch Linux, used to query the qutebrowser package.
- `qutebrowser`: A keyboard-driven, minimalist web browser.
- `rg` (ripgrep): A line-oriented search tool that recursively searches your current directory for a regex pattern.
- `sed`: A stream editor used for parsing and transforming text.
- `xargs`: Used to build and execute command lines from standard input.
- `bat`: A cat clone with syntax highlighting for code and terminal output.

### Description

This script lists and displays the contents of the last 37 files installed by the `qutebrowser` package that are not directories. It uses `pacman` to query the list of files installed by the `qutebrowser` package, pipes the output to `tail` to focus on the last 37 lines, and filters out directories using `rg`. It then uses `sed` to simplify the file paths printed by `pacman` to just the files relating to `qutebrowser`. Finally, `xargs` is used to pass these file names to `bat`, which displays their contents with syntax highlighting.

### Usage

To use this script, ensure all dependencies are installed. Then, you can run it directly from a terminal to list and display the scripts associated with your qutebrowser installation.

```shell
bash /home/matias/.scripts/show-all-qutebrowser-scripts.sh
```

You may assign this script to a keybinding in your window manager for quicker access or add it to your shell's PATH for easier execution.

---

> [!TIP]
> This script assumes that `bat` and `rg` are installed, which might not be the case for all users. Consider including a check for these dependencies or providing instructions to install them easily. Additionally, the use of `tail -n 37` seems arbitrary; verifying why exactly 37 lines are considered might unveil more appropriate logic or even argument-based flexibility.