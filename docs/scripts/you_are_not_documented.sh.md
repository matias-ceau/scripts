# You Are Not Documented (you_are_not_documented.sh)

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

- **Ripgrep (rg)**: A fast command-line search tool used for searching text within files.
- **Bash**: The script is written in Bash and requires a Bash environment to execute.

<a name="description" />

### Description

<a name="overview" />

#### Overview

The `you_are_not_documented.sh` script is a utility for developers to identify scripts within a specified directory that lack inline documentation. Specifically, it searches through the files in the `$SCRIPTS` directory for any that do not contain the `#INFO:#` comment tag, which indicates that the file lacks documentation. This can be particularly useful for maintaining code quality and ensuring that scripts are adequately documented.

The script utilizes `ripgrep`, a highly efficient text search tool, to quickly find files that match or don’t match a certain pattern. The search is further refined to exclude certain directories (like `/docs/` and `/config/`) and file types (`.csv` and `.md`).

---

<a name="usage" />

#### Usage

To use this script, you need to have the `SCRIPTS` environment variable defined, pointing to the directory where your scripts are located. Once the environment variable is set, run the script directly from the terminal:

```bash
bash /home/matias/.scripts/you_are_not_documented.sh
```

Alternatively, you can create a keybinding in your window manager (qtile) to trigger this script for quick access.

<a name="examples" />

#### Examples

Assuming `$SCRIPTS` is set to `/home/matias/.scripts`, running the command will display the paths of all scripts without the `#INFO:#` comment:

```bash
bash /home/matias/.scripts/you_are_not_documented.sh
```

---

<a name="notes" />

### Notes

- Ensure that the `SCRIPTS` variable is correctly set to avoid unexpected results.
- The effectiveness of this script depends on consistent use of the `#INFO:#` documentation tag in other scripts.

> **Critique**: 
> 
> While the script is a useful tool for identifying undocumented scripts, it lacks error handling for scenarios where the `$SCRIPTS` variable is not set. Adding checks to ensure valid input and providing user-friendly error messages could enhance its robustness. Additionally, it might be beneficial to allow the user to customize the search term (currently hard-coded as `#INFO:#`) through an optional command-line argument for increased flexibility.