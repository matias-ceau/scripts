# Script Launcher with FZF Integration

---

**script_launcher.sh**: Interactive script launcher using `fzf` for elegant script execution.

---

### Dependencies

- `fzf`: Command-line fuzzy finder, serves as the core interaction tool.
- `improved-fzfmenu.sh`: Custom user script for enhanced FZF menu capabilities.
- `bat`: A `cat` clone with syntax highlighting and Git integration for file previews.
- `pastel`: Color library in Rust used for converting HEX to ANSI color codes.
- `fd`: Alternate to `find`, optimized for simplicity and performance.

### Description

This script provides a sophisticated command-line interface for launching scripts using the `fzf` fuzzy finder. Depending on the input flag, it switches between a basic `fzf` or a more advanced custom menu (`improved-fzfmenu.sh`). It enriches the user experience with syntax-colored previews using `bat`, allowing users to view either the documentation in markdown or the full script source code. The script uses color coding to categorize scripts based on their extension (e.g., `.sh`, `.py`, etc.), enhancing quick visual identification. The ability to convert and apply HEX colors using `pastel` allows for aesthetic personalization of the display.

### Usage

The script can be invoked with or without the `--embedded` argument depending on the desired `fzf` interface:

```bash
./script_launcher.sh
```
or
```bash
./script_launcher.sh --embedded
```

#### Key Bindings within FZF:

- `Enter`: Execute the selected script directly.
- `Alt+Enter`: Run the script in a new terminal.
- `Ctrl+E`: Open the script in `nvim`.
- `Alt+E`: Edit the script in a new terminal with `nvim`.
- `Alt+S`: Toggle source code preview.
- `Alt+D`: Toggle documentation preview.

These features make the script an excellent tool to pair with a keybinding in your qtile window manager for quick access.

---

> [!TIP]  
> The script could include a feature to export documentation previews to PDF or HTML, providing offline access to formatted script documentation. Additionally, enhancing preview navigation with page up/down keys can improve user interaction. Also, consider enabling multiple script selections and additional toggle options for headers or verbose logs to expand functionality.