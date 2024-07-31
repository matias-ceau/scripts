# Open Ardour Session Script

---

**[ardour-open.sh](/ardour-open.sh)**: A script to open Ardour sessions quickly using dmenu.

---

### Dependencies

- `dmenu`: A dynamic menu for X11, used for selecting the Ardour session.
- `ardour`: The digital audio workstation software that opens the selected session.

### Description

This script streamlines the workflow for audio projects by providing a simple way to open Ardour sessions. It searches through the specified project directory (`/home/matias/audio/PROJECTS`), finds sessions with the `.ardour` file extension, and then displays them in a list using `dmenu`.

The main components of the script are:

1. **Finding Ardour Sessions**: It uses `find` to locate all files with the `.ardour` extension within the project directory. The results are then processed by `grep` to filter for only the Ardour files, and `sed` is used to format the output by removing the base directory path.

2. **User Interaction via `dmenu`**: After collecting the session options, the script displays them in a `dmenu` prompt, allowing the user to select which session to open.

3. **Launching Ardour**: Once a session is selected from `dmenu`, the script constructs the full path and launches Ardour with the chosen session.

### Usage

To execute the script, ensure it is marked as executable:

```bash
chmod +x /home/matias/.scripts/ardour-open.sh
```

Then, run the script from the terminal:

```bash
/home/matias/.scripts/ardour-open.sh
```

Once executed, a `dmenu` list will appear with available Ardour sessions. You can navigate through the list and select the desired session to open it in Ardour.

For convenience, you could assign this script to a keybinding in your window manager (Qtile) to make opening sessions even faster.

---

> [!TIP]  
> This script could be enhanced by adding error handling to inform the user if no `.ardour` files are found or if Ardour fails to launch. Additionally, consider adding an option for users to quickly create a new session if they prefer starting from scratch.
