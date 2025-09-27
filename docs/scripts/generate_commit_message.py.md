# AI-powered Git commit message generator

---

**generate_commit_message.py**: Generate commit messages from staged diff via OpenRouter; safe fallback

---

### Dependencies

- `uv` — runs the script with inline deps; zero-setup via the shebang
- `python>=3.12` — runtime for the script
- `requests` — HTTP client (auto-resolved by `uv`)
- `git` — to read the staged diff
- `OPENROUTER_API_KEY` — API key in env; also accepts `openrouter` or any var containing `OPENROUTER`

### Description

Generates a concise commit message from the staged diff and prints it to stdout. It captures the diff with `git diff --cached --no-color --no-ext-diff -U0`, then aggressively condenses large patches to keep the prompt small, skipping noisy paths like node_modules, dist/build artifacts, lockfiles, and minified/map files. Encoding is robust: raw bytes are decoded with `COMMIT_DIFF_ENCODING` (default `utf-8`) and `COMMIT_DIFF_ERRORS` (default `replace`) to avoid crashes on binary or non-UTF8 data.

If an OpenRouter API key is present, it calls `https://openrouter.ai/api/v1/chat/completions` with `openai/gpt-oss-120b` to produce a subject (≤70 chars) plus a short body. Output is sanitized to strictly contain a valid commit message. If the key is missing or the request fails, it falls back to a deterministic summary built from `git diff --numstat`.

Config knobs (env):
- `COMMIT_MAX_DIFF_CHARS` (default 120000)
- `COMMIT_PER_FILE_CHANGE_LIMIT` (default 2000)
- `COMMIT_MAX_MESSAGE_CHARS` (default 4000)
- `COMMIT_DIFF_ENCODING`, `COMMIT_DIFF_ERRORS`

### Usage

tldr:
```bash
# Arch: ensure uv is installed (pacman -S uv) and script is on PATH
export OPENROUTER_API_KEY=sk-or-...
git add -A
git commit -m "$(~/.scripts/bin/generate_commit_message.py)"
```

Git alias:
```bash
git config --global alias.gcm '!~/.scripts/bin/generate_commit_message.py'
git commit -m "$(git gcm)"
```

Prepare-commit-msg hook:
```bash
cat > .git/hooks/prepare-commit-msg <<'SH'
#!/usr/bin/env bash
case "$2" in merge|squash) exit 0;; esac
msg="$(~/.scripts/bin/generate_commit_message.py)" || exit 0
[ -n "$msg" ] && printf '%s\n' "$msg" > "$1"
SH
chmod +x .git/hooks/prepare-commit-msg
```

Tuning (optional):
```bash
export COMMIT_MAX_DIFF_CHARS=80000
export COMMIT_PER_FILE_CHANGE_LIMIT=1200
export COMMIT_DIFF_ENCODING='utf-8'
export COMMIT_DIFF_ERRORS='replace'
export COMMIT_MAX_MESSAGE_CHARS=2000
```

Wayland clipboard (qtile):
```bash
~/.scripts/bin/generate_commit_message.py | wl-copy
```

---

> [!TIP]
> Improvements: accept CLI flags to override `model`, `url`, temperature, and limits; add provider selection (OpenAI, local LLM) via env/args; cache/timeout backoffs; optionally insert co-authors or conventional commit prefixes; unit tests for diff condensation and sanitization; support reading unstaged diff or specific paths; add a dry-run/verbose mode.