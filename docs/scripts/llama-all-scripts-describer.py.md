# Llama-powered scripts documentation generator

---

**llama-all-scripts-describer.py**: Generate per-script markdown docs from your symlink CSV using Ollama

---

### Dependencies

- `python` (stdlib: `argparse`, `csv`, `os`, `subprocess`, `sys`)
- `ollama` (Python package) — uses `ollama.Client()` to call a local model
- `colorama` — colored terminal output
- `fd` — enumerates files under `$SCRIPTS`
- `ripgrep` (`rg`) — filters out `*.md`
- `xargs`, `basename` — shell pipeline utilities
- `utils_update_symlinks.sh` — optional pre-step to refresh symlink metadata
- Environment variable: `SCRIPTS` — base directory containing `data/`, `docs/`, `src/`

### Description

This script automates documentation for your personal scripts repo on Arch. It reads a CSV (default: `$SCRIPTS/data/symlink_data.csv`) and, for each entry, generates a markdown file in `$SCRIPTS/docs/scripts/<scriptname>.md`.

Key behaviors:

- Interactive pre-flight: asks whether to run `utils_update_symlinks.sh` before generating docs.
- Skips already-documented scripts: if `docs/scripts/<filename>.md` exists, it won’t regenerate it.
- Binary handling: detects binaries via null bytes in the first 1024 bytes. If binary, it tries to locate a matching source file in `$SCRIPTS/src/` by basename with common extensions (`.c`, `.py`, `.sh`, `.rs`, etc.).
- LLM generation: feeds the script source to Ollama (`model="llama3.1"`) and writes the returned markdown-ish description.
- Indexing: appends a link entry to `$SCRIPTS/docs/index.md`.
- Orphan check: compares existing `docs/scripts/*.md` against current script names under `$SCRIPTS` and reports orphaned docs.

### Usage

Run with default CSV:

    llama-all-scripts-describer.py

Run with a custom CSV path:

    llama-all-scripts-describer.py /path/to/symlink_data.csv

Typical workflow (good for a qtile keybinding or manual run after adding scripts):

    # update symlink csv (when prompted), then generate missing docs
    llama-all-scripts-describer.py

Outputs:

- `$SCRIPTS/docs/scripts/<script>.md` created per undocumented script
- `$SCRIPTS/docs/index.md` appended with links
- terminal report including orphaned docs

---

> [!TIP]
> Consider (1) avoiding `shell=True` in `get_script_files()` and replacing the pipeline with pure Python for portability and safety, (2) de-duplicating index entries (currently always appends), (3) making the Ollama model configurable via CLI/env, and (4) improving binary/source mapping (current approach assumes source basename matches the binary name exactly).