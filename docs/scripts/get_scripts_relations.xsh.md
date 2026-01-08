# Scripts Relations Graph (Xonsh)

---

**get_scripts_relations.xsh**: Build and display a dependency graph between scripts under `$SCRIPTS`

---

### Dependencies

- `xonsh` — required to run the script
- `fd` — enumerates files under `$SCRIPTS`
- `ripgrep` (`rg`) — finds scripts that reference other scripts by name
- `basename` (coreutils) — extracts filenames from paths
- `python-networkx` (`networkx`) — builds the directed graph
- `python-matplotlib` (`matplotlib`) — renders the graph window
- `$SCRIPTS` environment variable — must point to your scripts directory

### Description

This Xonsh utility scans your scripts directory and visualizes “who references whom” as a directed graph.

Workflow:

1. Collect all files under `$SCRIPTS` using `fd`.
2. For each script `k`, take its filename (`basename`) and search the whole `$SCRIPTS` tree for files containing that filename using `rg --files-with-matches`.
3. Build a mapping like:

- key: `some_script.sh`
- value: `[list_of_scripts_that_contain_the_string_some_script.sh]`

4. Convert the mapping into a `networkx.DiGraph`, adding an edge for each discovered relation.
5. Render the graph with a spring layout via Matplotlib (`plt.show()` opens a GUI window).

This is handy on Arch + qtile to quickly inspect how your personal scripts are coupled, and to spot “hub” scripts or unexpected references.

### Usage

Run interactively (needs a GUI for Matplotlib):

- `./get_scripts_relations.xsh`

Or:

- `xonsh /home/matias/.scripts/dev/get_scripts_relations.xsh`

Suggested from qtile (spawns a GUI window):

- `Key([...], "g", lazy.spawn("xonsh ~/.scripts/dev/get_scripts_relations.xsh"))`

---

> [!TIP]
> Potential improvements: the edge direction is likely inverted (currently `file -> dep` where `dep` is actually “script that matched”, i.e., the caller). Consider flipping to `caller -> callee`. Also, using plain filename substring matching can create false positives (e.g., comments, partial matches, same names in different dirs); anchoring patterns or parsing `source`/`bash` calls would be more accurate. Add CLI options (e.g., output JSON, filter extensions, ignore vendored folders) and consider `plt.tight_layout()` for readability on larger graphs.