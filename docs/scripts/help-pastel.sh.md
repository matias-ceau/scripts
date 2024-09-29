# Help Pastel Script

---

**help-pastel.sh**: A script to enhance the `pastel` command help display with capabilities for previewing.

---

### Dependencies

- `pastel`: A command-line tool for working with colors, required to access the help and subcommands.
- `rg` (ripgrep): A line-oriented search tool that recursively searches your current directory.
- `cut`: A utility to remove sections from lines in files.
- `bat`: A cat clone with syntax highlighting, used for pretty-printing.
- `fzf`: A general-purpose command-line fuzzy finder, used for interactive selection.
- `display_markdown.py`: A script to display markdown files, enhance the README preview.

### Description

The `help-pastel.sh` script is designed to provide an interactive help interface for the `pastel` command. The script works by extracting the relevant help information from `pastel -h`, identifying the relevant section that lists its subcommands, and then allows you to view it interactively.

Here’s a breakdown of the key functionality:

1. **Line Extraction**: The script finds the line number in the `pastel` help output that marks the start of the subcommands section.
2. **Displaying Help**: It displays a specific range of lines from the `pastel` help using `bat`, which enhances visibility with syntax highlighting.
3. **README Integration**: It also integrates the `README.md` documentation into the display, allowing users to see supplementary information.
4. **Interactive Selection**: By using `fzf`, users can interactively select a subcommand to view detailed help. The script employs a preview feature where if the selected command's help differs from the README, it shows the command's specific help information.

### Usage

To run the script, simply execute it in the terminal:

```bash
bash /home/matias/.scripts/help-pastel.sh
```

You can also create a keybinding in your Window Manager (qtile) to execute this script quickly. For example, you might set it to `Mod + H` in your qtile configuration.

```python
# Example keybinding in qtile config.py
from libqtile import qtile
from libqtile.config import Key

keys = [
    Key([mod], 'h', lazy.spawn('/home/matias/.scripts/help-pastel.sh')),
]
```

---

> [!TIP] 
> Consider adding error handling to check if dependencies like `pastel` or `fzf` are installed before executing the script. Additionally, it could be helpful to add comments in the code for better maintainability, especially in the preview handling section. Furthermore, providing usage instructions directly inside the script as comments will greatly aid users who may not check the documentation.