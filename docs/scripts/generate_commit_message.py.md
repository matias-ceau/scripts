# AI-assisted Git commit message generator

---

**generate_commit_message.py**: Generate concise AI commit messages from staged git diffs

---

### Dependencies

- `git` — to obtain the staged diff
- `python>=3.12` — required by the script
- `requests` — HTTP client for the API call
- `uv` — optional, used by the shebang to run the script without a venv
- `OPENROUTER_API_KEY` — environment variable with your API token (OpenRouter)

### Description

This script creates a high‑quality commit message from your staged changes using an LLM (default: OpenRouter Chat Completions with model `openai/gpt-oss-120b`). It:

- Reads the staged diff with `git diff --cached`.
- Condenses large diffs:
  - Excludes noisy paths (e.g., node_modules, lockfiles, maps, minified assets) to headers only.
  - Truncates very long lines and caps per‑file change lines.
  - Falls back to a compact “numstat + first lines per file” view if still too large.
  - Honors env knobs: `COMMIT_MAX_DIFF_CHARS` (default 120000), `COMMIT_PER_FILE_CHANGE_LIMIT` (default 2000).
- Sends the condensed diff to the API and prints only the commit message to stdout (subject + blank line + body, up to ~600 tokens).

API key discovery tries, in order: `openrouter`, `OPENROUTER_API_KEY`, or any env var whose name contains `OPENROUTER`. If missing, it exits.

### Usage

TL;DR:
```bash
export OPENROUTER_API_KEY=sk-...
git add -A
~/.scripts/bin/generate_commit_message.py | git commit -F -
```

Control diff size:
```bash
COMMIT_MAX_DIFF_CHARS=80000 COMMIT_PER_FILE_CHANGE_LIMIT=1200 \
  ~/.scripts/bin/generate_commit_message.py
```

Git alias:
```bash
git config --global alias.ai-commit '!~/.scripts/bin/generate_commit_message.py | git commit -F -'
git ai-commit
```

Prepare-commit-msg hook:
```bash
cat > .git/hooks/prepare-commit-msg <<'SH'
#!/usr/bin/env bash
if [ -z "$2" ]; then
  msg="$(~/.scripts/bin/generate_commit_message.py)" || exit $?
  printf '%s\n' "$msg" > "$1"
fi
SH
chmod +x .git/hooks/prepare-commit-msg
```

Qtile workflow (Arch):
- Copy to clipboard (Wayland): add a keybinding to run
  `bash -lc "~/.scripts/bin/generate_commit_message.py | wl-copy"`
- X11 alternative: `... | xclip -selection clipboard`
- Or notify: `notify-send "$(~/.scripts/bin/generate_commit_message.py)"`

---

> [!TIP]
> - Consider adding CLI flags (api, url, model, temperature, max-tokens) and reading them via argparse.
> - The API key “fuzzy match” may capture the wrong variable; prefer explicit names and a clear precedence.
> - Add retries/backoff for transient API/network errors and surface rate-limit details.
> - Detect binary patches and mark them as such; optionally support Conventional Commits.
> - Optionally auto-run `git commit -F -` when TTY is present, with a `--print-only` switch.