# Minimal Browser Script

---

**minimal-browser.py**: A simple browser for viewing local HTML and markdown files.

---

### Dependencies

- `PyQt6`: This is a set of Python bindings for the Qt libraries, used to create the GUI application and handle web rendering.

### Description

The `minimal-browser.py` script creates an uncomplicated web browser using the PyQt6 framework. It utilizes the `QWebEngineView` from the `PyQt6.QtWebEngineWidgets` module to display local HTML files. This script is particularly useful for users who need a lightweight solution for viewing documentation or testing HTML content without the overhead of traditional web browsers.

Here's how the script works:

- **Class Definition**: A class named `SimpleBrowser` extends `QMainWindow`, which represents the main window of the application.
- **Constructor**: When instantiated, the constructor sets the window title and initializes the web engine view.
  - If a file path is provided as a command-line argument, it uses that path to load the web page.
  - If not, it defaults to loading a specified local HTML file (in this case, a documentation page located at `~/git/matias-ceau/pyfiber/docs/_build/html/index.html`).
- **Layout**: The browser is added to a vertical box layout that is then set as the central widget of the main window.

### Usage

To run the script:

1. Ensure you have `PyQt6` installed. You can install it via pip:
   ```bash
   pip install PyQt6
   ```

2. Execute the script from the terminal, optionally providing a path to an HTML file:
   ```bash
   python /home/matias/.scripts/minimal-browser.py /path/to/your/file.html
   ```
   If no argument is supplied, it will load the default HTML file.

3. The application will open up in a window displaying the requested webpage.

---

> [!TIP]  
> The script currently relies on a hardcoded path if no argument is provided. Consider adding error handling for scenarios where the file does not exist or is not accessible. Improvements could include an option for the user to select a file through a file dialog, further enhancing usability.