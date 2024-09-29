# Get Scripts Relations

---

**get_scripts_relations.py**: This script generates a visual representation of script dependencies.

---

### Dependencies

- `matplotlib`: A library for creating static, animated, and interactive visualizations in Python.
- `networkx`: A package for the creation, manipulation, and study of complex networks.
- `fd`: A fast alternative to `find`, used to search for files and directories.
- `rg`: The Ripgrep command-line search tool, used to search for text patterns in files.

### Description

The `get_scripts_relations.py` script analyzes script dependencies in a specified directory and visualizes them using a directed graph. The script begins by defining a helper function, `run_command`, which executes shell commands and returns the output. 

It retrieves the directory containing the scripts from an environment variable `SCRIPTS` (defaulting to the current directory if not set) and uses `fd` to list all scripts in that directory. For each script, it identifies other scripts that depend on it using `rg`.

The relationships between scripts are stored in a dictionary where each key is a script name, and the associated value is a list of scripts that depend on it. 

After collecting this data, the script constructs a directed graph using `networkx`, adding nodes for each script and edges representing dependencies. 

Finally, the graph is exported in GraphGML format for use with Cytoscape and visualized using `matplotlib`.

### Usage

To run the script:

1. Ensure you have the required dependencies installed:
   ```bash
   pip install matplotlib networkx
   ```
   Make sure `fd` and `rg` are also available in your environment.

2. Set the `SCRIPTS` environment variable to your scripts directory, if needed:
   ```bash
   export SCRIPTS="/path/to/your/scripts"
   ```

3. Execute the script:
   ```bash
   python /home/matias/.scripts/get_scripts_relations.py
   ```

This will display a graph showing which scripts depend on each other.

---

> [!TIP]  
> The script currently lacks error handling for cases where `fd` or `rg` might fail, and it could benefit from comments explaining the purpose of each section. Additionally, consider allowing the user to specify the output path for the GML file to enhance flexibility.