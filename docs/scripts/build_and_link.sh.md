# Build and link sources into $SCRIPTS/bin

---

**build_and_link.sh**: Build C/C++ or uv-installed Python app and symlink into repo

---

### Dependencies

- `bash` – required shell
- `gcc` – build C sources
- `g++` – build C++ sources
- `uv` – install Python apps from a pyproject (Astral’s uv)
- `ln` – create/update symlinks
- `SCRIPTS` – env var pointing to your scripts root (expects `$SCRIPTS/bin`)

### Description

This helper compiles or installs a single source file and places the resulting binary/app under `$SCRIPTS/bin`, then creates a symlink in the current repository directory for convenient local invocation.

Behavior by extension:
- .c → compiled with `gcc` to `$SCRIPTS/bin/<base>`
- .cpp → compiled with `g++` to `$SCRIPTS/bin/<base>`
- .py → if `pyproject.toml` is present in the current dir, installs the app with `uv pip install --app . --target "$SCRIPTS/bin/<base>"`; otherwise it aborts with guidance

Finally, it runs `ln -sf "$SCRIPTS/bin/<base>" "$PWD/<base>"`, so `./<base>` in your repo resolves to the built artifact. The script exits on first error (`set -e`) and validates inputs early (env var, file existence).

Intended layout on Arch + qtile:
- Keep `$SCRIPTS` (e.g. `/home/matias/.scripts`) exported in your shell profile
- Ensure `$SCRIPTS/bin` is on PATH for direct execution anywhere

### Usage

Basic setup:
```bash
export SCRIPTS="$HOME/.scripts"
mkdir -p "$SCRIPTS/bin"
```

Build a C file:
```bash
cd ~/code/mytool
~/.scripts/meta/build_and_link.sh src/mytool.c
./mytool  # uses repo-local symlink to $SCRIPTS/bin/mytool
```

Build a C++ file:
```bash
cd ~/code/mycpp
~/.scripts/meta/build_and_link.sh src/runner.cpp
./runner
```

Install a Python app (requires pyproject.toml in repo root):
```bash
cd ~/code/mypyapp
~/.scripts/meta/build_and_link.sh src/cli.py
./cli
```

qtile tip: bind a key to spawn a terminal running the command above for the currently focused project, or integrate with your editor to pass the active file path.

---

> [!TIP]
> - Consider adding compiler flags (e.g., `CFLAGS`, `CXXFLAGS`, `-O2 -pipe -march=native`, `-Wall -Wextra`) and a debug/release switch.
> - Check for missing tools (`command -v gcc`, `g++`, `uv`) with clear errors.
> - For Python, `uv --app --target "$BIN/$base"` may produce a directory; you might want to symlink the generated launcher inside it instead of the directory itself.
> - Allow out-of-tree building and configurable output name/path.
> - Optional: detect `pyproject.toml` relative to `src_file` rather than only `$PWD`.
> - Add support for `clang++/clang` or a default toolchain fallback.