# UGC HTML Movie Titles Extractor

---

**ugc-python.py**: Extracts and lists movie titles from HTML input piped via stdin.

---

### Dependencies

- `uv`  
  _Alternative Python runner/virtual env manager, used to execute the script with dependencies resolved._
- `beautifulsoup4`  
  _HTML/XML parser; required for extracting movie titles from given HTML._
- `python >= 3.13`  
  _Script is intended for newer Python (adjust if using an older version)._

---

### Description

This script reads HTML from standard input, parses it, and extracts a clean list of movie titles from the first `<div class="info-wrapper">`.  
It trims lines and filters out non-movie text blocks (like those starting with "Films avec de l'audio description" or "Rappel"), then prints each movie on a new line with a numeric index.

**Main steps:**
- Read the HTML content from stdin.
- Parse with `BeautifulSoup` (`html.parser`).
- Find the `<div>` with class `info-wrapper`.
- Split and clean lines from the div's text.
- Ignore irrelevant header/notification lines.
- Output a numbered list to stdout.

---

### Usage

**Pipe HTML to the script:**

```sh
cat page.html | uv run --script --quiet /home/matias/.scripts/dev/ugc-python.py 
```
or (if executable):
```sh
chmod +x /home/matias/.scripts/dev/ugc-python.py
cat page.html | /home/matias/.scripts/dev/ugc-python.py
```

**Within Qtile:**
- You can bind this script to a keybinding or use it in combination with a web scraping or clipboard utility.

**Typical output:**
```
1. The Godfather
2. Pulp Fiction
3. Interstellar
...
```

---

> [!CAUTION]
>
> - The script assumes only a single relevant `<div class="info-wrapper">`. If the HTML structure changes or multiple such divs are present, some movies could be missed or repeated.
> - No error is raised for missing dependencies; script will simply fail. Consider adding dependency checks.
> - The shebang redundantly appears twice in the script. The second one (`#!/usr/bin/env python`) is ignored due to placement.
> - Filtering logic is hardcoded for specific phrases (in French). If site notification text changes, false positives may appear.
> - Would benefit from command-line options (for input file path or custom selectors).
> - Adding optional output formats (CSV, JSON) could be useful for scripting.
