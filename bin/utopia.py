#!/usr/bin/env -S uv run --script --quiet
# /// script
# requires-python = ">=3.12"
# dependencies = ["pdfplumber"]
# ///

#INFO:#@RUN@=2026-04= "Fetch Utopia Bordeaux cinema schedules from weekly PDFs as JSON"

"""
Fetch Utopia Bordeaux weekly program PDFs, parse showtimes, enrich with film
descriptions, and save per-week JSON.

PDF URL pattern : https://www.cinemas-utopia.org/admin/grilles/bordeaux/{TUESDAY}.pdf
Film listing    : https://www.cinemas-utopia.org/bordeaux/index.php
Output          : ~/.local/share/utopia/{wed_date}_{tue_date}.json
Film cache      : ~/.local/share/utopia/films/{id}.json

Usage:
  utopia.py                            fetch PDFs + enrich with descriptions
  utopia.py --no-enrich                fetch PDFs only (faster, no descriptions)
  utopia.py --enrich                   (re-)enrich already-cached week JSONs
  utopia.py --force                    re-download PDFs and re-enrich
  utopia.py --debug                    dump raw tables + parsed JSON (no file written)
  utopia.py --query [YYYY-MM-DD HH:MM] list upcoming sessions (default: now)
"""

import io
import json
import os
import re
import sys
import time
import unicodedata
import urllib.error
import urllib.request
from datetime import date, datetime, timedelta
from pathlib import Path

import pdfplumber

BASE_URL = "https://www.cinemas-utopia.org/admin/grilles/bordeaux/"
BORDEAUX_BASE = "https://www.cinemas-utopia.org/bordeaux/"
OUTPUT_DIR = Path.home() / ".local/share/utopia"
FILMS_CACHE = OUTPUT_DIR / "films"

# Matches "11H45", "14H", "9H30" — negative lookbehind prevents matching
# artifacts like "152H" (where 2 is preceded by 5) or "150H30".
_TIME_RE = re.compile(r"(?<!\d)(\d{1,2})H(\d{2})?(?!\d)", re.IGNORECASE)


# ─── date helpers ────────────────────────────────────────────────────────────

def current_wednesday() -> date:
    """Most recent Wednesday on or before today."""
    today = date.today()
    return today - timedelta(days=(today.weekday() - 2) % 7)


# ─── HTTP helpers ─────────────────────────────────────────────────────────────

def _fetch(url: str) -> str:
    req = urllib.request.Request(url, headers={"User-Agent": "Mozilla/5.0"})
    with urllib.request.urlopen(req, timeout=30) as resp:
        return resp.read().decode("utf-8", errors="replace")


def download_pdf(tuesday: date) -> bytes:
    url = f"{BASE_URL}{tuesday.isoformat()}.pdf"
    req = urllib.request.Request(url, headers={"User-Agent": "Mozilla/5.0"})
    with urllib.request.urlopen(req, timeout=30) as resp:
        return resp.read()


# ─── film listing & detail ────────────────────────────────────────────────────

def fetch_film_listing() -> list[dict]:
    """
    Fetch the current film listing from the Bordeaux main page.
    Returns [{id, title, is_new, is_doc}] where:
      is_new  = <strong> without <em> → new release
      is_doc  = <em><strong> → documentary premiere
    """
    html = _fetch(BORDEAUX_BASE + "index.php")
    # Find the <ul> following <h4>LES FILMS PROGRAMMÉS…</h4>
    m = re.search(r"<h4>LES FILMS.*?</h4>\s*<ul>(.*?)</ul>", html, re.DOTALL)
    if not m:
        return []

    films: list[dict] = []
    for item in re.finditer(
        r'<li><a href="index\.php\?id=(\d+)&(?:amp;)?mode=film">(.*?)</a></li>',
        m.group(1),
        re.DOTALL,
    ):
        fid = int(item.group(1))
        raw = item.group(2)
        is_new = bool(re.search(r"<strong>", raw))
        is_doc = bool(re.search(r"<em>", raw))
        title = re.sub(r"<[^>]+>", "", raw)
        title = title.replace("\xa0", " ").replace("&nbsp;", " ").strip()
        # Strip trailing "(D)" = last week of screening
        title = re.sub(r"\s*\(D\)\s*$", "", title).strip()
        films.append({"id": fid, "title": title, "is_new": is_new, "is_doc": is_doc})

    return films


