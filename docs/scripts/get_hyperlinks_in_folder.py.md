# Get Hyperlinks in Folder

---

**get_hyperlinks_in_folder.py**: A Python script to identify hyperlinks in Markdown notes and visualize their relationships as a graph.

---

### Dependencies

- `python`: The main programming language used for the script.
- `click`: A package for creating command-line interfaces; it simplifies argument parsing.
- `matplotlib`: A plotting library used for drawing the graph representation.
- `networkx`: A library for the creation, manipulation, and study of complex networks.
- `tqdm`: A fast, extensible progress bar for Python; it provides a visual indication of progress.
- `fd`: A simple, fast, and user-friendly tool to find entries in the file system.
- `rg (ripgrep)`: A command-line search tool that recursively searches your current directory for a regex pattern, faster than other search tools.
- `jq`: A lightweight and flexible command-line JSON processor.

### Description

This script is designed to locate all Markdown files in a specified directory, extract hyperlinks (noted by [[...]] syntax), and create a visual representation of these connections in a directed graph format.

1. The script utilizes `click` for command-line interaction, allowing users to specify the directory containing Markdown files.
2. It uses the `fd` command to efficiently list Markdown files and `rg` combined with `jq` to extract hyperlinks from those files.
3. It constructs a directed graph using the `networkx` library, where nodes represent individual Markdown files, and edges represent hyperlinks between them.
4. Advanced graph visualization is performed using `matplotlib`, which allows for an intuitive view of the relationships between notes.

### Usage

To use the script, simply run it from the terminal. You can specify an alternative path containing your Markdown files and optionally choose to visualize the hyperlink graph. Here’s how you can run the script:

```bash
python get_hyperlinks_in_folder.py --path /path/to/your/notes --draw
```

- `--path`: (Optional) Specify the path to the folder with Markdown files (defaults to current directory).
- `--draw`: (Optional) Include this flag to generate and display the graph of links.

---

> [!TIP] 
> While the script successfully builds relationships between Markdown files, it could be improved by implementing error handling for cases where no Markdown files are found or when the graph is empty. Additionally, providing an option to export the graph in various formats (like PNG or SVG) could enhance usability.