# Build & link a source file into `$SCRIPTS/bin`

---

**build_and_link.sh**: Build a C/C++/Python app into `$SCRIPTS/bin` and symlink it locally

---

### Dependencies

- `bash`
- `gcc` (for `*.c` builds)
- `g++` (for `*.cpp` builds)
- `uv` (for Python projects with `pyproject.toml`)
- `$SCRIPTS` env var (must point to your scripts workspace; expects `$SCRIPTS/bin`)

### Description

This helper script standardizes “build it once, run it anywhere” for small utilities you keep under your `$SCRIPTS` tree on Arch.

Workflow:

1. Verifies `$SCRIPTS` is set; otherwise exits early (so you don’t accidentally build into a random path).
2. Uses the first CLI argument as the source path (`src_file`) and ensures it exists.
3. Derives the output name from the source filename (e.g. `foo.c` → `foo`).
4. Ensures `$SCRIPTS/bin` exists.
5. Builds/installs based on file extension:
   - `*.c` → `gcc src -o $SCRIPTS/bin/<name>`
   - `*.cpp` → `g++ src -o $SCRIPTS/bin/<name>`
   - `*.py` → expects a `pyproject.toml` in the current directory and uses `uv pip install --app . --target $SCRIPTS/bin/<name>`
6. Creates/updates a symlink in the current repository directory: `./<name>` → `$SCRIPTS/bin/<name>`

The final symlink is convenient when you want repo-local execution (`./tool`) while keeping the “real” artifact in your central `bin` directory (handy for qtile keybindings pointing at stable paths).

### Usage

```sh
# Build a C program
build_and_link.sh path/to/tool.c

# Build a C++ program
build_and_link.sh src/tool.cpp

# Python (must be run from a project dir that contains pyproject.toml)
cd path/to/python-project
build_and_link.sh main.py
```

After running, you can execute from the repo:

```sh
./tool
```

---

> [!TIP]
> Consider adding argument validation (`$# -lt 1`) and quoting `repo_dir` usage consistently. The Python branch installs into a directory named like an executable, but won’t automatically create a runnable entrypoint unless the package defines console scripts; you may prefer `uv tool run`, `uv pip install --editable`, or generating a small wrapper script in `$SCRIPTS/bin`. Also, the unused `SRC="$SCRIPTS/src"` can be removed to reduce confusion.