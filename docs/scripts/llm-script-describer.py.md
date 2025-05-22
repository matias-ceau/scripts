# LLM-Assisted Script Documenter

---

**llm-script-describer.py**: Automates documentation generation for user scripts using OpenAI's LLMs

---

### Dependencies

- `python >=3.13` — The script is written using modern Python features.
- `colorama` — For colored terminal output, improving readability.
- `openai` — Required for interaction with OpenAI LLM APIs.
- `fd` (external utility)[^1] — For efficient file searching in the script directory.
- `ripgrep` (`rg`) — Used for pattern-based filtering of files.
- `utils_update_symlinks.sh` — User-created shell script, updates symbolic links for scripts.
- `jq` (if used elsewhere for JSON processing on shell scripts, not directly in this Python script).

---

### Description

This script is designed to automate the process of documenting your user scripts in a GitHub-compatible format, integrating deeply with your `$SCRIPTS` directory structure. Its goal is to generate, update, and maintain Markdown documentation for each script, using OpenAI models for content generation. This dramatically streamlines documentation, ensuring it stays up-to-date as scripts change.

Key features:
- **Symlink maintenance**: Calls `utils_update_symlinks.sh` to ensure all scripts are properly symlinked.
- **Script discovery**: Uses `fd` and `ripgrep` to enumerate all scripts, excluding non-script/archived/config/docs/log/data files.
- **Markdown generation**: Reads (or finds source for) script files, feeds them into an OpenAI LLM, and outputs a structured Markdown file (using a customizable template/prompt for consistency).
- **Orphaned doc removal**: Deletes documentation for scripts that no longer exist.
- **Centralized index and README updating**: Keeps a global index and injects an AI-generated summary and a table of scripts into your `README.md`.
- **Change detection**: Keeps a hash-based log of all scripts (`script_info.json`), re-documenting only changed or new scripts.
- **Binary/source handling**: For binary executables, attempts to find their corresponding source code for meaningful documentation.
- **Rich, color-coded terminal output**: All operations use colorama for quick visual parsing of status, errors, and progress.

---

### Usage

Typical workflow:

```bash
export SCRIPTS="/path/to/your/scripts"
export OPENAI_API_KEY="sk-..."
python ~/.scripts/meta/llm-script-describer.py [gpt-4-1]
```

- If `llm_model` is omitted, it defaults to `gpt-4.1`.
- You must have all dependencies installed in your Python environment.
- Can be run interactively or bound to a key/chord in qtile using a lazy.spawn.
- To regenerate docs after modifying or adding scripts, simply re-run the script. It will only update docs for scripts that have changed.

tldr:
```
Edit script → Run llm-script-describer.py → Docs auto-rebuilt!
```

---

> [!TIP]
> - This script is highly modular and robust for maintaining up-to-date documentation, but it assumes a specific directory layout and naming conventions (e.g., for binaries and sources).
> - Error handling is pragmatic but doesn't do much for failed API requests except print an error.
> - The use of an LLM for doc-generation is powerful, but also a bottleneck: it incurs API costs and may occasionally create hallucinated or verbose documentation—review crucial docs for accuracy.
> - Consider adding CLI switches to process/filter specific sections or to run in "draft" mode with simulated outputs for dev/testing without spending tokens.
> - Some hard-coded paths and environment reliance (`$SCRIPTS`, reliance on `utils_update_symlinks.sh`) could be parameterized for portability or for sharing with others.
> - The markdown index update is simple and could be made more robust against file corruption/race conditions in multi-user environments.

---

[^1]: The script expects `fd` and `rg` to be installed; these can be installed from the official Arch packages (`fd` and `ripgrep`).
