# Visualize Markdown Note Hyperlinks in a Folder

---

**get_hyperlinks_in_folder.py**: Scans a folder of markdown notes and builds a hyperlink graph visualization.

---

### Dependencies

- `python` (with modules: `click`, `matplotlib`, `networkx`, `tqdm`)
- `fd` : Fast alternative to `find` for listing markdown files.
- `rg` (ripgrep): Recursively searches markdown links in notes.
- `jq` : Processes line-oriented json from ripgrep output.
- `bash` (subprocesses)
- All dependencies should be installed and available in `PATH`. On Arch Linux, install with `pacman` or `pip` as appropriate.

### Description

This script parses a directory for markdown (`.md`) notes and analyzes all internal wiki-style links (`[[note name]]` or `[[note name|alias]]`). The information is compiled into a directed graph representing hyperlinks between notes. Optionally, the script can visualize the network using matplotlib (via `networkx`).

#### Script Workflow

1. **Path Resolution:**
   - Expands variables/tilde and validates the provided note folder.
2. **Markdown File Listing:**
   - Uses `fd` to quickly list all markdown files in the search path.
3. **Reference Extraction:**
   - Uses `ripgrep` (`rg`) to find wiki-style links in notes.
   - Pipes results into `jq` to parse out file/link targets efficiently.
4. **Graph Construction:**
   - Maps files and their outbound links to a directed graph.
   - Each node is a note; each edge is a hyperlink.
5. **Visualization:**
   - Optionally plots the graph using `matplotlib`.

### Usage

> **Tip:** Run interactively via terminal, or bind to a qtile key/chord for faster access.

**Scan a note folder and print progress:**  
```
get_hyperlinks_in_folder.py --path "/path/to/notes"
```

**Scan current directory (default) and visualize hyperlink graph:**  
```
get_hyperlinks_in_folder.py --draw
```

**Common workflow example:**  
```
cd ~/zettelkasten
get_hyperlinks_in_folder.py --draw
```

_No output? Ensure you have markdown files and wiki-links in your folder!_

---

> [!NOTE]
> - The script assumes your note links conform to `[[...]]` (Obsidian style).  
> - Error handling could be improved, e.g., if subprocesses fail or output unexpected formats.
> - The node IDs are mapped by filename order, which means graph node numbers may not always correspond to the same note if files are added/removed.
> - The script opens a matplotlib window, which may block execution if run inside qtile keybindings without `matplotlib` set to use a non-interactive backend.
> - Consider adding file labels or note titles as node labels for more meaningful visualization.
> - Strongly dependent on GNU/Linux CLI ecosystem; will not work natively on Windows.