# Script Relations Visualizer

---

**get_scripts_relations.xsh**: Scans `$SCRIPTS` directory for scripts and visualizes intra-folder dependencies as a directed graph

---

### Dependencies

- `xonsh`: Shell to run `.xsh` scripts, blends Python and shell
- `fd`: Fast alternative to `find`, used for listing scripts in `$SCRIPTS`
- `basename`: CLI utility to get the filename, used to simplify paths
- `rg` (ripgrep): Fast text searching tool to find dependencies/uses
- `python` (with modules: `json`, `networkx`, `matplotlib`): For graph generation and visualization

**Python packages:**
- `networkx`: For graph representation
- `matplotlib`: For plotting the graph

### Description

This script collects the relations between scripts inside your `$SCRIPTS` directory by:
- Listing all scripts in `$SCRIPTS` (using `fd`)
- For each script, searching for references to its basename within the script directory (using `rg`)
- Building a dictionary mapping each script to those in which it appears to be referenced
- Using Python (via xonsh) to construct a directed graph (with NetworkX) that shows which scripts depend on which others
- Rendering and displaying a dependency graph via `matplotlib`

Key variables/functions:
- **dic**: Dictionary mapping script basenames to lists of scripts importing/calling them
- **networkx**: Handles the construction of the dependency graph (nodes = scripts, edges = dependency links)
- **matplotlib**: Visualizes the dependency network as a directed graph

**Note:** Only scripts whose names are referenced (by basename match) are considered as dependencies.

### Usage

Typically, set your `$SCRIPTS` to the directory you want to analyze:

```xonsh
$SCRIPTS = ~/scripts/
./get_scripts_relations.xsh
```

#### Quick Example

```xonsh
export SCRIPTS=~/scripts
xonsh /home/matias/.scripts/dev/get_scripts_relations.xsh
```

- Run this either in a terminal or bind the command to a key in Qtile to quickly visualize your scripts' interconnections.
- The script opens a Matplotlib window with an interactive plot of the relations (no files are written).

---

> [!TIP]
>
> - The script's dependency detection is based purely on a basename match, so it may generate false positives/negatives if script names are generic or commonly referenced in other contexts.
> - There's no exclusion for comments or string matches, so the presence of a script name anywhere in a file is treated as a dependency.
> - Consider outputting the graph to a file for integration into documentation or scripts!
> - Error handling is minimal — missing dependencies or unset `$SCRIPTS` will cause the script to fail.
> - For large script directories, the graph layout may be cluttered. Adding options for filtering or subgraphing could help.