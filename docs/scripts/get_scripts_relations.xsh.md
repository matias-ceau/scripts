# get_scripts_relations.xsh - Script Relationship Visualizer

---

**/home/matias/.scripts/dev/get_scripts_relations.xsh**: Visualizes inter-script dependencies based on file content scanning

---

### Dependencies

- `xonsh`: The shell environment used to execute the script.
- `fd`: A fast alternative to find for listing files within the scripts directory.
- `ripgrep (rg)`: For searching file content to detect references among scripts.
- `basename`: Utility used to extract the filename from a file path.
- `networkx`: A Python package for creating and manipulating complex networks.
- `matplotlib`: A Python library for plotting and visualizing graphs.

### Description

This script is designed to map the relationships between various scripts located within a designated directory (referenced by the `$SCRIPTS` variable). It works by first listing all script files using `fd` and then iteratively scanning each script file for any references to other scripts using `rg` (ripgrep). The logic filters the search results to only include files present in the original script list, ensuring accurate detection of inter-dependencies.

After gathering relationship data, the script builds a directed graph with `networkx`. Each script is represented as a node, and an edge is drawn from one script to another if a dependency (or reference) is detected. The script employs a spring layout algorithm to position the nodes aesthetically, and then it uses `matplotlib` to render the graph visually. In the final visualization, nodes are colored light blue, and arrowed edges denote the dependency direction. The plot window is displayed interactively, allowing for manual inspection of the dependencies.

### Usage

Before running the script, ensure the environment variable `$SCRIPTS` is set to the correct directory containing your scripts. To run the script, make it executable and then execute it from a terminal:

$ chmod +x /home/matias/.scripts/dev/get_scripts_relations.xsh  
$ /home/matias/.scripts/dev/get_scripts_relations.xsh

Alternatively, run it directly with xonsh:

$ xonsh /home/matias/.scripts/dev/get_scripts_relations.xsh

The script will open a matplotlib window with the graph visualization. The script is well-suited for integration with keybindings in qtile, automating dependency visualization tasks on Arch Linux.

> [!TIP] Consider improving the script by adding error handling for cases where `$SCRIPTS` is not defined or empty. Also, including command-line options to filter or customize graph attributes (e.g., node colors and sizes) could enhance its usability for larger projects.