
---

Open an ardour session using dmenu to select from available projects.

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

- `dmenu`: A dynamic menu for X11, used for selecting a session.
- `ardour`: The audio workstation application used for opening project files.
- `find`, `grep`, `sed`: Standard Unix utilities for file searching and text processing, typically included in most Linux distributions.

<a name="description" />

### Description

<a name="overview" />

#### Overview

This script automates the process of opening an Ardour session from the user's designated project directory. It scans for `.ardour` files within the specified directory (`/home/matias/audio/PROJECTS`), presents them in a list format using `dmenu`, and opens the selected project with Ardour.

The core of the script:
1. It uses the `find` command to list all `.ardour` files in the projects directory.
2. The output is filtered through `grep` and processed with `sed` to format the path.
3. The results are displayed in a `dmenu` prompt, allowing user selection.

---

<a name="usage" />

#### Usage

To use the script, simply run it from the terminal:

```bash
bash /home/matias/.scripts/ardour-open.sh
```

You can assign this script to a key binding in your window manager (qtile) or include it in your custom launcher for quick access.

<a name="examples" />

#### Examples

- Launch the script to open an Ardour project:
```bash
bash /home/matias/.scripts/ardour-open.sh
```

- If integrated with a key binding, just press the assigned key combination to launch the dmenu prompt, select your session, and open Ardour.

---

<a name="notes" />

### Notes

- Ensure your project files are stored under the specified path; otherwise, the dmenu will not display any options.
- The script currently assumes only one user (`matias`). For multi-user setups, consider modifying the script for broader accessibility.

> **Critique**: 
> - The script does not handle scenarios where no `.ardour` files are found, which could cause Ardour to attempt to open a non-existent project. Implementing a check to notify the user if no sessions are available would enhance usability.
> - Additionally, it can be optimized for use with an array of custom filters to only show sessions of interest, improving selection relevance.
