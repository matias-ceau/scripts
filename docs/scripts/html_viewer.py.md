# Hypertext Viewer (PyQt6)

---

**html_viewer.py**: PyQt6 viewer for HTML/Markdown/text with folder index + wiki links

---

### Dependencies

- `uv` (shebang runs the script via `uv run --script`)
- `python>=3.13`
- `markdown` (Markdown → HTML conversion)
- `pyqt6`, `pyqt6-webengine-qt6`, `pyqt6-qt6`, `pyqt6-sip` (GUI + WebEngine)

### Description

A lightweight desktop “docs browser” meant for local projects (notes, README trees, exported docs). It wraps a `QWebEngineView` in a `QMainWindow` and adds:

- **File/folder opening**
  - If a folder is opened, it auto-detects `index.md`, `index.html`, or `README.md`.
  - If none exists, it renders a clickable **directory listing** as HTML.
- **Markdown rendering**
  - `.md` files are converted using `markdown.markdown()`.
  - Supports Obsidian-style wiki links by rewriting:
    - `[[file]]` → `[file](file)`
    - `[[alias|file]]` → `[alias](file)`
- **Smart local link handling**
  - Clicked local links are intercepted (`CustomWebEnginePage.acceptNavigationRequest`) and resolved.
  - If a link points to a missing local path, it falls back to searching the **whole project root** (directory of the initially opened path, otherwise `cwd`).
- **Navigation**
  - A simple custom history stack with Back/Forward actions.
- **Optional JavaScript**
  - Toggleable via menu or `--disable-js`, applied through `QWebEngineSettings`.

This fits well as a qtile keybinding helper to quickly browse a repo’s docs or your notes directory.

### Usage

Run directly (via the `uv` shebang):

- Open a file:
  - `~/.scripts/bin/html_viewer.py README.md`
- Open a folder (loads `index.md`/`index.html`/`README.md` or shows listing):
  - `~/.scripts/bin/html_viewer.py ~/projects/myrepo`
- Disable JavaScript (safer for random HTML):
  - `~/.scripts/bin/html_viewer.py --disable-js docs/index.html`

In qtile, you can bind it to open the current project docs, e.g.:
- `lazy.spawn("~/.scripts/bin/html_viewer.py ~/projects/foo")`

---

> [!TIP]
> A few improvements worth considering:
> - When `findFile()` fails in `loadFile()`, the error prints `None` because `file_path` gets overwritten; keep the original input for clearer messages.
> - `os.walk()` on every missing link can be slow on big repos; caching an index (or limiting to certain extensions) would speed things up.
> - External URLs are only printed; optionally open them via `xdg-open` or allow navigation in the same view (with a safety prompt).