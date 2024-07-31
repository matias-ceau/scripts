# CiteBoard: Quick Access to Paper Citations

---

**[citeboard.sh](citeboard.sh)**: A script to find and handle paper citations easily.

---

### Dependencies

- `findutils`: A set of utilities for searching files and directories in the filesystem.
- `xsel`: A command-line tool to manipulate the X selection, useful for clipboard operations.
- `dmenu`: A dynamic menu for X, used to create interactive interfaces for user selection.

### Description

The `citeboard.sh` script is designed to streamline the process of finding and managing paper citations within your workflow. It allows users to search through BibTeX files to locate paper references, presenting them in an interactive selection menu powered by `dmenu`. 

The script does the following:

1. **Searches for Citations**: It uses `grep` to collect citations from all BibTeX files in the `data/bib/` directory and cleans up the formatting to present a list of references.
2. **User Selection with dmenu**: After retrieving the citations, it presents them in a vertical list for easy access.
3. **Choice of Action**: Users can then choose to either copy the citation to the clipboard or open the paper directly using `evince` (a PDF viewer) by searching for the citation in the Zotero storage directory.

### Usage

To run the script, simply execute it from your terminal. Make sure it's executable (`chmod +x /home/matias/.scripts/citeboard.sh`) and you can run it with:

```bash
/home/matias/.scripts/citeboard.sh
```

#### Workflow Example:

1. Run the script with the above command.
2. Use the `dmenu` interface to select a paper from the list.
3. Choose either the **open** option to view the paper or the **clipboard** option to copy the citation.

*Note*: Ensure that the `data/bib/` folder contains your BibTeX files and that your Zotero storage path is correctly set to where your PDFs are located.

---

> [!TIP]  
> The script could benefit from error handling when invoking `xargs` to open files or copying to clipboard when no file is found. Additionally, consider using a more robust method for handling the case when no citation is selected to improve user experience. Adding comments within the code itself would also enhance maintainability.
