# script_launcher.sh

# Run Scripts with Fzf

This script allows you to search and execute scripts using `fzf`. The script leverages `fd` to find all scripts in a specified directory, uses `basename` to list the script names, and `improved-fzfmenu.sh` to create a user-friendly interactive menu. When a script is selected, it is executed immediately.

## Prerequisites

Make sure you have the following tools installed and available in your `PATH`:
- `fd`: A simple, fast and user-friendly alternative to `find`.
- `fzf`: A general-purpose command-line fuzzy finder.
- `improved-fzfmenu.sh`: A custom script for improving the `fzf` menu.
- `bat`: A `cat` clone with wings that supports syntax highlighting and Git integration.

## Installation

1. Ensure that the dependencies mentioned above are installed.
2. Save this script to a file, for example, `run-script.sh`.
3. Make the script executable:
    ```bash
    chmod +x run-script.sh
    ```

## Usage

Execute the script from the command line:
```bash
./run-script.sh
```

This command will:
1. Use `fd` to find all scripts within the directory specified by the `$SCRIPTS` environment variable.
2. List the script names without their full paths using `basename`.
3. Pass the list to `improved-fzfmenu.sh` which allows you to select a script from an interactive `fzf` menu.
4. Show a preview of the selected script's documentation using `bat` in the `fzf` preview window.
5. Execute the selected script.

## Environment Variables

- **SCRIPTS**: This environment variable should be set to the path of the directory containing your scripts. The script will search for scripts within this directory.

## Example

Suppose you have the following directory structure:
```
/home/user/scripts/
├── script_one.sh
├── script_two.sh
└── docs/
    ├── scripts/
        ├── script_one.sh.md
        └── script_two.sh.md
```

Set the `$SCRIPTS` environment variable:
```bash
export SCRIPTS=/home/user/scripts
```

Run the script:
```bash
./run-script.sh
```

You will see an `fzf` menu with `script_one.sh` and `script_two.sh`. By selecting one of them, you will see a preview of the corresponding documentation file and the selected script will be executed.

## Notes

- The preview feature uses `bat` to display the script’s documentation markdown file located in the `$SCRIPTS/docs/scripts/` directory.
- Ensure that each script has a corresponding `.md` file within the `docs/scripts/` directory for the preview feature to work correctly.


