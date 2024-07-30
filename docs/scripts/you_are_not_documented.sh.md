
---

A script that finds scripts without inline documentation.

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

- [ripgrep](https://github.com/BurntSushi/ripgrep): A command-line search tool that recursively searches your current directory for a regex pattern.
- Bash: Basic shell to execute the script.

<a name="description" />

### Description

<a name="overview" />

#### Overview

The `you_are_not_documented.sh` script is designed to identify files in a specified directory that do not contain inline documentation comments. It uses the powerful `ripgrep` tool to filter through script files based on the presence of a specific comment tag, `#INFO:#`. 

The script searches within the `$SCRIPTS` directory, which should be defined in your environment or script configuration. By employing two successive `rg` commands, the script first identifies files that do not contain the `#INFO:#` comment, and then excludes files located in directories such as `/docs/`, `/config/`, as well as files with extensions like `.csv` or `.md`, which are unlikely to require inline documentation.

---

<a name="usage" />

#### Usage

To use the script, simply execute it in your terminal:

```bash
bash /home/matias/.scripts/you_are_not_documented.sh
```

Make sure the `$SCRIPTS` environment variable is set to the directory you wish to scan for undocumented scripts before running the script.

<a name="examples" />

#### Examples

1. Run the script in a terminal:

    ```bash
    bash /home/matias/.scripts/you_are_not_documented.sh
    ```

2. Example output might include paths to scripts such as:

    ```
    /home/matias/.scripts/my_script.sh
    /home/matias/.scripts/another_script.sh
    ```

---

<a name="notes" />

### Notes

- Ensure that `ripgrep` is installed on your Arch Linux system to utilize this script effectively.
- Consider setting the `$SCRIPTS` variable in your shell profile for convenience.

> **Critique:**  
This script is efficient for locating undocumented scripts but may not account for other potential documentation practices (like using `#` comments). Further enhancements could include options for customization, such as allowing the user to specify comment tags or the exclusion list via command-line arguments. Additionally, adding some user feedback (like a message indicating the number of scripts found) would increase usability.