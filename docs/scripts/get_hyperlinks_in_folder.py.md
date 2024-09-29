# Get Hyperlinks in Folder

---

**get_hyperlinks_in_folder.py**: Script to extract Markdown hyperlinks in a directory and visualize them as a graph.

---

### Dependencies

- `click`: For creating command-line interfaces with options and flags.
- `matplotlib`: Required for visualizing the graph representation of the hyperlinks.
- `networkx`: Used to create and manipulate complex networks and graphs.
- `tqdm`: Provides a fast and extensible progress bar for loops.
- `fd`: A simple, fast alternative to `find` for finding files.
- `rg` (ripgrep): For fast searching of text within files.
- `jq`: A lightweight and flexible command-line JSON processor.

### Description

This script is designed to search a specified directory for Markdown files and extract hyperlinks formatted as `[[link]]`. It does this by leveraging the `fd` command to find Markdown files and `ripgrep` to search for links within those files. The extracted links are then represented in a directed graph using `networkx`, and can be visualized using `matplotlib`.

**Key Functions:**

- `get_search_path(path)`: Determines the directory path to search for Markdown files.
- `list_all_notes(path)`: Uses `fd` to list all Markdown files in the specified directory and their associated identifiers.
- `get_references(path)`: Utilizes `ripgrep` and `jq` to find all hyperlinks in the Markdown files.
- `get_hyperlink_id(link, all_files)`: Maps each hyperlink to its corresponding file identifier.
- `get_nodes_and_edges(data, all_files)`: Constructs nodes and edges for the graph representation based on the extracted links.
- `create_graph(nodes, edges)`: Initializes and populates a directed graph with nodes and edges.
- `draw_graph(graph)`: Renders the graph visually using `matplotlib`.

### Usage

You can run this script directly from the terminal. Here's the basic command structure:

```bash
python3 get_hyperlinks_in_folder.py --path /path/to/your/notes --draw
```

- `--path`: Specify the directory containing your Markdown files. Defaults to the current directory.
- `--draw`: Optional flag; include it if you want to visualize the graph.

### Example

To search the current directory for Markdown files and visualize the hyperlinks, use:

```bash
python3 get_hyperlinks_in_folder.py --draw
```

To specify a different directory:

```bash
python3 get_hyperlinks_in_folder.py --path /home/matias/notes --draw
```

---

> [!TIP]
> The script relies on external commands (`fd`, `rg`, and `jq`); make sure they are installed on your system for proper functionality. Additionally, consider implementing error handling for cases where no Markdown files are found in the specified path or where link extraction yields no results. This will enhance the user experience and prevent unexpected crashes.