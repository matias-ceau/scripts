# Repository Guidelines

## Project Structure & Module Organization
Scripts exposed to the desktop live in `bin/`; many are symlinked outputs from `meta/build_and_link.sh`. Shared helpers, including the modular environment loader, sit in `lib/`; source them instead of copying logic. Place compilable sources or language-specific projects under `src/<tool>/`, each with its own `Makefile` or `justfile`. Generated documentation belongs in `docs/`, automation in `meta/`, active configs in `config/`, and legacy experiments in `archived/`. Static MkDocs output is published to `site/`.

## Build, Test, and Development Commands
`FILE=src/select_script/select_script.c make -C src/select_script build` compiles and links a binary into `bin/` via `meta/build_and_link.sh`. Run `bash test/test-env.sh` to exercise the environment modules defined in `lib/env.sh`. Use `mkdocs serve` (or `mkdocs build`) to preview documentation changes. Provision new machines with `bin/install_dependencies.sh` before running launchers or AI tooling.

## Coding Style & Naming Conventions
Start new shell scripts with `#!/usr/bin/env bash` and prefer `set -euo pipefail`; keep pipelines indented two spaces, as in `bin/rgfzf.sh`. Python utilities follow PEP 8 (four spaces, snake_case) and surface configuration through environment variables rather than flags alone. Name executables descriptively by mirroring existing hyphenated shell names (`bin/sync-repo.sh`) and snake_case Python names (`bin/sandisk_music_transfert.py`), and reuse `lib/env.sh` (`load_env_full`) for path bootstrapping.

## Testing Guidelines
Add lightweight smoke tests under `test/`, mirroring the feature under exercise (e.g., `test/test-env.sh`). Expand that harness when introducing new environment modules or variables, and execute it before opening a PR. For interactive launchers, capture manual verification steps in the corresponding `docs/scripts/<script>.md` entry.

## Commit & Pull Request Guidelines
Follow the short, imperative prefixes visible in `git log` (`feat:`, `fix:`, `refactor:`) and keep the summary within ~72 characters. Group related script updates and note side effects or required env vars in the commit body. Pull requests should include a concise description, reproduction or usage command, references to updated docs, and links to issues or TODOs when available.

## Environment & Security Notes
Always `source lib/env.sh` and call `load_env_full` before invoking repository tools directly; this exports `SCRIPTS`, Flexoki colors, and FZF defaults. Route secrets and host-specific paths through `${LOCALDATA}` or files under `config/` rather than embedding literals. Keep generated symlinks or binaries within `bin/` so they remain easy to audit and package.
