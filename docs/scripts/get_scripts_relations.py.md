# Visualizing Script Dependencies

---

**get_scripts_relations.py**: Visualizes dependencies among scripts in a directory

---

### Dependencies

- `fd`: A simple, fast and user-friendly alternative to 'find', used to list executable scripts.
- `rg` (ripgrep): A line-oriented search tool that recursively searches your current directory for a regex pattern.
- `matplotlib`: A plotting library for Python, used to visualize the graph.
- `networkx`: A Python package for the creation, manipulation, and study of the structure, dynamics, and functions of complex networks.

### Description

This script is designed to visualize relationships and dependencies between your executable scripts within a specified directory. The script primarily utilizes `fd` to find scripts and `ripgrep` to identify dependency relations among them. Dependencies are visualized using `networkx` and `matplotlib`, which render a directed graph representing these relationships.

The script first sets a directory (`SCRIPTS` environment variable or current directory) to search for scripts, identified by their executable status. For each script found, the script checks for other scripts it depends on by searching for filenames in the content of each script within the directory. It organizes these dependencies into a directed graph, which is both saved in GraphGML format to `/tmp/get_scripts_relations.gml` and visualized using a plot.

### Usage

To execute this script, ensure the required dependencies are installed. Then, run the script from the terminal:

```bash
python /home/matias/.scripts/bin/get_scripts_relations.py
```

Ensure that the `SCRIPTS` environment variable is set to the directory containing your scripts, or the script will default to the current directory.

- **Example**: Setting the `SCRIPTS` directory and then executing the script:
  ```bash
  export SCRIPTS="/path/to/your/scripts"
  python /home/matias/.scripts/bin/get_scripts_relations.py
  ```

- The output is a visual representation as a pop-up window showing nodes (scripts) and directed edges (dependencies).

---

> [!TIP] 
> - The script assumes that scripts are found using their executable status, which might not always identify all potential script files unless they are marked as executable.
> - Including error handling for `subprocess` calls can help catch and debug potential command-line issues.
> - Consider adding command-line arguments to dynamically specify output paths or filter criteria for more flexibility.