# LLM Documentation Generator for Scripts Repository

---

**llm-script-describer.py**: Auto-generate per-script docs + README summary from your $SCRIPTS repo

---

### Dependencies

- `python>=3.13`
- `uv` (runs the script via the shebang `uv run --script`)
- `openai` (API client used to generate documentation and README summary)
- `colorama` (colored terminal output)
- `fd` (fast file discovery for `get_script_files()`)
- `ripgrep` / `rg` (filters out non-script files from the `fd` output)
- `utils_update_symlinks.sh` (your helper to refresh `symlink_data.csv`)
- Environment:
  - `$SCRIPTS` (root of your scripts repo)
  - `$OPENAI_API_KEY` (OpenAI API key)

### Description

This script maintains your documentation pipeline for a scripts repository (Arch Linux + qtile context baked into the LLM prompts).

Workflow:
1. **Refresh symlink inventory** by running `utils_update_symlinks.sh` (expected to update `symlink_data.csv`).
2. **Detect and delete orphan docs**: scans `docs/scripts/*.md` and removes entries for scripts no longer present in `$SCRIPTS` (excluding `archived/`, `docs/`, etc.).
3. **Generate per-script documentation** from paths listed in `symlink_data.csv`, using a thread pool for parallelism.  
   - Uses SHA-256 hashes stored in `script_info.json` to **skip unchanged scripts**.
   - If a script is detected as **binary**, it attempts to locate a readable source file under `src/<name>/<name>.<ext>`.
4. **Update docs index** (`docs/index.md`) in batch, appending `- [file](path) -- *short desc*` entries.
5. **Update `README.md`** by replacing content between:
   - `<!-- llm_generated_output_start -->` / `<!-- llm_generated_output_end -->` (repo summary)
   - `<!-- table_start -->` / `<!-- table_end -->` (File/Description table sourced from `script_info.json`)

### Usage

Run manually (interactive terminal recommended because of colored logs):

    export SCRIPTS="$HOME/.scripts"
    export OPENAI_API_KEY="..."
    /home/matias/.scripts/meta/llm-script-describer.py

Override the per-script model (note: summary model is hardcoded via `SUMMARY_LLM`):

    llm-script-describer.py gpt-5.2

Typical “tldr”:
- Update symlinks → prune stale docs → generate docs → rebuild README sections.

---

> [!TIP]
> A few robustness tweaks would help: `process_csv()` ignores the CLI model (`PER_FILE_LLM` is passed instead of `L`), `short_description = description.split("---")[1]...` is brittle if the LLM deviates from the template, and `rm` is invoked via `shell=True` (prefer `os.remove()` to avoid shell pitfalls). Also consider rate-limiting/backoff for OpenAI calls when using 10 threads, and guard `README.md` tag lookups with clearer error messages.