# Utopia Bordeaux — Weekly Schedule Scraper (PDF → JSON)

---

**utopia.py**: Fetch Utopia Bordeaux weekly program PDFs and export enriched JSON schedules

---

### Dependencies

- `uv` (script runner via shebang `uv run --script`)
- `python>=3.12`
- `pdfplumber` (PDF table extraction)
- Network access to:
  - `https://www.cinemas-utopia.org/admin/grilles/bordeaux/` (weekly PDFs)
  - `https://www.cinemas-utopia.org/bordeaux/index.php` (film listing + details)
- Optional (for LLM title matching):
  - `OPENROUTER_API_KEY` or `OPENAI_API_KEY` (enables one-shot batch matching)

### Description

This script downloads Utopia Bordeaux’s weekly “grille” PDF (one per week, published for the Tuesday ending the week), parses showtimes from embedded tables, and saves a per-week JSON file to `~/.local/share/utopia/`.

Core flow:

- Compute the current week anchor (`current_wednesday()`), then process 4 consecutive weeks.
- For each week:
  - Download the Tuesday PDF (`{tue_date}.pdf`) and parse it with `pdfplumber`.
  - Extract sessions by scanning each table cell as `TIME\nTITLE` pairs, detecting:
    - discounted screenings (presence of `€`)
    - debates/discussions (`(D)`, `débat`, `discussion`)
  - Optionally enrich entries by scraping the website listing + film detail pages, caching each film in `~/.local/share/utopia/films/{id}.json`.
  - For hard-to-match truncated PDF titles, it can optionally call an LLM once per run to resolve remaining titles.

It also provides a local “agenda” view via `--query`, scanning cached week JSONs and printing upcoming sessions.

### Usage

```sh
# Default: fetch 4 weeks of PDFs and enrich with descriptions
utopia.py

# Fetch only (no listing/detail scraping)
utopia.py --no-enrich

# Force re-download PDFs and re-enrich (also refreshes film cache)
utopia.py --force

# Debug: print extracted tables + JSON preview (does not write files)
utopia.py --debug

# Re-enrich existing week JSONs (no PDF download)
utopia.py --enrich

# List upcoming sessions from cached JSONs (default: now)
utopia.py --query
utopia.py --query "2026-04-15 20:00"
utopia.py --query "2026-04-15"
```

Suggested qtile binding: run `utopia.py --query` in a terminal (or pipe to `rofi`/`fzf`) to quickly browse upcoming screenings.

---

> [!TIP]
> The HTML parsing uses regexes and may break if Utopia changes markup; consider switching to `beautifulsoup4`. Also, LLM matching sends titles to a third-party API—add a `--no-llm` flag or make it opt-in to avoid surprises. Finally, `extract_tables()` can be brittle across PDF layout changes; keeping a small “fixture” PDF for regression testing would make updates safer.