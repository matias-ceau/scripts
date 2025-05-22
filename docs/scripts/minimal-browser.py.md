# Minimal Python Qt Web Browser

---

**minimal-browser.py**: Minimal local HTML viewer using PyQt6/QWebEngine, for local docs or apps

---

### Dependencies

- `python` (>=3.8): Standard Python interpreter.
- `PyQt6`: Python bindings for the Qt6 application framework (including QtWebEngine).
- `PyQt6-WebEngine`: Provides the `QWebEngineView` widget for web content rendering.

*On Arch Linux:*
```bash
sudo pacman -S python-pyqt6 python-pyqt6-webengine
```
or consider using `pip` in a virtual environment.

### Description

This script launches a minimalistic web browser using the PyQt6 framework, specifically the `QWebEngineView` widget. The goal is to offer a lightweight alternative to full-featured browsers for use cases such as:

- Browsing local web documentation (e.g., Sphinx/Markdown-generated docs)
- Testing static HTML/JS pages locally
- Creating streamlined browser windows for local apps

**Features:**
- Opens a specified local file (HTML, Markdown rendered as HTML).
- If no file is passed via CLI, it defaults to your local Sphinx docs (`/home/matias/git/matias-ceau/pyfiber/docs/_build/html/index.html`).
- Simple GUI window, using Qt’s vertical layout.

**Main components:**
- `QApplication`: Manages application control.
- `SimpleBrowser` (QMainWindow): Hosts a `QWebEngineView` widget.
- CLI file argument handling: Loads file from `sys.argv[1]` if present.

### Usage

From a shell:

```bash
# Open a specific local HTML file
minimal-browser.py /path/to/your/file.html

# Open the default page (pyfiber Sphinx docs)
minimal-browser.py
```

If you want to bind it to a qtile keybinding (example):
```python
Key([mod], "f1", lazy.spawn("minimal-browser.py ~/docs/index.html"))
```

You can place this script anywhere in your `$PATH` for easy access. Make it executable:

```bash
chmod +x ~/.scripts/bin/minimal-browser.py
```

---

> [!NOTE]
> - The script currently only loads local files and assumes HTML compatibility. If you pass in a Markdown file, it will not render it correctly unless it has already been converted to HTML.
> - No navigation (Back/Forward/Reload) or URL bar is provided—this is by design, but if needed, you could easily enhance it with Qt widgets.
> - There is minimal error handling. If the file path is invalid or the WebEngine components aren’t properly installed, the script may crash.
> - The script hardcodes a default path. Consider reading a config file or using a dialog for greater flexibility.
> - The shebang should be `#!/usr/bin/env python3` for portability, especially if your system calls `python` as version 2.x for some reason.
