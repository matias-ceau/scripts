#!/bin/python

"""
If you are considering building a simple browser for local applications with Python,
here’s a potential approach:

1. **Using PyQt6 or PySide6**:
   - **Framework**: These are Python bindings for the Qt toolkit, allowing you to create a
GUI application easily.
   - **Use Case**: You can build a basic browser using `QWebEngineView` (part of
QtWebEngine) to render HTML content. This approach provides the simplicity of Python with
the power of Qt.
   - **Example**: A minimal browser could be implemented to load and display local
markdown or HTML files.
"""
import sys

from PyQt6.QtCore import QUrl
from PyQt6.QtWebEngineWidgets import QWebEngineView
from PyQt6.QtWidgets import QApplication, QMainWindow, QVBoxLayout, QWidget


class SimpleBrowser(QMainWindow):
    def __init__(self):
        super().__init__()
        self.setWindowTitle("Simple Browser")

        # Set up the web engine view
        self.browser = QWebEngineView()
        if sys.argv[1:]:
            path = QUrl(sys.argv[1])
        else:
            path = QUrl(
                "file:///home/matias/git/matias-ceau/pyfiber/docs/_build/html/index.html"
            )
        self.browser.load(path)

        # Set up the main layout
        layout = QVBoxLayout()
        layout.addWidget(self.browser)

        container = QWidget()
        container.setLayout(layout)
        self.setCentralWidget(container)


if __name__ == "__main__":
    app = QApplication(sys.argv)
    window = SimpleBrowser()
    window.show()
    sys.exit(app.exec())

"""
This script sets up a very simple browser that can navigate local HTML files, providing a
lightweight alternative to traditional web browsers for specific tasks like viewing local
documentation or testing static HTML pages.

These options should help you keep things lightweight and focused on local applications,
fitting into a more minimalistic workflow. Let me know if you have any specific
requirements or further questions!
"""