def fetch_film_detail(film_id: int) -> dict:
    """
    Fetch film detail page and extract director, technical info, and description.
    """
    html = _fetch(f"{BORDEAUX_BASE}index.php?id={film_id}&mode=film")
    result: dict = {}

    # Cast line: director + country/year/duration/subtitle type
    cast_m = re.search(r'<p class="cast">(.*?)</p>', html, re.DOTALL)
    if cast_m:
        cast_html = cast_m.group(1)
        cast_text = re.sub(r"<[^>]+>", " ", cast_html)
        cast_text = cast_text.replace("\xa0", " ")
        cast_text = re.sub(r"\s+", " ", cast_text).strip()
        result["cast"] = cast_text

        dir_m = re.search(r"Réalis[ée][^p]*par\s+(.+?)(?:\s+-|\s*$)", cast_text, re.IGNORECASE)
        if dir_m:
            result["director"] = dir_m.group(1).strip(" -")

    # Main description text
    text_m = re.search(r'<p class="texte">(.*?)</p>', html, re.DOTALL)
    if text_m:
        text = text_m.group(1)
        text = re.sub(r"<img[^>]*>", "", text)
        text = re.sub(r"<br\s*/?>", "\n", text, flags=re.IGNORECASE)
        text = re.sub(r"<[^>]+>", "", text)
        text = text.replace("\xa0", " ").replace("\r\n", "\n")
        text = re.sub(r"\n{3,}", "\n\n", text).strip()
        result["description"] = text

    return result


# ─── title matching ───────────────────────────────────────────────────────────

def _norm(title: str) -> str:
    """Normalize for fuzzy matching: remove accents, punctuation, collapse spaces."""
    nfd = unicodedata.normalize("NFD", title)
    s = "".join(c for c in nfd if unicodedata.category(c) != "Mn")
    s = re.sub(r"[^a-zA-Z0-9\s]", " ", s)
    return re.sub(r"\s+", " ", s).lower().strip()


def match_title(pdf_title: str, listing: list[dict]) -> dict | None:
    """
    Multi-strategy fuzzy match of a (possibly truncated) PDF title to a film entry.

    PDF titles are often truncated with '…' and may omit leading articles.
    Also strips trailing '(D)' (last-week marker) before matching.
    Strategies (in priority order):
      1. Exact normalized match
      2. Normalized PDF (no trailing '…') is a substring of normalized HTML title
      3. Normalized HTML title starts with normalized PDF title (for '…' truncations)
    """
    # Strip trailing markers: '…', '...', '(D)'
    clean = re.sub(r"[…\.]+$", "", pdf_title)
    clean = re.sub(r"\s*\(D\)\s*$", "", clean).strip()
    norm_pdf = _norm(clean)
    if len(norm_pdf) < 3:
        return None

    best: dict | None = None
    best_score = 0

    for film in listing:
        norm_html = _norm(film["title"])

        if norm_pdf == norm_html:
            return film  # exact match, no need to continue

        score = 0
        if norm_pdf in norm_html:
            # Prefer longer matches (avoids false positives on short substrings)
            score = len(norm_pdf)
        elif norm_html.startswith(norm_pdf) and len(norm_pdf) >= 6:
            score = len(norm_pdf) - 1  # slightly lower confidence

        if score > best_score:
            best_score = score
            best = film

    # Require a minimum match length to avoid noise
    return best if best_score >= 6 else None


# ─── PDF parsing ──────────────────────────────────────────────────────────────

def _parse_time_line(line: str) -> tuple[str | None, bool, bool]:
    """
    Extract the first valid time from a line.
    Returns (HH:MM | None, discount, discussion).
    """
    m = _TIME_RE.search(line)
    if not m:
        return None, False, False
    h = int(m.group(1))
    if h > 23:
        return None, False, False
    minutes = m.group(2) or "00"
    discount = "€" in line
    discussion = bool(re.search(r"\(D\)|débat|discussion", line, re.IGNORECASE))
    return f"{h:02d}:{minutes}", discount, discussion


def _clean_title(raw: str) -> str:
    raw = re.sub(r"\s*\+\s*(débat|discussion|rencontre).*$", "", raw, flags=re.IGNORECASE)
    return raw.strip()


