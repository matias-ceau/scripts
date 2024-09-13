# Get Script Relations

---

**get_scripts_relations.py**: Visualizes dependencies between user scripts in a directed graph.

---

### Dependencies

- `matplotlib`: A plotting library used for creating static, animated, and interactive visualizations in Python.
- `networkx`: A library for the creation, manipulation, and study of complex networks of nodes and edges.
- `fd`: A simple, fast and user-friendly alternative to `find` for searching files.
- `rg`: A command-line search tool that recursively searches your current directory for a regex pattern.

### Description

The `get_scripts_relations.py` script is designed to analyze user-defined shell scripts and visualize their dependencies in the form of a directed graph. It utilizes the `fd` command to find all script files within a specified directory, allowing the user to set the directory via the `SCRIPTS` environment variable. If the variable is not set, it defaults to the current directory.

The script utilizes regular expressions via `rg` to identify which scripts depend on other scripts by matching their names. 

Here’s a breakdown of the main functionalities:

1. **Run Shell Commands**: The `run_command` function executes shell commands and captures their output.
2. **Construct Dependency Dictionary**: The script builds a dictionary where keys are script names and values are lists of dependent scripts matching in the user-defined directory.
3. **Graph Creation**: A Directed Graph is created using `networkx` based on the dependencies found.
4. **Visualization**: Using `matplotlib`, it draws and displays the structure of dependencies visually.

### Usage

To run this script, ensure that both `matplotlib` and `networkx` are installed in your Python environment. Then, execute the script from a terminal:

```bash
export SCRIPTS=path/to/your/scripts    # Optional, set the script directory
python /home/matias/.scripts/get_scripts_relations.py
```

The graph will be displayed, showing all your scripts and their relationships. Adjust the `SCRIPTS` environment variable to point to different directories as needed.

---

> [!TIP] 
> This script could be improved by adding error handling for scenarios when `fd` or `rg` fail. Additionally, allowing command-line arguments to specify the script directory could enhance usability, making it easier to run the script without setting environment variables.