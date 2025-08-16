# Ollama Library Model Lister (cached, AI‑formatted)

---

**ollama-list.sh**: Build and cache a readable list of Ollama Library models

---

### Dependencies

- `bash` — shell runtime
- `curl` — fetches the HTML from the Ollama Library (or custom) URL
- `pandoc` — converts HTML to plain text before AI formatting
- `aichat` — LLM CLI used to summarize/format the model list; requires provider config
- `groq` (via `aichat`) — default provider/model `groq:llama-3.3-70b-versatile` needs a valid API key
- `date`, `mkdir` — standard GNU coreutils available on Arch Linux

### Description

This script fetches the Ollama Library page (or any provided URL), converts it to plain text with pandoc, then asks aichat to produce a clean, human‑readable list of the models. Results are cached under:
- Cache dir: ~/.cache/model_list
- Files: response_cache.txt and cache_timestamp.txt

Caching avoids repeated network and LLM calls for up to 7 days. You can override both the source URL and the LLM model. The default LLM is Groq’s llama‑3.3‑70b‑versatile through aichat; ensure your aichat config and API keys (e.g., GROQ) are set.

Flow:
1) Parse flags: --url, --model, --no-cache
2) Validate or create cache
3) If cache is fresh, print it; else:
   - curl URL → pandoc (html→plain) → aichat prompt
   - write both response and timestamp to cache
   - print response

### Usage

Basic (uses defaults and cache):
```
~/.scripts/bin/ollama-list.sh
```

Force refresh (ignore cache):
```
~/.scripts/bin/ollama-list.sh --no-cache
```

Use a different source URL:
```
~/.scripts/bin/ollama-list.sh --url "https://ollama.com/library?sort=updated"
```

Use a different LLM (requires aichat provider set up):
```
~/.scripts/bin/ollama-list.sh --model "openai:gpt-4o-mini"
~/.scripts/bin/ollama-list.sh --model "ollama:llama3:8b"   # local Ollama via aichat
```

Pipe to pager:
```
~/.scripts/bin/ollama-list.sh | less -R
```

Qtile keybinding example (spawn in terminal):
```
Key([mod], "o", lazy.spawn("alacritty -e ~/.scripts/bin/ollama-list.sh"))
```

---

> [!TIP]
> - The name suggests “Ollama” but the script doesn’t use the `ollama` CLI; it only scrapes the library page and formats via `aichat`. Consider renaming for clarity.
> - Error handling is minimal: if curl/pandoc/aichat fail, the script still writes empty cache. Add set -euo pipefail and check exit codes.
> - Cache is not keyed by URL/model; switching flags will overwrite a single cache. Include a hash of URL+model in filenames.
> - The aichat prompt is vague; provide a stricter instruction for consistent formatting.
> - Consider adding a User-Agent to curl and handling HTTP errors and timeouts.
> - Concurrency: add a simple lockfile to prevent overlapping runs corrupting the cache.