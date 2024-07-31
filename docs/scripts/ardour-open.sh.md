# Open Ardour Session (ardour-open.sh)

---

A script to open an Ardour session selected from a list.

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

- `dmenu`: Required for the graphical selection of Ardour projects.
- `ardour`: The main digital audio workstation being invoked.

<a name="description" />

### Description

<a name="overview" />

#### Overview

The `ardour-open.sh` script is a simple shell script designed for users of Ardour, a popular digital audio workstation. This script helps streamline the workflow by allowing users to quickly browse through their existing Ardour projects and open a selected session. It utilizes the `find` command to search for `.ardour` files within the specified project directory, and employs `dmenu` for a user-friendly selection interface. Once a session is chosen, Ardour is launched with the selected project.

The script does the following:

1. **Finds Projects**: It searches the directory `/home/matias/audio/PROJECTS` for files with the `.ardour` extension.
2. **Filters Results**: Uses `grep` and `sed` to format the output, stripping away the full path and preparing it for display.
3. **User Interface**: Invokes `dmenu` to present the user with a list of available sessions in a scrollable format.
4. **Session Launch**: Opens the selected session with the Ardour application.

---

<a name="usage" />

#### Usage

To execute the script, you can run the following command in your terminal:
```bash
bash /home/matias/.scripts/ardour-open.sh
```

Alternatively, you could bind this script to a key combination in your Window Manager (qtile) for quick access. 

<a name="examples" />

#### Examples

- Run the script directly from the terminal:
  ```bash
  bash /home/matias/.scripts/ardour-open.sh
  ```
  
- Assign to a keybinding in `qtile` for easy access.

---

<a name="notes" />

### Notes

- Make sure that the directory `/home/matias/audio/PROJECTS` is correctly populated with Ardour project files before running the script.
- Consider modifying the script to handle cases when no projects are found, to enhance user experience.

> **Critique**: 
> 
> The script relies on the user having Ardour installed and the audio project directory correctly set up. It might benefit from added error handling: for example, what happens if the `find` command returns no matching sessions? A message to inform the user would improve usability. Furthermore, adding options for specifying different directories or multiple sessions could enhance the script's functionality.