# Display Markdown Script

---

**display_markdown.py**: Script to display markdown files in the terminal with styling

---

### Dependencies

- `rich`: A Python library for rich text and formatting in the terminal.

### Description

This script is designed to display markdown files directly in your terminal with enhanced styling using the `rich` library. By default, it styles the markdown content with the `github-dark` theme. The script presents the content inside a styled panel, providing visually appealing rounded borders with a blue border style. 

The script reads a markdown file specified by the user via command-line argument and optionally takes a second argument for the panel width. If the width is not provided or is not a number, it defaults to an adaptive width. The use of `rich`'s `Markdown` and `Panel` classes enables the script to render complex markdown syntax and present it elegantly, enhancing legibility.

### Usage

To use the script, execute it from a terminal on your Arch Linux environment as follows:

```bash
python /home/matias/.scripts/dev/display_markdown.py /path/to/markdown.md [panel_width]
```

- Replace `/path/to/markdown.md` with the path to the markdown file you wish to display.
- Optionally, specify `[panel_width]` as a numeric value to set the desired width of the styled panel.

For example, if you have a markdown file located at `/home/matias/docs/example.md`, you would run:

```bash
python /home/matias/.scripts/dev/display_markdown.py /home/matias/docs/example.md 80
```

This command will render the markdown content inside an 80-character wide panel.

---

> [!WARNING]
> The current implementation of the script contains a logic error in checking the number of arguments. Ensure that the condition `if len(sys.argv) != 2:` should correctly handle both arguments, especially when counting how many arguments are provided. Additionally, consider implementing error handling for the conversion of `panel_width` to ensure it gracefully handles invalid inputs. Consider refactoring to allow optional styling themes from the command line for versatility.