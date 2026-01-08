# UGC HTML Movie Title Extractor

---

**ugc-python.py**: Extracts and numbers movie titles from UGC-like HTML read from stdin

---

### Dependencies

- `uv` (shebang uses `uv run --script`) to run with inline dependency resolution
- `python>=3.13`
- `beautifulsoup4` (provides `bs4.BeautifulSoup` HTML parsing)

### Description

This script is a small stdin → stdout filter to scrape movie titles from an HTML page (likely copied/saved from a UGC cinema page). It:

1. Reads the entire HTML document from **stdin** (`sys.stdin.read()`).
2. Parses it with BeautifulSoup using the `html.parser` backend.
3. Searches for a `div` with class `info-wrapper`, assumed to contain the list of movies.
4. Converts that section to plain text with explicit line splitting via `get_text(separator="\n")`.
5. Filters out unwanted header/reminder lines (currently anything starting with:
   - `Films avec de l'audio description`
   - `Rappel`)
6. Prints the remaining lines as a numbered list (`1. Title`, `2. Title`, …).

This is convenient on Arch Linux when you want a quick textual list to paste into notes, a notification, a rofi menu, or a qtile widget pipeline.

### Usage

Run it by piping HTML into it:

- From a saved file:
  - `cat page.html | ~/.scripts/dev/ugc-python.py`

- From the clipboard (example with `wl-paste` on Wayland):
  - `wl-paste | ~/.scripts/dev/ugc-python.py`

- Basic “tldr”:
  - Input: full HTML document on stdin  
  - Output: numbered movie titles on stdout  
  - Arguments: none

You can bind it in qtile as part of a command pipeline (e.g., fetch/copy page → parse → display), since it is non-interactive and writes to stdout.

---

> [!TIP]
> Consider making the selector more robust: `div.info-wrapper` may change, and the current line-based heuristic can accidentally include non-title lines. A safer approach is to target specific child tags (e.g., `a`, `h3`, or known title containers) and extract only those. Also, remove the second `#!/usr/bin/env python` line (it’s redundant) and add an explicit UTF-8 handling note if you often process French accents.