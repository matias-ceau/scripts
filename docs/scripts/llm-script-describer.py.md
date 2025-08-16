# LLM Script Describer & Repo Doc Generator

---

**llm-script-describer.py**: Generate per-script docs and a README summary for your scripts repo

---

### Dependencies

- `python>=3.13` — runtime for the script
- `uv` — runs the script from the shebang (`uv run --script`)
- `colorama` — colored terminal output
- `openai` — OpenAI API client
- `fd` — fast file discovery (fd-rs)
- `ripgrep` — used as `rg` to filter files
- `coreutils` — `rm` used to delete orphaned docs
- `utils_update_symlinks.sh` — your helper that populates/refreshes symlinks and CSV
- `OPENAI_API_KEY` — env var for OpenAI access

### Description

This tool scans your `$SCRIPTS` tree to automatically generate GitHub-friendly documentation for each script and an overall README summary. The flow:

- Refresh symlinks with `utils_update_symlinks.sh`.
- Enumerate candidate files with `fd`, excluding non-relevant dirs and file types.
- For each script listed in `symlink_data.csv`, compute a hash and skip unchanged files via `script_info.json`.
- Detect binaries (NUL byte heuristic); if binary, try to read a matching source in `$SCRIPTS/src` with common extensions.
- Call OpenAI Chat Completions with a structured system prompt to produce per-script docs; write them to `docs/scripts/<filename>.md`.
- Maintain an alphabetical `docs/index.md` pointing to each doc.
- Generate a repository-level summary and a docs table inside README.md between:
  - `<!-- llm_generated_output_start --> ... <!-- llm_generated_output_end -->`
  - `<!-- table_start --> ... <!-- table_end -->`

Models: per-file docs default to `gpt-5`, summary to `o4-mini-high`.

### Usage

- Prepare environment (Arch + qtile):
  ```
  export SCRIPTS="$HOME/.scripts"
  export OPENAI_API_KEY="sk-..."
  pacman -S fd ripgrep
  uv pip install colorama openai
  ```
- Ensure structure and markers:
  ```
  mkdir -p "$SCRIPTS/docs/scripts" "$SCRIPTS/src"
  # README.md must contain the llm_generated_output_* and table_* markers
  ```
- Provide CSV of scripts to document (first row is treated as header and skipped):
  ```
  cat > "$SCRIPTS/symlink_data.csv" <<EOF
  path
  /home/matias/.scripts/meta/llm-script-describer.py
  /home/matias/.scripts/foo.sh
  EOF
  ```
- Run:
  ```
  ~/.scripts/meta/llm-script-describer.py
  # or explicitly with uv
  uv run --script ~/.scripts/meta/llm-script-describer.py
  ```
- Optional: Bind a qtile key to spawn this script for quick refreshes, but beware API usage.

---

> [!TIP]
> - The CLI argument for `llm_model` is parsed but not actually used; `PER_FILE_LLM` and `SUMMARY_LLM` constants are enforced. Consider passing `args.llm_model` to `process_csv`.
> - `rm_orphaned_docs` assumes `docs/scripts` exists; create it before listing to avoid `FileNotFoundError`.
> - Binary detection via NUL-byte is heuristic; consider `file --mime` for robustness.
> - Hardcoded external calls (`rm` via shell=True) could be replaced with `os.remove` for safety.
> - Add retries/backoff for OpenAI errors and guard against missing README markers.
> - Costs/rate limits: cache LLM outputs more aggressively or support dry-run mode.