# FZF Menu Helper

---

**fzfmenu.sh**: Helper script to replicate `dmenu` functionality using `fzf` and terminal emulator (`alacritty`).

---

### Dependencies

- `fzf`: A command-line fuzzy finder to filter input text interactively.
- `alacritty`: Terminal emulator to display the `fzf` interface in this script.
- `/proc`: Requires Linux `/proc` filesystem to handle file descriptors for input/output streams.
- Arch Linux-based configuration with `bash`.

### Description

This script acts as a helper function for creating an `fzf`-based menu system akin to `dmenu`. Instead of overlaying text on the screen, it opens a new terminal window running `fzf` inside it. Highlights include:

1. Escaping all arguments passed to the script to avoid parsing issues with special characters using `printf`.
2. Joining processed, escaped arguments into a single string (`fzf_args`).
3. Opening a new `alacritty` terminal (titled `fzfmenu`) to execute `fzf` with the specified arguments (`$fzf_args`).
4. Using the process ID (`$$`) to manage input/output redirection via the `/proc` pseudo-filesystem, ensuring seamless input and output with the parent shell.

The script relies on the Arch Linux environment and `alacritty` terminal, ensuring visual interaction during command searching or execution.

### Usage

This script is best utilized as part of larger workflows to present fuzzy filtering options within your window manager (e.g., `qtile`). Examples:

#### Interactive Testing
1. Save the script to a file, e.g., `/home/matias/.scripts/bin/fzfmenu.sh`.
2. Make it executable:
   ```bash
   chmod +x /home/matias/.scripts/bin/fzfmenu.sh
   ```
3. Run it with input piped via the terminal:
   ```bash
   echo -e "Option1\nOption2\nOption3" | /home/matias/.scripts/bin/fzfmenu.sh
   ```

#### Qtile Keybinding
Assign this script to a key in your `qtile` configuration to quickly invoke fuzzy menus:
```python
Key([mod], "m", lazy.spawn("~/.scripts/bin/fzfmenu.sh"))
```

#### Custom Arguments
Pass additional options to `fzf`, for example:
```bash
echo -e "One\nTwo\nThree" | /home/matias/.scripts/bin/fzfmenu.sh --reverse
```
This would enable reverse sorting for the `fzf` menu.

---

> [!TIP]
> - Replace `alacritty` with your preferred terminal emulator, like `xterm` or `st`.
> - Add conditions to ensure `fzf` executes correctly even if arguments are improperly escaped.
> - Consider additional error handling for scenarios where `/proc` is unavailable or file descriptors fail to open. A fallback method might enhance script robustness.
> - Adding usage comments or help flags (`-h` or `--help`) for clarity could improve usability.
> - Note that capturing additional environment-specific parameters might make the script more portable.