def _parse_cell(cell_text: str) -> list[dict]:
    """Parse a table cell into a list of {time, title, ?discount, ?discussion}."""
    results: list[dict] = []
    lines = [l.strip() for l in cell_text.split("\n") if l.strip()]

    i = 0
    while i < len(lines):
        time_str, discount, discussion = _parse_time_line(lines[i])

        if time_str is not None and i + 1 < len(lines):
            next_line = lines[i + 1]
            if _parse_time_line(next_line)[0] is None:
                title = _clean_title(next_line)
                if title:
                    entry: dict = {"time": time_str, "title": title}
                    if discount:
                        entry["discount"] = True
                    if discussion:
                        entry["discussion"] = True
                    results.append(entry)
                i += 2
                continue

        i += 1

    return results


def parse_pdf(pdf_bytes: bytes, week_start: date, debug: bool = False) -> dict:
    """
    Extract movie schedules from a Utopia grille PDF.
    7 tables on one page, one per day MER→MAR. Each cell is TIME\\nTITLE.
    """
    movies: dict[str, list[dict]] = {}

    with pdfplumber.open(io.BytesIO(pdf_bytes)) as pdf:
        for page in pdf.pages:
            tables = page.extract_tables()

            if debug:
                day_names = ["MER", "JEU", "VEN", "SAM", "DIM", "LUN", "MAR"]
                for idx, table in enumerate(tables or []):
                    label = day_names[idx] if idx < 7 else "?"
                    print(f"\n=== Table {idx} ({label}) ===")
                    for row in table[:3]:
                        print(row)

            for day_idx, table in enumerate(tables or []):
                if day_idx >= 7:
                    break
                screening_date = (week_start + timedelta(days=day_idx)).isoformat()

                for row in table:
                    for cell in row:
                        if not cell:
                            continue
                        for entry in _parse_cell(str(cell)):
                            title = entry["title"]
                            screening = {"date": screening_date, "time": entry["time"]}
                            if entry.get("discount"):
                                screening["discount"] = True
                            if entry.get("discussion"):
                                screening["discussion"] = True
                            movies.setdefault(title, []).append(screening)

    result: list[dict] = []
    for title, screenings in sorted(movies.items()):
        seen: set[tuple[str, str]] = set()
        unique = []
        for s in sorted(screenings, key=lambda x: (x["date"], x["time"])):
            key = (s["date"], s["time"])
            if key not in seen:
                seen.add(key)
                unique.append(s)
        result.append({"title": title, "screenings": unique})

    return {
        "week_start": week_start.isoformat(),
        "week_end": (week_start + timedelta(days=6)).isoformat(),
        "movies": result,
    }


# ─── LLM title matching ───────────────────────────────────────────────────────

def _llm_match_titles(
    pdf_titles: list[str],
    listing: list[dict],
) -> dict[str, list[str]] | None:
    """
    Batch-match truncated PDF titles to full website titles via a single LLM call.

    The LLM handles:
    - Truncation with '…' ("LES RAYONS ET LES…" → "LES RAYONS ET LES OMBRES")
    - Missing leading articles ("JEUNESSE INDIENNE" → "UNE JEUNESSE INDIENNE")
    - Merged entries ("CRÉATURES 2 SAUVAGE" → ["LES TOUTES PETITES CRÉATURES 2", "SAUVAGE"])

    Returns {pdf_title: [full_website_title, ...]} or None if no API key available.
    Falls back to empty list for unrecognised titles.
    """
    # Find API key (OpenRouter preferred, then OpenAI)
    api_key: str | None = None
    api_url = "https://openrouter.ai/api/v1/chat/completions"
    model = "openai/gpt-4o-mini"
    for env_var in ("OPENROUTER_API_KEY", "OPENAI_API_KEY"):
        key = os.environ.get(env_var)
        if key:
            api_key = key
            if env_var == "OPENAI_API_KEY":
                api_url = "https://api.openai.com/v1/chat/completions"
                model = "gpt-4o-mini"
            break
    if not api_key:
        return None

    html_titles = [f["title"] for f in listing]
    prompt = (
        "Match each truncated PDF cinema program title to its full title(s) from the website list.\n\n"
        "Rules:\n"
        "- PDF titles may be truncated with '…' or missing leading articles (un/une/le/la/les/l')\n"
        "- Very occasionally, two consecutive films were merged into one PDF entry\n"
        "  (e.g. 'CRÉATURES 2 SAUVAGE' → ['LES TOUTES PETITES CRÉATURES 2', 'SAUVAGE'])\n"
        "- Return [] if no match exists\n\n"
        f"PDF titles:\n{json.dumps(pdf_titles, ensure_ascii=False)}\n\n"
        f"Website titles:\n{json.dumps(html_titles, ensure_ascii=False)}\n\n"
        'Respond ONLY with valid JSON: {"pdf_title": ["matched_website_title"], ...}'
    )
    payload = {
        "model": model,
        "messages": [{"role": "user", "content": prompt}],
        "temperature": 0,
        "response_format": {"type": "json_object"},
    }
    headers = {"Authorization": f"Bearer {api_key}", "Content-Type": "application/json"}
    try:
        req = urllib.request.Request(
            api_url,
            data=json.dumps(payload).encode(),
            headers=headers,
            method="POST",
        )
        with urllib.request.urlopen(req, timeout=60) as resp:
            data = json.loads(resp.read())
        content = data["choices"][0]["message"]["content"]
        # Extract JSON even if wrapped in markdown
        m = re.search(r"\{.*\}", content, re.DOTALL)
        raw = json.loads(m.group() if m else content)
        # Normalise values to list[str]
        return {k: ([v] if isinstance(v, str) else v) for k, v in raw.items()}
    except Exception as e:
        print(f"  warn    LLM matching failed: {e}", file=sys.stderr)
        return None


