# ardour-open.sh

**Script Description and Functionality**

This is a Bash shell script that uses various Unix utilities to open an Ardour session file. Here's a breakdown of the script:

1. **Shebang line**: The first line, `#! /bin/sh`, specifies the interpreter that should run this script, which is Bash (version 3 or later).
2. **Commented lines**: The next three lines are comments explaining what the script does.
3. **Session variable assignment**: The script uses a series of commands to assign the value of an Ardour session file to a variable named `session`.
	* `find /home/matias/audio/PROJECTS` searches for files recursively within the specified directory and its subdirectories.
	* `grep "\.ardour$"` filters the results to only include files with the `.ardour` extension.
	* `sed 's/\/home\/matias\/audio\/PROJECTS//'` removes the `/home/matias/audio/PROJECTS` directory path from each file name, leaving just the filename.
	* `dmenu -i -l 30` uses the dmenu utility to display a list of matching session files and prompt the user for input. The `-i` option makes the input field interactive, and the `-l 30` option sets the list length to 30 characters.
4. **Ardour command**: Finally, the script calls the Ardour application with the path to the selected session file as an argument: `ardour "/home/matias/audio/PROJECTS/$session"`.

**In summary**, this script:

* Searches for `.ardour` files within a specific directory
* Displays a list of matching files using dmenu
* Asks the user to select a session file
* Opens the selected Ardour session with the specified file path.