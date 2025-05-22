# Script Relations Visualizer

---

**get_scripts_relations.py**: Scans user scripts to detect and visualize script dependencies.

---

### Dependencies

- `python` (Python 3.x)
- `matplotlib` (`matplotlib` Python module; used for graph plotting)
- `networkx` (`networkx` Python module; used for network analysis and visualization)
- `fd` (Rust-based alternative to `find`; used for fast file discovery)
- `rg` (`ripgrep`; used for quickly searching file content)
- `SCRIPTS` environment variable (optional; defines base scripts directory—defaults to current dir)

---

### Description

This script analyzes script files (presumed to be in your `${SCRIPTS}` directory or current working directory if the variable is unset) to determine relationships based on inclusion or call patterns inferred via filename matching. Dependencies between scripts are mapped using the following steps:

1. **File Discovery:** Lists all executable files using `fd`.
2. **Dependency Mapping:** For each script, uses `ripgrep` (`rg`) to find references (by filename) in other scripts, implying a dependency or inclusion.
3. **Network Construction:** Builds a directed dependency graph using `networkx`.
4. **Visualization:** Visualizes the graph using `matplotlib` with nodes as scripts and directed edges as dependencies.
5. **Export:** Saves the dependency network in GraphGML format at `/tmp/get_scripts_relations.gml` for use with Cytoscape or other tools.

The script is particularly useful for understanding and maintaining a growing collection of user scripts, especially in complex or organically grown Arch setups.

---

### Usage

This script is intended to be run from a terminal and is most useful when pointed at your scripts repository:

```sh
# Ensure dependencies are installed
pip install matplotlib networkx
sudo pacman -S fd ripgrep

# Option 1: Run using the SCRIPTS env variable
export SCRIPTS="$HOME/.scripts/bin"
python /home/matias/.scripts/bin/get_scripts_relations.py

# Option 2: Run with current directory as script base
cd ~/.scripts/bin
python get_scripts_relations.py
```

Once run, a matplotlib window will appear visualizing the dependencies. The graph is also exported as `/tmp/get_scripts_relations.gml`.

---

> [!TIP]
> **Potential Improvements & Considerations**  
> - **Accuracy:** The script assumes any mention of a script filename in another script is a dependency, which may produce false positives or miss script-sourced dependencies (e.g., variable usage or indirect calls).
> - **Scalability:** With a large number of scripts or large scripts, visualization could become cluttered and slow; consider filtering or grouping in the analysis.
> - **Customization:** Hardcodes export location (`/tmp/get_scripts_relations.gml`)—making this configurable would improve usability.
> - **Cross-Platform Note:** Designed for UNIX-like environments; will not work natively on Windows.  
> - **Visualization:** Consider using Cytoscape for larger graphs, as matplotlib-based layouts can become unreadable for bigger script collections.  
> - **Refinement:** If scripts reference others with relative paths or sourced includes (`. filename`), these may not be detected; further static analysis or parsing might yield more precise results.