# ─── enrichment ───────────────────────────────────────────────────────────────

def enrich_data(data: dict, listing: list[dict], *, force: bool = False) -> int:
    """
    Add film_id, director, description to each movie entry.

    Matching strategy:
      1. Regex (fast, handles ~95% of cases)
      2. LLM batch call for remaining unmatched titles (handles truncation edge cases)
    Film detail pages are cached in FILMS_CACHE/{id}.json.
    Returns number of film detail pages newly fetched from the network.
    """
    FILMS_CACHE.mkdir(parents=True, exist_ok=True)
    title_to_film = {f["title"]: f for f in listing}

    # First pass: regex matching
    matches: dict[str, dict | None] = {}
    for movie in data["movies"]:
        if "film_id" in movie and not force:
            continue
        matches[movie["title"]] = match_title(movie["title"], listing)

    # Second pass: LLM for still-unmatched titles
    unmatched = [t for t, m in matches.items() if m is None]
    if unmatched:
        llm_result = _llm_match_titles(unmatched, listing)
        if llm_result:
            resolved = sum(1 for v in llm_result.values() if v)
            print(f"  llm     {resolved}/{len(unmatched)} unmatched titles resolved by LLM")
            for pdf_title, full_titles in llm_result.items():
                if full_titles and pdf_title in matches:
                    matches[pdf_title] = title_to_film.get(full_titles[0])

    # Apply matches and fetch descriptions
    fetched = 0
    for movie in data["movies"]:
        if "film_id" in movie and not force:
            continue

        matched = matches.get(movie["title"])
        if not matched:
            continue

        fid = matched["id"]
        movie["film_id"] = fid
        if matched.get("is_new"):
            movie["is_new"] = True
        if matched.get("is_doc"):
            movie["is_doc"] = True

        cache_path = FILMS_CACHE / f"{fid}.json"
        if cache_path.exists() and not force:
            detail = json.loads(cache_path.read_text())
        else:
            try:
                detail = fetch_film_detail(fid)
                detail["id"] = fid
                detail["title"] = matched["title"]
                cache_path.write_text(json.dumps(detail, ensure_ascii=False, indent=2))
                fetched += 1
                time.sleep(0.3)
            except Exception as e:
                print(f"  warn    film {fid} ({matched['title']}): {e}", file=sys.stderr)
                continue

        if "director" in detail:
            movie["director"] = detail["director"]
        if "description" in detail:
            movie["description"] = detail["description"]

    return fetched


# ─── per-week driver ──────────────────────────────────────────────────────────

