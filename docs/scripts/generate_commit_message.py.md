# AI-powered Git commit message generator (with safe fallback)

---

**generate_commit_message.py**: Generate a commit message from staged diff via OpenRouter (fallback to numstat)

---

### Dependencies

- `uv` (shebang uses `uv run --script`)  
- `python>=3.12`
- `git`
- An OpenRouter-compatible API key in env (see `OPENROUTER_API_KEY`, etc.)

---

### Description

This script reads your **staged** changes (`git diff --cached`) and asks an LLM (default: OpenRouter) to produce a well-formatted commit message (subject line + blank line + body). It’s built to be robust in a real Arch/qtile workflow: it avoids crashing your commit due to encoding issues, large diffs, or network/API failures.

Key behaviors:

- **Robust git output decoding** via `_git_run()` (configurable with `COMMIT_DIFF_ENCODING` and `COMMIT_DIFF_ERRORS`).
- **Diff condensation** (`condense_diff()`):  
  - Splits by file, keeps headers + hunk markers + only `+/-` lines  
  - Truncates very long lines and caps per-file change lines  
  - Excludes noisy paths (locks, `node_modules`, minified assets, etc.) using `EXCLUDE_PATTERNS`  
  - If still too big, falls back to `--numstat` + tiny per-file snippets.
- **API key discovery** (`key_finder()`): tries `openrouter`, `OPENROUTER_API_KEY`, or any env var containing `OPENROUTER`.
- **Always emits something**: if API is missing/fails or sanitization yields empty output, it generates a deterministic message from `git diff --cached --numstat` (e.g. `Update 3 files (+120 -14)` plus per-file stats).

---

### Usage

Run inside a git repo with staged changes:

    generate_commit_message.py

Typical hook/editor integration:

- As a commit template generator:

      git commit -e -m "$(generate_commit_message.py)"

- Or pipe into your editor/launcher scripts as needed.

Environment knobs:

    COMMIT_MAX_DIFF_CHARS=120000
    COMMIT_PER_FILE_CHANGE_LIMIT=2000
    COMMIT_MAX_MESSAGE_CHARS=4000
    OPENROUTER_API_KEY=...

---

> [!TIP]
> Consider adding CLI flags (model/url/api) instead of hardcoding defaults, and optionally support `--unstaged` / `--all` modes. Also, `key_finder()`’s “contains” lookup may accidentally match unrelated env vars; tightening it to a whitelist (e.g. `OPENROUTER_API_KEY`) would reduce surprises.