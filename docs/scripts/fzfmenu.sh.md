# fzfmenu - A Fuzzy Finder Menu in xterm

---

**fzfmenu.sh**: A helper script to create a fuzzy finder menu using `fzf` within `xterm`.

---

### Dependencies

- `bash`: The shell in which the script is run.
- `fzf`: A command-line fuzzy finder tool that allows you to search and filter text efficiently.
- `xterm`: A terminal emulator that will execute the fuzzy finder in a new window.

### Description

This script offers users a fuzzy finding capability similar to `dmenu` by utilizing the `fzf` tool within an `xterm` terminal. It is flexible enough to accept any arguments, which are processed and escaped to ensure they are safely passed to the `fzf` command. The resulting selection made within the `fzf` interface can be retrieved or redirected as needed.

The script works as follows:
1. It first captures all the command-line arguments provided to the script.
2. Each argument is escaped using `printf %q`, making them safe for passing to other commands.
3. The arguments are then joined into a single string to form the command to execute.
4. A new `xterm` window is launched with the title 'fzfmenu', which executes the `fzf` command and reads either from standard input or from a list of items specified by the arguments.

### Usage

To utilize this script, simply pass the items you want to filter as arguments directly from the command line. Make sure that `fzf` is installed, as well as `xterm`. Here’s a quick guideline on how to invoke the script:

```bash
./fzfmenu.sh item1 item2 item3 item4
```

This will open an `xterm` window displaying a fuzzy search interface containing `item1`, `item2`, `item3`, and `item4`. After making a selection in `fzf`, the chosen item(s) will be printed to standard output.

---

> [!TIP] 
> Consider adding options for customizing the look of `fzf` or specify a default set of items if none are provided, which could enhance user experience. Additionally, handling cases where `fzf` is not installed could prevent errors and guide users towards installation steps.