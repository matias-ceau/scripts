# LLM Script Describer — generate per-file docs and a README summary

---

**llm-script-describer.py**: Generate per-script docs and README sections via OpenAI

---

### Dependencies

- `uv` — runs the script and resolves Python deps from the header
- `python>=3.13` — required by the script header
- `colorama` — colored terminal output
- `openai` — OpenAI Chat Completions client
- `fd` — fast file discovery in $SCRIPTS
- `ripgrep` — filters paths (exclude patterns)
- `utils_update_symlinks.sh` — your helper to refresh symlink_data.csv (in $PATH)
- `OPENAI_API_KEY` — OpenAI API token
- `SCRIPTS` — root of the scripts repository

### Description

This meta-tool walks your scripts repo, decides what needs documenting, and asks an LLM to generate GitHub-ready markdown. Flow:
1) Refresh symlinks via `utils_update_symlinks.sh`.
2) Find relevant files with `fd` (excluding archived/config/docs/log/data and media).
3) Cache-aware processing: compute sha256 per file and skip unchanged entries (persisted in `script_info.json`).
4) Binary detection: if a file contains NUL bytes, look for a textual source in `$SCRIPTS/src` with one of: .c, .cpp, .py, .sh, .rs, .go, .js, .ts, .rb, .java, .cs.
5) Per-file docs: write to `docs/scripts/<filename>.md`, then update `docs/index.md`.
6) README: inject a global summary between `<!-- llm_generated_output_start -->` and `<!-- llm_generated_output_end -->`, and rebuild a table between `<!-- table_start -->` and `<!-- table_end -->`.

Models: per-file uses PER_FILE_LLM (default “gpt-5”), and the README summary uses SUMMARY_LLM (“o4-mini-high”).

### Usage

- Prepare environment:
  ```
  export SCRIPTS="$HOME/.scripts"        # repo root
  export OPENAI_API_KEY="sk-..."         # your key
  ```
- Ensure README has these tags:
  ```
  <!-- llm_generated_output_start -->
  <!-- llm_generated_output_end -->
  <!-- table_start -->
  <!-- table_end -->
  ```
- Run (Arch + uv):
  ```
  ~/.scripts/meta/llm-script-describer.py
  ```
- Optional model arg (currently ignored by the script):
  ```
  ~/.scripts/meta/llm-script-describer.py gpt-4o-mini
  ```
- Force a full rebuild:
  ```
  rm "$SCRIPTS/script_info.json"
  ~/.scripts/meta/llm-script-describer.py
  ```
- Qtile keybinding example:
  ```
  Key([mod, "shift"], "D", lazy.spawn("~/.scripts/meta/llm-script-describer.py"))
  ```

---

> [!WARNING]
> - README tags are mandatory; missing tags will crash `.index()` lookups.
> - update_index sorts the whole file, potentially scrambling headings; restrict sorting to list items only.
> - The CLI model argument is parsed but never used; `PER_FILE_LLM`/`SUMMARY_LLM` are hard-coded.
> - `"[FILE]:"` in llm_summarize doesn’t match the documented `"[FILE]"` format; fix for better summaries.
> - Short description extraction is brittle (`split('---')`); consider a dedicated front-matter parser.
> - Binary detection (NUL-in-first-1KiB) is heuristic; allow overrides or MIME checks.
> - Add retries/rate limiting and better error handling for OpenAI API failures.