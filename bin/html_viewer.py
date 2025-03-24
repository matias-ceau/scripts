#!/usr/bin/env python3

# INFO: "Simple html viewer"

import sys
import argparse
import os
import re
from PyQt6.QtWidgets import (
    QApplication,
    QMainWindow,
    QFileDialog,
    QVBoxLayout,
    QWidget,
    QMenu,
    QToolBar,
    QLineEdit,
)
from PyQt6.QtGui import QAction, QIcon
from PyQt6.QtCore import QUrl, Qt
from PyQt6.QtWebEngineWidgets import QWebEngineView
from PyQt6.QtWebEngineCore import QWebEngineSettings, QWebEnginePage
import markdown


class CustomWebEnginePage(QWebEnginePage):
    def acceptNavigationRequest(self, url, _type, isMainFrame):
        if _type == QWebEnginePage.NavigationType.NavigationTypeLinkClicked:
            self.parent().handleLinkClick(url)
            return False
        return super().acceptNavigationRequest(url, _type, isMainFrame)


class HypertextViewer(QMainWindow):

    def __init__(self, disable_js, initial_path=None):
        super().__init__()
        self.js_enabled = not disable_js
        self.initial_path = initial_path
        self.project_root = (
            os.path.dirname(os.path.abspath(initial_path))
            if initial_path
            else os.getcwd()
        )
        self.current_directory = self.project_root
        self.history = []
        self.history_index = -1
        self.initUI()

    def initUI(self):
        self.setWindowTitle("Enhanced Hypertext Viewer")
        self.setGeometry(100, 100, 1000, 800)

        self.setupMenus()
        self.setupToolbar()

        self.webEngineView = QWebEngineView()
        self.webEnginePage = CustomWebEnginePage(self)
        self.webEngineView.setPage(self.webEnginePage)
        self.updateJavaScriptSetting()

        centralWidget = QWidget(self)
        self.setCentralWidget(centralWidget)
        layout = QVBoxLayout()
        layout.addWidget(self.webEngineView)
        centralWidget.setLayout(layout)

        if self.initial_path:
            self.loadPath(self.initial_path)

    def showOpenDialog(self):
        file_path, _ = QFileDialog.getOpenFileName(
            self,
            "Open File",
            "",
            "All Files (*);;HTML Files (*.html);;Markdown Files (*.md)",
        )
        if file_path:
            self.loadPath(file_path)

    def setupMenus(self):
        menubar = self.menuBar()
        fileMenu = menubar.addMenu("File")
        fileMenu.addAction(QAction("Open File", self, triggered=self.showOpenDialog))

        settingsMenu = menubar.addMenu("Settings")
        toggleJS = QAction("Enable JavaScript", self, checkable=True)
        toggleJS.setChecked(self.js_enabled)
        toggleJS.triggered.connect(self.toggleJavaScript)
        settingsMenu.addAction(toggleJS)

    def setupToolbar(self):
        toolbar = QToolBar()
        self.addToolBar(toolbar)

        backAction = QAction("Back", self)
        backAction.triggered.connect(self.goBack)
        toolbar.addAction(backAction)

        forwardAction = QAction("Forward", self)
        forwardAction.triggered.connect(self.goForward)
        toolbar.addAction(forwardAction)

        self.urlBar = QLineEdit()
        self.urlBar.returnPressed.connect(
            self.loadPath
        )  # Changed from self.loadUrl to self.loadPath
        toolbar.addWidget(self.urlBar)

    def loadPath(self, path=None):
        if path is None:
            path = self.urlBar.text()

        if os.path.isdir(path):
            self.loadFolder(path)
        else:
            self.loadFile(path)

    def loadFolder(self, folder_path):
        self.current_directory = folder_path
        index_files = ["index.md", "index.html", "README.md"]
        for index_file in index_files:
            full_path = os.path.join(folder_path, index_file)
            if os.path.exists(full_path):
                self.loadFile(full_path)
                return
        # If no index file is found, display folder contents
        self.displayFolderContents(folder_path)

    def displayFolderContents(self, folder_path):
        files = os.listdir(folder_path)
        html_content = f"<h1>Contents of {folder_path}</h1><ul>"
        for file in files:
            file_path = os.path.join(folder_path, file)
            html_content += f'<li><a href="{file_path}">{file}</a></li>'
        html_content += "</ul>"
        self.webEngineView.setHtml(
            html_content, baseUrl=QUrl.fromLocalFile(folder_path + "/")
        )
        self.urlBar.setText(folder_path)

    def loadFile(self, file_path):
        if not os.path.isabs(file_path):
            file_path = self.findFile(self.project_root, file_path)
            if not file_path:
                print(f"File not found: {file_path}")
                return

        file_path = os.path.abspath(file_path)
        self.current_directory = os.path.dirname(file_path)

        _, file_extension = os.path.splitext(file_path)

        if file_extension.lower() in [".html", ".htm"]:
            self.webEngineView.setUrl(QUrl.fromLocalFile(file_path))
        elif file_extension.lower() == ".md":
            with open(file_path, "r", encoding="utf-8") as f:
                md_content = f.read()
            html_content = self.convertMarkdownToHTML(md_content)
            self.webEngineView.setHtml(
                html_content, baseUrl=QUrl.fromLocalFile(self.current_directory + "/")
            )
        else:  # Treat as plain text
            with open(file_path, "r", encoding="utf-8") as f:
                text_content = f.read()
            html_content = f"<pre>{text_content}</pre>"
            self.webEngineView.setHtml(html_content)

        self.urlBar.setText(file_path)
        self.addToHistory(file_path)

    def convertMarkdownToHTML(self, md_content):
        # Convert wiki-style links before standard Markdown conversion
        md_content = self.convertWikiLinks(md_content)
        html_content = markdown.markdown(md_content)
        return html_content

    def convertWikiLinks(self, content):
        def replace_wiki_link(match):
            if "|" in match.group(1):
                alias, link = match.group(1).split("|", 1)
            else:
                alias = link = match.group(1)
            return f"[{alias}]({link})"

        # Replace [[link]] and [[alias|link]] with [alias](link)
        content = re.sub(r"\[\[(.*?)\]\]", replace_wiki_link, content)
        return content

    def handleLinkClick(self, url):
        if url.isLocalFile():
            local_path = url.toLocalFile()
            if os.path.exists(local_path):
                self.loadPath(local_path)
            else:
                # Extract just the filename from the path
                filename = os.path.basename(local_path)
                # Search for the file in the entire project directory
                found_path = self.findFile(self.project_root, filename)
                if found_path:
                    self.loadFile(found_path)
                else:
                    print(f"File not found: {filename}")
        else:
            # Handle external URLs if needed
            print(f"External URL clicked: {url.toString()}")

    def findFile(self, project_root, filename):
        for root, dirs, files in os.walk(project_root):
            if filename in files:
                return os.path.join(root, filename)
        return None

    def addToHistory(self, url):
        if self.history_index < len(self.history) - 1:
            self.history = self.history[: self.history_index + 1]
        self.history.append(url)
        self.history_index = len(self.history) - 1

    def goBack(self):
        if self.history_index > 0:
            self.history_index -= 1
            self.loadFile(self.history[self.history_index])

    def goForward(self):
        if self.history_index < len(self.history) - 1:
            self.history_index += 1
            self.loadFile(self.history[self.history_index])

    def toggleJavaScript(self, state):
        self.js_enabled = state
        self.updateJavaScriptSetting()

    def updateJavaScriptSetting(self):
        self.webEngineView.settings().setAttribute(
            QWebEngineSettings.WebAttribute.JavascriptEnabled, self.js_enabled
        )


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Enhanced Hypertext Viewer")
    parser.add_argument(
        "-d", "--disable-js", action="store_true", help="Disable JavaScript"
    )
    parser.add_argument("path", nargs="?", help="File or folder to open")

    args = parser.parse_args()

    app = QApplication(sys.argv)

    initial_path = args.path if args.path else None

    viewer = HypertextViewer(disable_js=args.disable_js, initial_path=initial_path)
    viewer.show()
    sys.exit(app.exec())
