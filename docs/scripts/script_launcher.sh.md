
---

Run scripts easy with fzf for fuzzy finding and previewing documentation.

---

### Table of contents

- [Dependencies](#dependencies)
- [Description](#description)
    - [Overview](#overview)
    - [Usage](#usage)
    - [Examples](#examples)
- [Notes](#notes)

---

<a name="dependencies" />

### Dependencies

- `fzf`: Fuzzy Finder for command line
- `fd`: Simple, fast, and user-friendly alternative to find
- `bat`: A cat(1) clone with syntax highlighting and Git integration
- `improved-fzfmenu.sh`: A custom script for enhanced menu usability
- A directory specified in the `$SCRIPTS` environment variable containing the scripts

<a name="description" />

### Description

<a name="overview" />

#### Overview

The `script_launcher.sh` is designed to facilitate the execution of various scripts located in a specified directory. By leveraging `fzf`, the script provides a fuzzy-find interface that allows users to search through scripts quickly. The use of `fd` enables rapid file discovery, and `bat` enhances the user experience by providing a live preview of script documentation, making it easier to understand what each script does before executing it.

The script operates as follows:
- The `fd` command searches for files and outputs the results cleanly.
- The results are piped to `xargs` to pass each script's basename to the `improved-fzfmenu.sh` for displaying in a fuzzy-find menu.
- Each selected item reveals documentation in a preview pane, which can be instantly accessed, and scripts can be executed through pressing Enter.

---

<a name="usage" />

#### Usage

1. Set the `$SCRIPTS` environment variable to point to the directory containing your scripts.
2. Run the script in your terminal:

   ```
   ./script_launcher.sh
   ```

3. Use the fuzzy finder to search for the scripts.
4. Press Enter to preview the documentation, and Enter again to execute the script.

<a name="examples" />

#### Examples

- To launch the script, use the command line:

   ```bash
   ./script_launcher.sh
   ```

- If your scripts are located in `~/my_scripts`, set your environment variable:

   ```bash
   export SCRIPTS=~/my_scripts
   ```

---

<a name="notes" />

### Notes

Ensure that your scripts have corresponding `.md` documentation files placed in `$SCRIPTS/docs/scripts/`, as this will enhance the preview functionality. 

> **Critique:** 
> - The script lacks error handling for cases where no scripts are found or if `fd` or `fzf` are not installed. 
> - Consider implementing a fallback message if no documentation is found for a selected script.
> - The comment regarding the unused xargs command is left in the code, which may confuse users; consider removing it or providing context.