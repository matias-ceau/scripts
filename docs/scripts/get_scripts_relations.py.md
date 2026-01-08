# Script Relations Graph (SCRIPTS dependency map)

---

**get_scripts_relations.py**: Build and visualize a directed graph of script cross-references

---

### Dependencies

- `python`
- `fd` (from `fd`/`fd-find`): lists executable files in your scripts directory
- `rg` (`ripgrep`): searches for filename references inside other scripts
- `python-matplotlib` (`matplotlib`): renders the interactive graph window
- `python-networkx` (`networkx`): builds and exports the dependency graph

### Description

This script scans your scripts directory (default: current directory, or `$SCRIPTS` if set) to infer “relations” between scripts by simple textual reference:

1. It gathers all executable files under `$SCRIPTS` using `fd . -t x`.
2. For each executable script, it takes its basename (e.g. `foo.sh`) and searches for that string across the directory with `rg --files-with-matches`.
3. Matches are filtered to only include files that are themselves in the executable scripts list.
4. A directed graph is built with `networkx`:
   - Node = script filename (basename)
   - Edge `A -> B` = script `A` contains the string `B` somewhere in its contents
5. The graph is exported to `/tmp/get_scripts_relations.gml` (useful for Cytoscape), and also displayed via `matplotlib` using a spring layout.

This is particularly handy on Arch/Qtile setups where you keep many small helper scripts and want a quick overview of call chains or coupling.

### Usage

Set your scripts directory (recommended):

- `export SCRIPTS="$HOME/.scripts/bin"`

Run interactively (opens a GUI window):

- `python /home/matias/.scripts/bin/get_scripts_relations.py`

Artifacts:

- Output graph file: `/tmp/get_scripts_relations.gml`
- Interactive visualization: matplotlib window (close it to exit)

Typical “tldr” flow:

- Generate `.gml` → open Cytoscape → import `/tmp/get_scripts_relations.gml` → style/layout there.

---

> [!TIP]
> The dependency detection is substring-based, so it may produce false positives (e.g., common words matching a filename) and misses cases where scripts are invoked via absolute paths, symlinks, or without basenames. Consider parsing shell/Python calls more robustly (e.g., detect `exec`, `subprocess`, `bash -c`, shebang dispatch, `$SCRIPTS/...`), and avoid `shell=True` by using `subprocess.run([...])`. Also, `rg` will match the script referencing itself; you may want to filter self-edges.