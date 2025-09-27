# Ollama model list (cached, LLM-formatted)

---

**ollama-list.sh**: Fetches and caches a formatted list of Ollama models via LLM

---

### Dependencies

- `bash` — shell runtime
- `curl` — fetch HTML from the Ollama Library page
- `pandoc` — convert HTML to plain text before LLM processing
- `aichat` — CLI to query an LLM (configured for Groq; uses `--model`)
- `coreutils` — `mkdir`, `cat`, `date` for caching

### Description

This script scrapes the Ollama Library page (default: https://ollama.com/library?sort=popular), converts the HTML to plain text with `pandoc`, and asks an LLM (via `aichat`) to return “a nicely formatted list of all these models.” Results are cached under:
- Cache dir: `~/.cache/model_list`
- Files: `response_cache.txt`, `cache_timestamp.txt`
- TTL: 7 days

If a valid cache exists, it’s printed immediately; otherwise, a fresh fetch is performed and cached. You can override the source URL and the LLM model, or bypass the cache entirely.

Arch/qtile context: this works well as a terminal command or bound to a qtile key to pop up a quick, readable model list in your terminal emulator.

### Usage

Basic (use cache if fresh):
```
~/.scripts/bin/ollama-list.sh
```

Force refresh (ignore cache):
```
~/.scripts/bin/ollama-list.sh --no-cache
```

Custom LLM model (Groq via aichat):
```
~/.scripts/bin/ollama-list.sh --model "groq:llama-3.3-70b-versatile"
```

Custom source URL (e.g., different sort/filter):
```
~/.scripts/bin/ollama-list.sh --url "https://ollama.com/library?sort=new"
```

qtile keybinding example (spawn in kitty, no cache):
```
Key([mod], "o", lazy.spawn("kitty -e /home/matias/.scripts/bin/ollama-list.sh --no-cache"))
```

tldr:
```
# fresh list now
ollama-list.sh --no-cache

# tweak LLM
ollama-list.sh --model "groq:llama-3.1-70b"

# inspect different page
ollama-list.sh --url "https://ollama.com/library?sort=trending"
```

---

> [!TIP]
> - Add error handling: check exit codes for `curl`, `pandoc`, and `aichat`; fail fast with helpful messages.
> - Consider a `--max-age DAYS` flag to adjust TTL without editing the script.
> - Provide `--help` output and accept `-h`.
> - Guard against concurrent writes to the cache (use a lockfile).
> - The LLM prompt is vague; a deterministic parser (e.g., `pup`, `hxselect`, or `jq` if you find an API) would be more stable.
> - Validate `aichat` stdin behavior; if not supported, pass the page text via a `--input`/`-f` option or rework the prompt.