# Get Scripts Relations

---

**get_scripts_relations.py**: Generate and visualize dependencies among user scripts.

---

### Dependencies

- `fd`: A simple, fast tool for discovering entries in your filesystem.
- `rg`: A command-line search tool that recursively searches your current directory for a regex pattern.
- `matplotlib`: A library for creating static, animated, and interactive visualizations in Python.
- `networkx`: A library for the creation, manipulation, and study of the structure, dynamics, and functions of complex networks.

### Description

This script is designed to analyze dependencies among various user scripts present in a specified directory. By using command-line tools such as `fd` and `rg`, it identifies which scripts are dependent on or called by others.

1. The script starts by importing the required libraries: `os`, `subprocess`, `matplotlib`, and `networkx`.
2. It defines a function `run_command`, which executes a shell command and returns its output.
3. The script retrieves a list of script files from the directory specified by the `SCRIPTS` environment variable or defaults to the current directory.
4. For each script, it checks which other scripts reference it using the `rg` tool to find matches.
5. It populates a directed graph using `networkx`, where each script is a node and dependencies are represented as directed edges.
6. Finally, the graph is exported to a GML file for further analysis in Cytoscape, and it is plotted using `matplotlib`.

### Usage

To use the script, follow these steps:

1. Make sure the required dependencies are installed.
2. Set the `SCRIPTS` environment variable to point to your scripts directory (optional).
3. Run the script in your terminal:
   ```bash
   python /home/matias/.scripts/get_scripts_relations.py
   ```
4. The generated graph will display on the screen and can also be found in `/tmp/get_scripts_relations.gml`.

---

> [!TIP]  
> While the script is functional, it may face performance issues with a large number of scripts. Consider implementing a caching mechanism to store results from previous runs to enhance efficiency. Additionally, adding error handling for subprocess calls could improve robustness.