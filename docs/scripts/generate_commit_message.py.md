# AI-Powered Commit Message Generator

---

**generate_commit_message.py**: Generate concise commit messages from staged diffs via OpenRouter or fallback

---

### Dependencies

- `git` — used to read staged diffs and numstat
- `uv` — runs this Python script with inline PEP 723 metadata and auto-installs deps
- `python>=3.12` — required runtime
- `requests` — HTTP client for the API call
- `OpenRouter API` — remote LLM service (optional; falls back when missing)

### Description

This script inspects your staged changes and produces a clean, conventional commit message. It prefers using OpenRouter (model: `openai/gpt-oss-120b`) and gracefully falls back to a locally built summary if the API key is missing or the request fails.

Highlights:
- Robust git I/O with safe decoding even on non-UTF8/binary content.
- Smart diff condensation with per-file change caps, exclusion patterns (e.g. node_modules, lockfiles, minified assets), and numstat fallback.
- Message sanitization: removes code fences, boilerplate (“Commit message:”), control chars, and length-caps to avoid CI/editor issues.
- Always prints something sensible; never blocks your commit due to API/encoding errors.

Environment knobs:
- `OPENROUTER_API_KEY` (or any env var containing `OPENROUTER`) for API auth.
- `COMMIT_MAX_DIFF_CHARS` (default 120000), `COMMIT_PER_FILE_CHANGE_LIMIT` (default 2000).
- `COMMIT_DIFF_ENCODING` (default utf-8), `COMMIT_DIFF_ERRORS` (replace|ignore|surrogateescape).
- `COMMIT_MAX_MESSAGE_CHARS` (default 4000).

### Usage

TL;DR:
```bash
# 1) Stage your changes
git add -A

# 2) Print a commit message to stdout (uses fallback if no API key)
~/.scripts/bin/generate_commit_message.py

# 3) Commit with generated message
git commit -F <(~/.scripts/bin/generate_commit_message.py)
```

Set API key (OpenRouter):
```bash
export OPENROUTER_API_KEY="sk-or-..."
```

As a prepare-commit-msg hook:
```bash
cat > .git/hooks/prepare-commit-msg <<'SH'
#!/bin/sh
# If message already provided, do nothing
[ -s "$1" ] && exit 0
msg="$HOME/.scripts/bin/generate_commit_message.py"
"$msg" > "$1" || exit 0
SH
chmod +x .git/hooks/prepare-commit-msg
```

Quick alias to add+commit:
```bash
git config alias.acm '!f(){ git add -A && msg="$($HOME/.scripts/bin/generate_commit_message.py)" && git commit -m "$msg"; }; f'
```

Qtile keybinding idea:
- Bind a terminal command that runs the alias in your repo, or trigger a small script that opens a terminal and runs the commit flow.

---

> [!TIP]
> - Consider CLI flags for model/url selection and a “local only” mode (no network).
> - The env key discovery may match unintended variables containing OPENROUTER; restrict to exact names.
> - Add support for writing directly to a provided commit message file (hook arg) for tighter integration.
> - Exclusion patterns are substring-based; anchoring/globs might be more precise.
> - Consider supporting unstaged diffs or a flag to include working tree changes.