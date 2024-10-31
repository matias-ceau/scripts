# Extracting Hyperlinks and Visualizing from Markdown Notes

---

**get_hyperlinks_in_folder.py**: Extract and visualize internal hyperlinks from Markdown files in a folder

---

### Dependencies

The script relies on several external dependencies, which include:

- `python`: The script is written in Python and thus requires a Python interpreter.
- `click`: A Python package for creating command-line interfaces.
- `matplotlib`: A plotting library for Python, used to draw graphs.
- `networkx`: A Python library for creating, manipulating, and studying the structure of networks.
- `tqdm`: Provides a fast, extensible progress bar for loops in Python.
- `fd` and `rg` (ripgrep): Command-line tools used here to search for files and text, respectively.
- `jq`: A command-line JSON processor for parsing and formatting JSON output.
- Arch Linux users can install these dependencies using `pacman` for `fd` and `ripgrep`, and `pip` for Python libraries.

### Description

This script is designed to parse and visualize the hyperlink structure of Markdown notes in a specified directory. It uses command-line tools to identify links within Markdown files, construct a directed graph representing these links, and optionally draw the graph. The process involves several key steps:

1. **Determine Search Path**: Establishes the directory to search for `.md` files, utilizing environment variable expansion and user directory expansion.
  
2. **List Notes**: Uses `fd` to list all markdown files in the specified directory.

3. **Find Hyperlinks**: Employs `rg` with a regex pattern and JSON output to locate all internal links within these files, further parsed with `jq`.
   
4. **Graph Construction**: Maps file paths to IDs, extracts links, and builds nodes and edges for a directed graph using `networkx`.

5. **Visualization**: If enabled, draws the graph using `matplotlib` to depict the links between notes.

### Usage

To execute the script, use the following command format:

```bash
python /home/matias/.scripts/bin/get_hyperlinks_in_folder.py --path /path/to/notes --draw
```

- The `--path` option allows you to specify a folder containing your Markdown notes. It defaults to the current directory (`.`) if not provided.
- The `--draw` flag enables the graphical output of the hyperlink structure.

For Arch Linux and a window manager like qtile, consider creating a keybinding for this script to streamline your workflow.

---

> [!NOTE]  
> This script, while effective, could benefit from additional error handling and logging for handling large directories or more complex Markdown structures. Moreover, integrating `argparse` for more advanced command-line argument parsing might enhance usability and flexibility.