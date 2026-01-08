# OpenAI model list (cached)

---

**list-openai-models.sh**: List OpenAI models with creation dates, cached for 24h in TSV

---

### Dependencies

- `openai` (OpenAI CLI): provides `openai api models.list`
- `jq`: parses JSON output to extract `created` and `id`
- `coreutils` (`date`, `stat`, `sort`, `tr`): timestamp handling and sorting
- `sed`: reshapes output into TSV rows
- `bat`: pretty-prints the TSV (`-ppltsv`)

---

### Description

This script prints a table of available OpenAI models and their creation date. To avoid hitting the API repeatedly, it caches the result in:

- `$XDG_CACHE_HOME/openai-model-list.tsv`

On each run, it checks the cache file’s mtime via `stat --format="%Y"` and compares it to the current epoch time (`date +%s`). If the cache is younger than 86400 seconds (24 hours), it skips updating and simply displays the cached TSV.

The update pipeline:

1. `openai api models.list` returns a JSON list of models.
2. `jq -c '.["created", "id"]'` extracts the Unix timestamp and model id (compact array per line).
3. A `while read` loop converts the timestamp to `YYYY-MM-DD` using `date -d @<epoch>`. If conversion fails, it echoes the raw line (fallback).
4. Newlines are transformed into tabs, then `sed` splits rows back onto newlines to form TSV-like output.
5. Output is `sort`ed and written to the cache, then displayed with `bat`.

---

### Usage

Run directly from a terminal (or bind it in qtile to spawn a floating terminal):

    list-openai-models.sh

Force-refresh by deleting the cache:

    rm -f "$XDG_CACHE_HOME/openai-model-list.tsv"
    list-openai-models.sh

tldr:

- Show cached list (fast): `list-openai-models.sh`
- Refresh (manual): remove cache file, rerun

---

> [!TIP]
> Consider hardening a few edges:
> - If `$XDG_CACHE_HOME` is unset, `CACHE` becomes `/openai-model-list.tsv`. Default it: `: "${XDG_CACHE_HOME:=$HOME/.cache}"`.
> - `jq -c '.["created","id"]'` assumes the top-level shape matches; you may want `jq -r '.data[] | [.created, .id] | @tsv'` to avoid the `tr/sed` dance and quote issues.
> - The cache freshness check uses `stat` and arithmetic; add `set -euo pipefail` carefully (with guards) to catch failures from `openai`/`jq` early.