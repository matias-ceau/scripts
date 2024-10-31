# Pastel Help and Preview Utility

---

**help-pastel.sh**: Enhanced help command for `pastel` with preview features using `fzf`.

---

### Dependencies

- `pastel`: A command-line tool for working with colors.
- `rg` (ripgrep): A line-oriented search tool that recursively searches your current directory for a regex pattern.
- `bat`: A `cat` clone with syntax highlighting and Git integration.
- `fzf`: A command-line fuzzy finder.
- `display_markdown.py`: A script to display markdown content.
- `curl`: Command-line tool for transferring data with URL syntax.

### Description

This script facilitates exploring the `pastel` command's subcommands and options by using a powerful combination of other command-line utilities. It begins by parsing the help output of `pastel` to identify subcommands using `ripgrep`. The output is piped through `bat`, formatted, and fed into `fzf` for an interactive selection. A key feature is the preview window in `fzf`, which provides detailed help on selected items by calling `pastel` with its subcommands or displaying the relevant section of the online README for `pastel`.

The script essentially simplifies and enhances interaction with `pastel` by leveraging colorful output, syntax highlighting, and interactive selection.

### Usage

To utilize this script, ensure it is executable and available in your system's `PATH`. Then, you can execute it directly in your terminal:

```bash
./help-pastel.sh
```

The script does not require any command-line arguments. Upon execution, it displays an interactive menu of `pastel` subcommands and their options. Select a command to see its detailed help or refer to the README if required.

This script can be bound to a key combination in your qtile window manager for easier access, or you can just run it whenever required from the terminal.

---

> [!NOTE] 
> Consider local error handling to manage scenarios where dependencies are not installed, as there are several external tools. Additionally, you might want to explore offline support for cases where network access to the GitHub README could be problematic.