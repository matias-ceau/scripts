# GEMINI.md - Project Context

## Project Overview
This repository, located at `/home/matias/.scripts`, is a highly personalized collection of utility scripts designed for an **Arch Linux** environment using the **Qtile** window manager. It serves as a central hub for workflow automation, system management, media control, and knowledge management.

### Main Technologies & Tools
- **Languages:** Bash, Python (managed with `uv`), Xonsh (`.xsh`).
- **Fuzzy Finders & Menus:** `fzf`, `rofi`, `dmenu`.
- **Media:** `cmus` (music), `beets` (library management), `feh` (wallpapers).
- **AI Integration:** OpenAI API (GPT-4o, etc.) and Llama for documentation generation and commit message automation.
- **Utilities:** `fd` (finding), `rg` (searching), `bat` (previewing), `chezmoi` (dotfiles), `mega-cmd` (cloud sync).
- **Environment:** Heavy reliance on environment variables like `$SCRIPTS`, `$GIT_REPOS`, and `$LOCALDATA`.

## Project Structure
- `bin/`: The primary directory for executable scripts.
- `docs/`: Contains AI-generated Markdown documentation for each script in `docs/scripts/`.
- `meta/`: Maintenance and infrastructure scripts (e.g., symlinking, documentation sync, logging).
- `lib/`: Shared libraries and environment configuration (`lib/env.sh`).
- `dev/`: Experimental scripts and work-in-progress tools.
- `archived/`: Older or deprecated scripts.
- `script_info.json`: Metadata and hashes for all scripts, used for tracking documentation status.

## Building and Running

### Dependency Installation
To install the required system packages and Python dependencies:
```bash
./bin/install_dependencies.sh
```
*Note: This uses `paru` and assumes an Arch Linux system.*

### Script Integration
To make the scripts available in your `$PATH` (typically symlinking to `~/.local/bin`):
```bash
./meta/utils_update_symlinks.sh
```

### Documentation Maintenance
The project uses AI to keep its documentation up to date. To regenerate documentation and update the `README.md` index:
```bash
./meta/llm-script-describer.py
```

### Core Workflows
- **Launch Scripts:** Use `bin/script_launcher.sh` or `bin/dmenu_run_scripts.py` to search and execute tools.
- **Git Sync:** Use `bin/sync-repo.sh` or `bin/gsi.sh` for robust repository synchronization.
- **AI Commits:** Use `bin/generate_commit_message.py` to generate staged change summaries.

## Development Conventions
- **Script Metadata:** Many scripts include an `#INFO:#` tag used by the documentation generators and launchers.
- **Interactive UI:** Prefer `fzf` for terminal-based selection and `rofi`/`dmenu` for graphical/window-manager-level selection.
- **Xonsh usage:** Use `.xsh` for scripts requiring a mix of Python logic and shell command execution.
- **Error Handling:** Python scripts often use `colorama` for status reporting and `subprocess` for shell integration.
- **Documentation:** Every script in `bin/` should ideally have a corresponding `.md` file in `docs/scripts/`, generated via `meta/llm-script-describer.py`.
- **Environment Loading:** Shell scripts should source `lib/env.sh` to ensure consistent paths and color variables.
