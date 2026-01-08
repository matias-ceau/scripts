# Markdown Wiki Link Graph Extractor

---

**get_hyperlinks_in_folder.py**: Scan a folder of markdown notes for `[[wiki links]]` and build a graph

---

### Dependencies

- `python` (Arch package: `python`)
- `click` (CLI options)
- `tqdm` (progress bar)
- `networkx` (directed graph structure)
- `matplotlib` (optional rendering with `--draw`)
- `fd` (fast file discovery; used to list `.md` files)
- `ripgrep` / `rg` (searches wiki-style links with JSON output)
- `jq` (extracts matches/submatches from `rg --json`)

### Description

This script scans a notes directory (e.g., an Obsidian vault) and extracts all `[[...]]` style links found in Markdown files. It then builds a directed graph where:

- Each node is a Markdown file (internally mapped to a numeric id).
- Each edge is a link from one file to another (`source -> target`).

Pipeline overview:

1. **Resolve target folder**: `get_search_path()` expands `~` and `$VARS` and validates the directory.
2. **List notes**: `list_all_notes()` uses `fd` to collect `.md` files and assigns each file a stable numeric id.
3. **Extract links**: `get_references()` runs `rg` with a regex matching `[[note]]`, `[[note|alias]]`, and strips match data via `jq`.
4. **Normalize link targets**: `get_hyperlink_id()` resolves basename-only matches, removes `|alias` and `#heading`, and enforces a `.md` suffix.
5. **Graph build + optional draw**: `networkx.DiGraph()` is created; `--draw` visualizes it with a spring layout.

### Usage

Run from a terminal:

    get_hyperlinks_in_folder.py --path ~/notes

Draw the graph (interactive Matplotlib window):

    get_hyperlinks_in_folder.py --path ~/notes --draw

Typical qtile binding (spawn in a terminal if you want to see progress):

    lazy.spawn("alacritty -e get_hyperlinks_in_folder.py --path ~/notes --draw")

---

> [!TIP]
> Improvements to consider:
> - `get_references()` builds JSON by string concatenation; this is fragile (trailing commas, empty output). Prefer reading line-by-line and `json.loads()` per line.
> - Matching links by **basename only** can collide (two files with same name in different folders). Using full relative paths (or Obsidian-style resolution rules) would be safer.
> - There’s no output when `--draw` is not provided; exporting edges/nodes to `json`/`csv`/`dot` would make the script more useful headlessly.
> - `assert p2.returncode == 0` will crash without context; handle errors and surface `stderr` from `jq`/`rg`.