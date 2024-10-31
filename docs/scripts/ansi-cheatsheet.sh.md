# ANSI Escape Code Cheatsheet

---

**ansi-cheatsheet.sh**: Generates a cheatsheet for ANSI escape codes

---

### Dependencies

- `bat`: A cat clone with wings, providing syntax highlighting. Please ensure it is installed on Arch Linux via the AUR or your preferred package manager.

### Description

This script provides a comprehensive cheatsheet for ANSI escape codes. ANSI escape codes are sequences used to control cursor location, color, and formatting in terminal emulators. The provided information covers a wide range of codes including text formatting, text colors, cursor movement, and miscellaneous cursor operations.

The script leverages the `bat` command to display the cheatsheet with markdown formatting. It employs a here document (`<< EOF ... EOF`) to embed the markdown content directly within the script, which `bat` then renders with syntax highlighting.

### Usage

To view the ANSI Escape Code Cheatsheet, run the following command in your terminal:

```bash
~/.scripts/bin/ansi-cheatsheet.sh
```

Make sure the script is executable. You can set the executable permission by running:

```bash
chmod +x ~/.scripts/bin/ansi-cheatsheet.sh
```

This script can be run from any terminal. It is particularly useful when assigned to a shortcut key within qtile for quick access. Use the following qtile keybinding snippet for reference:

```python
Key([mod, "shift"], "c", lazy.spawn("~/.scripts/bin/ansi-cheatsheet.sh")),
```

This example assumes that the modifier key is stored in a variable named `mod`.

---

> [!TIP]
> Consider adding command-line options to filter specific sections of the cheatsheet, allowing users to target exactly what they need. Additionally, you might include a brief explanation of the history and usage scenarios of ANSI codes to enrich the script's educational value.