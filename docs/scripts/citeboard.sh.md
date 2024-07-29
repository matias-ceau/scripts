# citeboard.sh

**Script Description and Functionality**

This is a shell script written in Bash, designed to interactively search for papers in a bibliography database, open them with the Evince document viewer, or copy their citation to the clipboard.

**Key Features:**

1. **Paper Search**: The script uses `grep` to search through the `data/bib/*` directory for papers matching the format `@*{*}*`. It then pipes the results to `dmenu`, a graphical menu system, to display the matches.
2. **User Selection**: The user selects either "open" or "clipboard" from the `dmenu` list.
3. **Open Paper**: If "open" is selected, the script uses `find` to search for the paper in the `data/zotero/storage` directory and then pipes the result to `evince`, opening the document viewer.
4. **Copy Citation**: If "clipboard" is selected, the script uses `xsel` to copy the selected paper's citation to the clipboard.

**Prerequisites:**

* `findutils`
* `xsel` (to copy text to clipboard)
* `dmenu` (graphical menu system)
* `evince` (document viewer)

Overall, this script provides a convenient way to search for papers in a bibliography database and either open them or copy their citation to the clipboard.