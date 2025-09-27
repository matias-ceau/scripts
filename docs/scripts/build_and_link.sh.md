# Build and symlink helper for $SCRIPTS/bin

---

**build_and_link.sh**: Compile C/C++ or install Python app into $SCRIPTS/bin and symlink into repo root

---

### Dependencies

- `bash` — shell interpreter
- `coreutils` — for `ln`, `mkdir`, etc.
- `gcc` — build C sources
- `g++` — build C++ sources
- `uv` — Python packaging/installer (Arch: pacman -S uv)
- `pyproject.toml` — required when installing a Python project
- `SCRIPTS` — environment variable pointing at your scripts root (e.g. $HOME/.scripts)

### Description

This meta-builder compiles a single C/C++ source file or installs a Python project into $SCRIPTS/bin, then creates a symlink back into the current repository directory. It is designed for a simple, local workflow on Arch Linux, and pairs well with qtile keybindings or shell aliases.

Flow:
- Verifies SCRIPTS is set, creates $SCRIPTS/bin if needed.
- Deduces the base name from the provided source path.
- For .c/.cpp: builds to $SCRIPTS/bin/<base> via gcc/g++.
- For .py: if the current working directory contains pyproject.toml, installs the app using uv into $SCRIPTS/bin/<base>.
- Finally, symlinks $SCRIPTS/bin/<base> to ./<base> in your current repo.

Note: The “repo_dir” is the current working directory; run the script from the repository where you want the symlink to appear.

### Usage

Set up once in your shell profile:
```bash
export SCRIPTS="$HOME/.scripts"
```

C example:
```bash
cd ~/code/my-c-tool
"$SCRIPTS/meta/build_and_link.sh" "$SCRIPTS/src/hello.c"
# Produces $SCRIPTS/bin/hello and symlink ./hello
```

C++ example:
```bash
cd ~/code/my-cpp-tool
"$SCRIPTS/meta/build_and_link.sh" "$SCRIPTS/src/greeter.cpp"
# Produces $SCRIPTS/bin/greeter and symlink ./greeter
```

Python (uv, from a project with pyproject.toml):
```bash
cd ~/code/my-py-app        # must contain pyproject.toml
"$SCRIPTS/meta/build_and_link.sh" "$SCRIPTS/src/my-py-app.py"
# Installs app into $SCRIPTS/bin/my-py-app and symlinks ./my-py-app
```

qtile binding idea (spawn a rebuild for a known file):
```python
Key([mod], "b", lazy.spawn("$HOME/.scripts/meta/build_and_link.sh $HOME/.scripts/src/hello.c"))
```

---

> [!WARNING]
> - Python path is only used for extension detection; the actual install targets the current directory’s pyproject. Consider taking the project dir as the argument for Python.
> - uv --app --target writes an app layout (often a directory with bin/). Symlinking $BIN/<base> may point to a directory, not an executable. You may want to link $BIN/<base>/bin/<entrypoint> instead.
> - No compiler flags are set. Add CFLAGS/CXXFLAGS/LDFLAGS (e.g., -O2 -Wall -Wextra) or accept extra args.
> - $SRC is defined but unused.
> - Consider set -euo pipefail, using realpath, and better error messages.