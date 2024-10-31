# Minimal Local HTML Browser

---

**minimal-browser.py**: A simple Python-based browser for rendering local HTML files

---

### Dependencies

- `PyQt6`: Python bindings for the Qt toolkit, used for creating the GUI and rendering web content with `QWebEngineView`.

### Description

The `minimal-browser.py` script sets up a basic browser that can be utilized to display local HTML or markdown files via Python and PyQt6. By leveraging `QWebEngineView` from the `QtWebEngine` module, this script provides a lightweight browsing solution aimed at local applications. This can be particularly useful for tasks such as viewing documentation generated from markdown or testing static HTML content. Designed on Arch Linux with Qtile WM in mind, it ensures smooth integration with minimalist setups, where system resource conservation is a priority.

Upon execution, the script opens a window titled "Simple Browser". If a file path is passed as a command-line argument, it will load that file; otherwise, it defaults to loading a pre-configured local HTML file located on the user's system.

### Usage

This script can be executed directly from a terminal. It accepts an optional argument that specifies the file path to the HTML document you wish to view.

```bash
# To run the script without arguments (default file)
python /home/matias/.scripts/bin/minimal-browser.py

# To run the script with a specific local HTML file
python /home/matias/.scripts/bin/minimal-browser.py /path/to/your/document.html
```

Given its minimalistic nature, it can be associated with keyboard shortcuts in qtile or any other window manager to enhance productivity, allowing quick access to local files.

---

> [!NOTE]  
> While the script efficiently serves its purpose, utilizing a predefined file as a default might not cater to all users' needs. Consider allowing users to modify settings, such as default file paths, through a configuration file or environment variables for improved flexibility. Furthermore, enhancing error handling, such as checking file existence before loading, would improve user experience, especially when misconfigurations or path issues arise.