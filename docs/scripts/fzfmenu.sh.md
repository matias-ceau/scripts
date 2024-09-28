# fzfmenu: Simplified Application Launcher with fzf and xterm

---

**fzfmenu.sh**: A lightweight alternative to dmenu using `fzf` within an `xterm` terminal.

---

### Dependencies

- `fzf`: A general-purpose command-line fuzzy finder.
- `xterm`: A standard terminal emulator for the X Window System.
- `bash`: The GNU Bourne Again SHell to run the script.

### Description

This script serves as a substitute for `dmenu`, leveraging the power of `fzf` for fuzzy finding capabilities and `xterm` as the terminal emulator. The primary function of this script is to facilitate the launching of commands selected through a user-friendly fuzzy search interface.

The script processes and escapes any input arguments to safely pass them to `fzf`. It executes `fzf` under an `xterm` session with the title "fzfmenu", which acts on standard input and outputs the selected result to the standard output.

### Usage

The script should be run from a terminal, or it can be assigned to a keybinding within your qtile setup for quick access. Given its nature, it expects input from the user via piped data.

Here's a basic usage example:

```bash
# Assuming you have a list of applications in a file 'applications.txt'
cat applications.txt | /home/matias/.scripts/fzfmenu.sh
```

If integrated into `qtile`, you might want to bind the script to a key to launch apps quickly, using something like:

```python
Key([mod], "space", lazy.spawn("/home/matias/.scripts/fzfmenu.sh"))
```

This will open `fzf` inside an xterm window, showing you the list of options passed via standard input, allowing you to select one using fuzzy search.

---

> [!TIP]
> Currently, the script relies on standard input and output file descriptors pointing to `/proc/$$/fd/0` and `/proc/$$/fd/1`. Error handling for closed descriptors or invalid input might improve robustness. Additionally, consider incorporating a fallback or error notification for systems where `xterm` or `fzf` isn't available.