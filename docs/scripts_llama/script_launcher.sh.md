# script_launcher.sh

Here is the GitHub documentation (in Markdown format) for the provided script:
```markdown
# Run scripts with fzf
========================

## Table of Contents

* [Overview](#overview)
* [Functionality](#functionality)
* [Example Use Cases](#example-use-cases)

## Overview
------------

This shell script uses `fzf` (a command-line fuzzy finder) to run scripts from a specified directory. The script utilizes `fd` (a blazing-fast file finder) to search for files in the `$SCRIPTS` directory, and then passes them to `xargs` for execution.

## Functionality
------------

1. **Search for Scripts**: The script uses `fd` to find all files in the specified directory (`"$SCRIPTS"`).
2. **Filter by Name**: The found files are filtered using `basename` to extract only the file names (without paths).
3. **Preview with fzf**: The filtered list is passed to `improved-fzfmenu.sh`, which provides a fuzzy finder interface for selecting a script.
4. **Run Selected Script**: Once a script is selected, it is executed using `bash -c`.

## Example Use Cases
-------------------

1. Run all available scripts: Simply run the script without any arguments to see a list of all available scripts.
2. Run a specific script: Run the script with an argument specifying the name of the script you want to execute.

### Running the Script

To use this script, save it as `run_scripts_with_fzf.sh` and then:
```bash
chmod +x run_scripts_with_fzf.sh
./run_scripts_with_fzf.sh
```
Note: Make sure to replace `"${SCRIPTS}"` with your actual scripts directory path.