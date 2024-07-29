# fzfmenu.sh

**Script Description**

This script is a Bash shell script that uses `xterm` and other external commands to create a customizable menu system similar to dmenu. The script utilizes the `fzf` (Fuzzy Finder) command-line search tool and the `urxvt` terminal emulator.

**Functionality**

When executed, this script:

1. Launches an instance of the `xterm` terminal with a title of "fzfmenu".
2. Runs a new Bash shell session within that terminal.
3. Passes two file descriptors as arguments to the new shell:
	* `0` (stdin): The standard input is redirected from `/proc/$$/fd/0`, which typically points to the original terminal's stdin. This allows capturing user input and passing it to `fzf`.
	* `1` (stdout): The standard output is redirected to `/proc/$$/fd/1`, which sends the result of the `fzf` command back to the same terminal.

**Expected Usage**

This script seems to be designed as a helper function for a larger setup, possibly with a custom hotkey or binding to trigger it. When invoked, it will display an interactive menu within the `xterm` window, using `fzf` to search and filter items based on user input. The output of `fzf` is sent back to the original terminal's stdout.

Please note that this script assumes a Unix-like environment with `xterm`, `bash`, and `fzf` installed.