def process_week(
    wednesday: date,
    listing: list[dict],
    *,
    force: bool = False,
    no_enrich: bool = False,
    debug: bool = False,
) -> None:
    tue = wednesday + timedelta(days=6)
    out_path = OUTPUT_DIR / f"{wednesday.isoformat()}_{tue.isoformat()}.json"

    # Load existing data or parse PDF
    if out_path.exists() and not force and not debug:
        if no_enrich:
            print(f"  cached  {out_path.name}")
            return
        # Re-enrich existing data
        data = json.loads(out_path.read_text())
        needs_pdf = False
    else:
        url = f"{BASE_URL}{tue.isoformat()}.pdf"
        print(f"  fetch   {url}")
        try:
            pdf_bytes = download_pdf(tue)
        except urllib.error.HTTPError as e:
            print(f"  error   HTTP {e.code} — week not yet published?", file=sys.stderr)
            return
        data = parse_pdf(pdf_bytes, wednesday, debug=debug)
        needs_pdf = True

    if debug:
        print("\n--- Parsed JSON (first 3 films) ---")
        preview = dict(data)
        preview["movies"] = data["movies"][:3]
        print(json.dumps(preview, ensure_ascii=False, indent=2))
        return

    if not no_enrich and listing:
        n_fetched = enrich_data(data, listing, force=force)
        if n_fetched:
            print(f"  enrich  {n_fetched} new film descriptions fetched")

    OUTPUT_DIR.mkdir(parents=True, exist_ok=True)
    out_path.write_text(json.dumps(data, ensure_ascii=False, indent=2))
    n = len(data["movies"])
    matched = sum(1 for m in data["movies"] if "film_id" in m)
    suffix = f" ({matched}/{n} descriptions)" if not no_enrich else f" ({n} films)"
    print(f"  saved   {out_path.name}{suffix}")


# ─── query ────────────────────────────────────────────────────────────────────

def query_sessions(from_str: str) -> None:
    """Print upcoming sessions, with description if available."""
    fmt = "%Y-%m-%d %H:%M" if len(from_str) > 10 else "%Y-%m-%d"
    try:
        cutoff = datetime.strptime(from_str, fmt)
    except ValueError:
        print(f"Invalid datetime '{from_str}'. Use YYYY-MM-DD or YYYY-MM-DD HH:MM", file=sys.stderr)
        sys.exit(1)

    sessions: list[tuple[datetime, dict, dict]] = []
    for json_file in sorted(OUTPUT_DIR.glob("[0-9]*.json")):
        data = json.loads(json_file.read_text())
        for movie in data["movies"]:
            for s in movie["screenings"]:
                dt = datetime.strptime(f"{s['date']} {s['time']}", "%Y-%m-%d %H:%M")
                if dt >= cutoff:
                    sessions.append((dt, movie, s))

    sessions.sort(key=lambda x: x[0])
    for dt, movie, s in sessions:
        flags = ("  €" if s.get("discount") else "") + ("  (débat)" if s.get("discussion") else "")
        tags = []
        if movie.get("is_new"):
            tags.append("NOUVEAU")
        if movie.get("is_doc"):
            tags.append("DOC")
        tag_str = f"  [{', '.join(tags)}]" if tags else ""
        director = f"  ({movie['director']})" if "director" in movie else ""
        print(f"{dt.strftime('%a %d/%m %H:%M')}  {movie['title']}{tag_str}{director}{flags}")


# ─── main ─────────────────────────────────────────────────────────────────────

def main() -> None:
    args = sys.argv[1:]

    if "--query" in args:
        idx = args.index("--query")
        from_str = args[idx + 1] if idx + 1 < len(args) else datetime.now().strftime("%Y-%m-%d %H:%M")
        query_sessions(from_str)
        return

    force = "--force" in args
    no_enrich = "--no-enrich" in args
    debug = "--debug" in args
    enrich_only = "--enrich" in args

    listing: list[dict] = []
    if not no_enrich:
        print("  listing https://www.cinemas-utopia.org/bordeaux/index.php")
        try:
            listing = fetch_film_listing()
            print(f"  listing {len(listing)} films found")
        except Exception as e:
            print(f"  warn    could not fetch listing: {e}", file=sys.stderr)

    wed = current_wednesday()
    print(f"Utopia Bordeaux — 4 weeks from {wed.isoformat()}")

    if enrich_only:
        # Re-enrich all existing week JSONs without re-fetching PDFs
        for json_file in sorted(OUTPUT_DIR.glob("[0-9]*.json")):
            data = json.loads(json_file.read_text())
            if listing:
                n = enrich_data(data, listing, force=force)
                json_file.write_text(json.dumps(data, ensure_ascii=False, indent=2))
                matched = sum(1 for m in data["movies"] if "film_id" in m)
                total = len(data["movies"])
                print(f"  enrich  {json_file.name}  ({matched}/{total} descriptions, {n} new fetches)")
        return

    for i in range(4):
        process_week(
            wed + timedelta(weeks=i),
            listing,
            force=force,
            no_enrich=no_enrich,
            debug=debug,
        )


if __name__ == "__main__":
    main()
