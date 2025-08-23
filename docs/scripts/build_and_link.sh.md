# Build & Link Helper

---

**build_and_link.sh**: Build C/C++ or Python app into $SCRIPTS/bin and symlink into repo root

---

### Dependencies

- `bash` — script interpreter
- `coreutils` — for `ln`, `mkdir`, `basename`
- `gcc` — compiles `.c` (also provides `g++`)
- `g++` — compiles `.cpp`
- `python` — for Python projects (when using `uv`)
- `uv` — fast Python package/app installer (uses `pyproject.toml`)
- `SCRIPTS` env var — points to your scripts root (e.g. `/home/matias/.scripts`)

### Description

This small builder streamlines turning source files into runnable artifacts under `$SCRIPTS/bin` and then creates a repo-local symlink to the built target.

Flow:
- Validates `SCRIPTS` and the provided source file.
- Derives `base` from the filename (without extension).
- Ensures `$SCRIPTS/bin` exists.
- Per filetype:
  - `.c` → `gcc <src> -o $SCRIPTS/bin/<base>`
  - `.cpp` → `g++ <src> -o $SCRIPTS/bin/<base>`
  - `.py` → requires a `pyproject.toml` in the current directory, then runs:
    - `uv pip install --app . --target "$SCRIPTS/bin/<base>"`
    - This creates an isolated app install; the target is typically a directory containing `bin/` entry points.
- Finally symlinks the built artifact back into the repo root as `./<base>`.

Designed for Arch Linux and easy integration with qtile keybindings or editor workflows.

### Usage

TL;DR:
- Export your scripts root once (e.g. in shell profile):
  ```
  export SCRIPTS="$HOME/.scripts"
  ```
- From any repo directory:
  ```
  /home/matias/.scripts/meta/build_and_link.sh path/to/main.c
  /home/matias/.scripts/meta/build_and_link.sh src/tool.cpp
  ```
- For Python (project must have pyproject.toml in CWD):
  ```
  cd /path/to/python-project
  /home/matias/.scripts/meta/build_and_link.sh app/__main__.py
  ```
- Result:
  - Built artifact at: `$SCRIPTS/bin/<base>`
  - Symlink at repo root: `./<base>` pointing to the built artifact (or app dir)

Qtile example (bind to compile current file from terminal):
```
lazy.spawn("$HOME/.scripts/meta/build_and_link.sh $FILE")
```

---

> [!TIP]
> - `SRC` is defined but unused; remove or repurpose.
> - Consider adding `-O2 -pipe -march=native -Wall -Wextra` via `CFLAGS/CXXFLAGS`, and accept optional flags.
> - Detect and warn if `uv` is missing; suggest `sudo pacman -S uv`.
> - For Python, `uv pip install --app` creates a directory; you may want to symlink its `bin/<entrypoint>` instead of the whole dir.
> - Use absolute paths via `realpath` to make symlinks robust when invoked from elsewhere.
> - Add support for more languages (`cargo`, `go build`, `zig`, `make`/`meson`) and a help message (`-h/--help`).
> - Guard against clobbering an existing file named `<base>` in the repo.