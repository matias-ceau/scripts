# Minimal PyQt WebEngine Browser

---

**minimal-browser.py**: Minimal PyQt6 WebEngine viewer for local HTML/docs (or any URL)

---

### Dependencies

- `python` (Arch package: `python`)
- `PyQt6` (Arch: `python-pyqt6`)
- `PyQt6-WebEngine` / Qt WebEngine bindings (Arch: typically `python-pyqt6-webengine`)
- Qt WebEngine runtime libs (pulled by the packages above)

### Description

`minimal-browser.py` is a tiny GUI “browser” built with **PyQt6** and **QWebEngineView**. It’s ideal for a qtile/Arch workflow when you want a dedicated, lightweight viewer for **local documentation** (Sphinx builds, project docs, static HTML) without launching a full browser profile.

Behavior:

- If a command-line argument is provided, it loads it via `QUrl(sys.argv[1])`.
- Otherwise it falls back to a hard-coded default file URL:
  `file:///home/matias/git/matias-ceau/pyfiber/docs/_build/html/index.html`
- It wraps the `QWebEngineView` in a basic `QMainWindow` + `QVBoxLayout`.

This is especially handy as a “docs viewer” you can bind in qtile, or use as a quick HTML preview tool while developing static sites.

### Usage

Run from a terminal (or bind to a qtile key):

- Open the default doc page:
  
      minimal-browser.py

- Open a local HTML file (recommended with `file://`):
  
      minimal-browser.py file:///home/matias/project/docs/_build/html/index.html

- Open a remote URL:
  
      minimal-browser.py https://docs.python.org/3/

tldr:

- `minimal-browser.py` → opens your predefined docs homepage  
- `minimal-browser.py <url-or-path>` → opens the given target in a Qt WebEngine window

---

> [!TIP]
> Improvements to consider:
> - The argument handling is fragile: passing a plain filesystem path (e.g. `/home/.../index.html`) won’t become a proper `file://` URL; detect local paths and convert using `QUrl.fromLocalFile()`.
> - Add basic navigation (back/forward/reload, address bar) or at least keyboard shortcuts for a smoother “viewer” experience.
> - The hard-coded default path is user-specific; consider reading from an env var (e.g. `MINIMAL_BROWSER_HOME`) or a config file.
> - Use `/usr/bin/env python` in the shebang for portability (`#!/usr/bin/env python3`).