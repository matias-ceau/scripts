# You Are Not Documented

---

**you_are_not_documented.sh**: A script that finds scripts without inline docs.

---

### Dependencies

- `rg`: A fast search tool (ripgrep) used for searching through files.
  
### Description

The `you_are_not_documented.sh` script is designed to help developers identify scripts in their projects that lack inline documentation. By utilizing `rg` (ripgrep), it searches for files that do not contain a specific comment pattern indicating documentation (`#INFO:#`). This effectively highlights scripts that may need additional explanation or comments regarding their functionality.

The script does not only look for all scripts—it specifically excludes files located within directories associated with documentation (`/docs/`), configuration (`/config/`), as well as files with the extensions `.csv` or `.md`. This makes the search more targeted and keeps the focus on executable scripts that might require attention.

### Usage

To run the script, simply execute it in a terminal session. Make sure that the environment variable `SCRIPTS` is set to the directory containing the scripts you want to check.

```bash
export SCRIPTS=/path/to/your/scripts
/home/matias/.scripts/you_are_not_documented.sh
```

This command will list all scripts in the specified directory that do not contain the inline documentation marker.

You can integrate this script into your workflow by running it periodically or assigning it to a keybinding in your window manager (qtile). 

---

> [!TIP] 
> Consider adding an option to print additional information about each found script (like its path) or prompting users to add documentation directly. Additionally, implementing a configuration option for customizing the search directory could enhance flexibility for varied project structures.