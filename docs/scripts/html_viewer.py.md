# HTML Viewer with Markdown Support

---

**/home/matias/.scripts/bin/html_viewer.py**: Simple HTML viewer with support for Markdown conversion

---

### Dependencies

- `python3` – The scripting language used for execution.
- `PyQt6` – Provides the GUI framework, including modules: QtWidgets, QtGui, QtCore, QtWebEngineWidgets, and QtWebEngineCore.
- `markdown` – A Python library to convert Markdown content to HTML.

### Description

This script implements an enhanced HTML viewer that integrates both HTML and Markdown rendering capabilities. Designed for Arch Linux users running qtile, it utilizes PyQt6 to create a fully functional GUI that allows users to navigate local files, display their content, and seamlessly convert Markdown files into HTML format. 

Key features include:
- **Multiple File Support**: Automatically detects and loads files with extensions .html, .htm, and .md. If a directory is provided, it searches for common index files or displays folder contents as clickable links.
- **Wiki-Style Link Conversion**: Before converting Markdown to HTML, it processes custom wiki-style links (e.g., [[alias|link]]) to standard Markdown link syntax.
- **Navigation History**: Simple back and forward navigation is maintained, allowing the user to browse previously viewed documents.
- **JavaScript Control**: An option to disable JavaScript execution within the viewer for enhanced security or performance.

The UI is built around a QWebEngineView for rendering and a toolbar that includes navigation buttons and a URL bar for direct file input. The incorporation of a custom QWebEnginePage intercepts link clicks to enable smooth navigation between local files.

### Usage

To run the script interactively from a terminal:
  
  $ ./html_viewer.py [-d|--disable-js] [path]

Examples:

- Launch the viewer with JavaScript enabled and open a specific file:
  
  $ ./html_viewer.py /path/to/document.md
  
- Launch the viewer with JavaScript disabled:
  
  $ ./html_viewer.py --disable-js /path/to/folder

The script can also be bound to a key in qtile or integrated into an application launcher for quick access.

---

> [!TIP]
> Consider adding exception handling when reading files to manage potential errors due to file permissions or missing files. Additionally, the search functionality (findFile) could be optimized for larger directories. Improving the UI responsiveness when rendering large Markdown documents might also enhance the overall user experience.