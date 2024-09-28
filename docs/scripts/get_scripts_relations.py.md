# Visualizing Script Dependencies

---

**get_scripts_relations.py**: Visualizes relationships between scripts in a directory using a graph.

---

### Dependencies

- `fd`: A fast and user-friendly alternative to `find`. Used for locating script files.
- `rg`: Short for Ripgrep, a line-oriented search tool that recursively searches the directory for a regex pattern.
- `matplotlib`: A comprehensive library for creating static, animated, and interactive visualizations in Python.
- `networkx`: A Python package for the creation, manipulation, and study of complex networks of nodes and edges.

### Description

This script, `get_scripts_relations.py`, helps visualize the relationships between various scripts located in a specified directory. By utilizing the environment variable `SCRIPTS` or the current directory, it searches for executable script files using `fd`. It then identifies which scripts reference each other using `rg`. The results are stored in a dictionary that maps each script to its dependencies.

With this dependency information, the script constructs a directed graph using `networkx` where each node represents a script, and an edge illustrates a dependency between two scripts. The graph is not only displayed using `matplotlib`, but it is also exported in GraphGML format to `/tmp/get_scripts_relations.gml`, which can be further analyzed or visualized in tools like Cytoscape.

### Usage

To use the script, ensure your environment is set up with the necessary dependencies.

1. Ensure `fd` and `rg` are installed on your Arch Linux system.
   ```sh
   sudo pacman -S fd ripgrep
   ```
2. Make sure the Python packages `matplotlib` and `networkx` are available.
   ```sh
   pip install matplotlib networkx
   ```
3. Set the `SCRIPTS` environment variable to your script directory if it's not the current working directory.
   ```sh
   export SCRIPTS=/path/to/your/scripts
   ```
4. Run the script:
   ```sh
   python /home/matias/.scripts/get_scripts_relations.py
   ```

This will generate a visualization of the dependencies and save the GraphGML file to your `/tmp` directory.

---

> [!TIP]
> The script currently assumes that all script files are executable and does not distinguish between script types. Implementing filtering based on file extensions could enhance accuracy. Additionally, consider adding error handling to improve robustness, especially around external command executions with `subprocess`.