# Utopia Bordeaux — PDF schedules to JSON (+ film descriptions)

---

**utopia.py**: Fetch Utopia Bordeaux weekly PDF schedules, parse to JSON, optionally enrich films

---

### Dependencies

- `uv` (shebang runs via `uv run --script`)
- `python>=3.12`
- `pdfplumber` (PDF table extraction)
- Network access to `https://www.cinemas-utopia.org/…`

---

### Description

This script downloads Utopia Bordeaux’s weekly “grille” PDFs (one PDF per week, published on Tuesdays), extracts showtimes from the embedded tables, and writes a per-week JSON file under `~/.local/share/utopia/`.

It also optionally enriches each parsed title by scraping the cinema’s film listing and detail pages:
- Listing page: identifies film `id`, and flags `is_new` / `is_doc`.
- Detail page: extracts `cast`, best-effort `director`, and a cleaned `description`.
- Details are cached in `~/.local/share/utopia/films/{id}.json` to avoid re-fetching.

Parsing logic highlights:
- Time detection via `_TIME_RE` matching `11H45`, `14H`, etc., with guards against PDF artifacts.
- Each PDF page yields up to 7 tables (MER→MAR). Cells are interpreted as `TIME\nTITLE`, with extra flags:
  - `discount: true` if the line contains `€`
  - `discussion: true` if it contains `(D)`, `débat`, or `discussion`
- Titles are matched to the website listing using accent/punctuation normalization and truncation-aware heuristics.

---

### Usage

Run manually in a terminal (ideal for a qtile keybinding too):

    ~/.scripts/dev/utopia.py

Common options:

    ~/.scripts/dev/utopia.py --no-enrich
    ~/.scripts/dev/utopia.py --force
    ~/.scripts/dev/utopia.py --debug

Re-enrich already saved weeks (no PDF downloads):

    ~/.scripts/dev/utopia.py --enrich
    ~/.scripts/dev/utopia.py --enrich --force

Query upcoming sessions from cached JSONs:

    ~/.scripts/dev/utopia.py --query
    ~/.scripts/dev/utopia.py --query 2026-04-09
    ~/.scripts/dev/utopia.py --query "2026-04-09 18:30"

Outputs:
- Week JSON: `~/.local/share/utopia/{wed}_{tue}.json`
- Film cache: `~/.local/share/utopia/films/{id}.json`

---

> [!TIP]
> Consider switching from regex-based HTML scraping to a parser (e.g. `beautifulsoup4`) to reduce breakage if the site markup changes. Also, `page.extract_tables()` can be brittle across PDF layout changes; adding validation (expected table count/headers) and logging unmatched titles would make failures easier to diagnose.