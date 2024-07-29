# pdfopener.sh

**Script Description:**

This is a shell script written in Bash, a Unix shell scripting language. The script is designed to run on Linux systems and uses the `dmenu` utility for interactive selection.

**Functionality:**

The script performs the following tasks:

1. **Find PDF files**: It searches for all PDF files (`*.pdf`) in the home directory (`~`) using the `find` command.
2. **Filter results**: The `grep` command filters the output to only show files with a `.pdf` extension (i.e., `$file`).
3. **Interactive selection**: The filtered list is then passed to the `dmenu` utility, which displays a menu of available PDF files and allows the user to select one.
4. **Open selected PDF file**: Once a PDF file is selected, its path is stored in the `$file` variable.
5. **Launch Evince**: Finally, the script opens the selected PDF file using the `evince` command-line viewer.

**In summary**, this script automates opening a PDF file with Evince by selecting it from a list of available files in the home directory using an interactive menu.

To use this script:

1. Save it to a file (e.g., `open-pdf.sh`) on your Linux system.
2. Make the script executable: `chmod +x open-pdf.sh`
3. Run the script: `./open-pdf.sh`

Choose a PDF file from the interactive menu, and Evince will open it.