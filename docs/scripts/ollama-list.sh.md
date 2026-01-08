# Ollama Library Model Lister (Cached)

---

**ollama-list.sh**: Fetch and format Ollama library models with a 7-day local cache

---

### Dependencies

- `bash`
- `curl` — downloads the Ollama library page HTML
- `pandoc` — converts HTML to plain text for easier LLM parsing
- `aichat` — turns the page content into a “nicely formatted list”
- `date`, `mkdir`, `cat` — coreutils (present by default on Arch)

---

### Description

This script builds a readable list of models from the Ollama library page (by default: `https://ollama.com/library?sort=popular`). Instead of manually parsing HTML, it:

1. Fetches the library page via `curl`.
2. Converts the HTML to plain text using `pandoc`.
3. Prompts `aichat` to “return a nicely formatted list of all these models”, using a configurable chat model (`groq:llama-3.3-70b-versatile` by default).

To avoid repeated network calls (and repeated LLM calls), it caches the final formatted output under:

- Cache dir: `~/.cache/model_list/`
- Response: `response_cache.txt`
- Timestamp: `cache_timestamp.txt`

The cache is considered valid for `MAX_CACHE_AGE_DAYS=7`. If valid, the script prints the cached response immediately.

---

### Usage

Run from a terminal (or bind in qtile to open a terminal running it):

- Default behavior (uses cache when valid):
  - `ollama-list.sh`

- Use a different source URL:
  - `ollama-list.sh --url "https://ollama.com/library?sort=newest"`

- Use a different `aichat` model:
  - `ollama-list.sh --model "groq:llama-3.1-70b-versatile"`

- Force refresh (ignore cache):
  - `ollama-list.sh --no-cache`

Tip for qtile: bind a key to spawn your terminal and pipe to a pager:
- `alacritty -e bash -lc 'ollama-list.sh | less -R'`

---

> [!TIP]
> Consider adding error handling for missing dependencies and failed `curl`/`pandoc`/`aichat` runs (right now failures may silently cache empty output). Also, quote/validate `--url` and `--model` inputs more defensively, and consider caching the raw HTML/plain text separately to reduce LLM usage even further. Adding `set -euo pipefail` (with careful handling) would make failures more explicit.