# Hypertext Viewer

---

**html_viewer.py**: Simple graphical viewer for local HTML and Markdown, with folder browsing.

---

### Dependencies

- `python3` — Required to run the script.
- `PyQt6` — Provides the Qt GUI (widgets, WebEngine, core modules).
- `PyQt6-WebEngine` — Enables web page rendering.
- `markdown` — Converts Markdown files to HTML for display.
- (Optional) Your Arch Linux setup should have the necessary Qt6 and Python dependencies (`python-pyqt6`, `python-pyqt6-webengine`, `python-markdown` on Arch).

### Description

This script implements a minimal hypertext file viewer for local HTML, Markdown documents, and folders, tailored for desktop use. It combines a web browser widget (via PyQt6's `QWebEngineView`) with custom folder and Markdown handling:
- **Folder as Entry Point**: Dropping a directory opens `index.md`, `index.html`, or `README.md` if present; else, it lists folder contents as clickable links.
- **Markdown Rendering**: .md files are rendered as HTML using Python's `markdown` module, with support for Obsidian-style `[[wiki links]]`, auto-converted to Markdown link syntax before rendering.
- **Navigation**: Maintains simple back/forward history, a URL bar for navigation, and clickable links in HTML/Markdown.
- **JavaScript Toggle**: Simple menu/toolbar UI for toggling JS support—ideal when opening unknown or potentially unsafe HTML.
- **Smart File-Finding**: Resolves relative or missing files by recursively searching from a `project_root` (the first file/dir loaded).
- **Cross-link Handling**: Local file and wiki links (in Markdown) transparently open without launching an external browser; web URLs (e.g., `http://`) are printed to stdout.

The flexible design lets you browse, preview, and traverse documentation projects, code wikis, or general HTML/Markdown notes from within a PyQt-based app.

### Usage

Run interactively or map to a qtile keybinding. Example invocations:

```
# Open a Markdown file
html_viewer.py ~/projects/wiki/NLP_notes.md

# Open a directory (tries to open index.md/html, or browses files)
html_viewer.py ~/projects/wiki/

# Disable JavaScript for web view (for security)
html_viewer.py --disable-js somefile.html

# Run with no argument, then open files using the GUI menu
html_viewer.py
```

- URL bar: Enter a file or directory path to open directly.
- Use the `File` > `Open File` menu, or toolbar for navigation.
- Folders display clickable file lists.
- Go back/forward with toolbar buttons.

---

> [!CAUTION]
> - The script does not currently sanitize potentially unsafe HTML or JS—use the JavaScript toggle when opening untrusted files.
> - There’s no support for opening remote (http/https) URLs within the viewer; external links are just printed to stdout.
> - The file-finding logic is simple (considers only file names, not relative paths as hyperlinks may expect).
> - Large directories/folders are displayed with a minimal HTML template—could be styled for improved navigation.
> - The GUI depends on PyQt6; startup time and resource usage are higher than CLI tools. Consider using `xdg-mime` or qtile custom keybindings for best integration in your environment.
> - Internationalization and accessibility features are not present; folder/file names with non-UTF8 chars may cause issues.