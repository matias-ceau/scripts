# Hyperlink Note Graph Generator

---

**get_hyperlinks_in_folder.py**: A script to create a directed graph of hyperlinks within Markdown notes.

---

### Dependencies

- `fd`: A simple, fast and user-friendly alternative to 'find'.
- `rg`: `ripgrep` is a line-oriented search tool that recursively searches your current directory for a regex pattern.
- `jq`: A lightweight and flexible command-line JSON processor.
- `matplotlib`: A Python plotting library to create static, interactive, and animated visualizations.
- `networkx`: A Python library for the creation, manipulation, and study of the structure, dynamics, and functions of complex networks.
- `click`: A Python package for creating command-line interfaces.
- `tqdm`: A library for adding progress bars to Python scripts.

### Description

This script, **get_hyperlinks_in_folder.py**, is designed to analyze a directory of Markdown files and generate a directed graph of hyperlinks between these files. It uses several command-line tools (`fd`, `rg`, `jq`) to efficiently parse and extract references formatted as `[[Link Title]]` from your Markdown notes. It then compiles these references into a network graph using `networkx`, with nodes representing individual notes and edges representing hyperlinks between them. Optional visualization of the graph is provided through `matplotlib`.

The primary functions include:
- **get_search_path()**: Determines the folder path to search for Markdown files.
- **list_all_notes()**: Lists all `.md` files in the specified directory.
- **get_references()**: Uses `rg` and `jq` to extract hyperlink references from each Markdown file.
- **create_graph()**: Constructs the graph using NetworkX.
- **draw_graph()**: Visualizes the graph using Matplotlib.

### Usage

To use this script, execute it from a terminal. You can optionally specify a directory to search and a flag to draw the graph:

```bash
python get_hyperlinks_in_folder.py --path /path/to/your/notes --draw
```

- `--path`: Specify the directory containing your Markdown files. Defaults to the current directory.
- `--draw`: Add this flag to visualize the graph using Matplotlib.

Example command:

```bash
python get_hyperlinks_in_folder.py --path ~/Documents/notes --draw
```

Executing the above command will generate and display a graph of hyperlinks between Markdown files in the specified directory.

---

> [!TIP]
> The script relies heavily on shell utilities like `fd`, `rg`, and `jq`. Ensure these are installed and properly configured in your system's `$PATH` on Arch Linux. Additionally, adding error handling for subprocess calls could improve robustness.