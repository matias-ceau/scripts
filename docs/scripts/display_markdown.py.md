# Display Markdown in Terminal with Rich

---

**display_markdown.py**: A script to render Markdown files in the terminal using the Rich library.

---

### Dependencies

- `rich`: A Python library for rich text and beautiful formatting in the terminal. It is used here to render Markdown content with specific styles and display in panels.

### Description

The `display_markdown.py` script allows users to display Markdown files nicely formatted in the terminal. It utilizes the `rich` library to process and render Markdown content, providing options for panel styling and width.

The main functionality revolves around reading a Markdown file specified in the command line and displaying it within a panel in the terminal. The script allows for customizable styling of the Markdown via the `md_style` parameter, defaulting to "github-dark". 

The script's structure includes:
- A `main()` function that handles arguments, reads the file, and renders the output.
- Error handling for file operations ensures robust execution and user feedback.

### Usage

To use this script, run it in the terminal with the following command:

```bash
python display_markdown.py <markdown_file>
```

Replace `<markdown_file>` with the path to your Markdown file. You can optionally specify the panel's width by passing it as a second argument:

```bash
python display_markdown.py <markdown_file> <panel_width>
```

Here's a simple example:

```bash
python display_markdown.py my_notes.md 50
```

This command will display the contents of `my_notes.md` in a panel that is 50 characters wide.

---

> [!TIP]  
> The current implementation has a small bug in argument handling. The check for numeric width `if sys.argv[2].isnumeric():` occurs only if `len(sys.argv) != 2`, which seems incorrect. It should be placed after checking that `len(sys.argv) == 3`. Additionally, the default value for `panel_width` should be set when it's `None`, instead of relying solely on command line input.