# Citeboard Script

---

**citeboard.sh**: A script to find and open a paper or copy its citation.

---

### Dependencies

- `findutils`: A set of utilities for file searching and processing.
- `xsel`: Command-line interface to the X selection, allowing interaction with clipboard contents.
- `dmenu`: Dynamic menu for X, useful for selection interfaces.

### Description

The `citeboard.sh` script streamlines the process of accessing academic papers and their citations. It operates by searching for BibTeX entries in a specified directory, displaying them through `dmenu` for selection. After selecting a citation, the user can choose to either copy the citation to the clipboard or open the associated paper using the Evince document viewer.

Here's a breakdown of how the script functions:

1. **Search BibTeX Files**: The script uses `grep` to scan through all BibTeX files located in the `data/bib/` directory for entries, filtering those lines that represent valid bibliographic references.
2. **User Selection via dmenu**: The script pipes the filtered references into `dmenu`, allowing the user to visually select a reference from a displayed list of options.
3. **Action Selection**: Following the selection of a citation, the user is prompted to choose whether to copy the citation to the clipboard or open the corresponding paper via another `dmenu` prompt.
4. **Final Actions**: Depending on the user's choice, the script either copies the citation to the clipboard using `xsel` or opens the associated PDF file located in the Zotero storage directory using `evince`.

### Usage

To use the script, run it directly from your terminal:

```bash
./citeboard.sh
```

From there, you will go through the following prompts:

1. **Select a Citation**: A list of citations will appear. Navigate to the desired entry and select it.
2. **Choose an Action**: You will then have the choice to either "open" the paper or "clipboard" to copy the citation.

Example interaction:

1. Launch the script:

```bash
./citeboard.sh
```

2. Choose a reference from the `dmenu`.
3. Select either "open" to view the paper or "clipboard" to copy the citation.

---

> [!TIP] 
> The script assumes specific file structures and external tools being installed. It might fail if the `data/bib/` directory is empty or if files are not organized correctly. Consider adding error handling to provide feedback when no significant matches or files are found. Additionally, support for other document viewers could expand its usability.