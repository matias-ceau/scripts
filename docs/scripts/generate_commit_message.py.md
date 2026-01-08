# AI commit message generator (OpenRouter + safe fallback)

---

**generate_commit_message.py**: Generate a commit message from the staged diff (LLM or fallback)

---

### Dependencies

- `python>=3.12`
- `uv` (script shebang runs via `uv run --script`)
- `requests` (HTTP call to the chat completion endpoint)
- `git` (reads staged diff/numstat)
- Environment variable for API key (see below)

### Description

This script prints a ready-to-use Git commit message based on your *staged* changes.

Workflow:
1. Reads the staged diff via `git diff --cached` with robust decoding (configurable via `COMMIT_DIFF_ENCODING` / `COMMIT_DIFF_ERRORS`).
2. If the diff is too large, it **condenses** it:
   - Splits per file (`diff --git` blocks)
   - Removes context lines, keeps headers/hunks and `+/-` lines
   - Truncates long lines and caps per-file change lines
   - Fully “summarizes” excluded paths (locks, `dist/`, minified assets, sourcemaps, etc.)
   - Final fallback: `--numstat` summary + small snippets
3. Calls OpenRouter (`https://openrouter.ai/api/v1/chat/completions`) using `openai/gpt-oss-120b`.
4. Sanitizes the response (removes code fences / “Commit message:” chatter, strips control chars, hard caps length).
5. If anything fails (no key, network, API, encoding), it **never blocks you**: it generates a deterministic message from `git diff --cached --numstat`.

API key lookup is flexible: it tries `openrouter`, then `OPENROUTER_API_KEY`, then any env var containing `OPENROUTER`.

### Usage

Run inside a git repo with staged changes:

- Stage changes first:
  - `git add -p`
- Generate message:
  - `~/.scripts/bin/generate_commit_message.py`

Use it directly for a commit:

- `git commit -m "$(~/.scripts/bin/generate_commit_message.py)"`

Tuning (examples):

- `COMMIT_MAX_DIFF_CHARS=80000 COMMIT_PER_FILE_CHANGE_LIMIT=800 ~/.scripts/bin/generate_commit_message.py`
- `OPENROUTER_API_KEY=... ~/.scripts/bin/generate_commit_message.py`

---

> [!TIP]
> Consider adding a CLI (`--api/--model/--url`) instead of hardcoding defaults, and support `git commit` templates/hooks (e.g., `prepare-commit-msg`) so it can auto-fill your editor buffer. Also, the env “contains OPENROUTER” heuristic can pick the wrong variable; preferring an explicit name first (already done) and documenting it prominently helps avoid surprises.