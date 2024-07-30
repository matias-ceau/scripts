# fzfmenu_run.sh

# Dmenu Run Replacement Script

This repository contains a script that acts as a replacement for `dmenu_run`, utilizing `fzf` for selecting commands and launching them in a floating st terminal.

## Script Overview

The provided Bash script performs the following function:

- It uses the `dmenu_path` utility to list executable commands available in the user's `$PATH`.
- This list is then passed to `fzfmenu.sh` for interactive selection using `fzf`.
- After a command is selected, it is executed using `xargs` and `bash -c "{}"`, running the selected command in a new process.

## Usage

To run the script, use the following command in your terminal:

```bash
./<script_name>.sh
```

Replace `<script_name>` with the actual filename of the script.

### Prerequisites

- **dmenu_path**: This utility lists all executable commands in the user's PATH.
- **fzf**: This is a command-line fuzzy finder used to interactively select an item from the list of commands.
- **xargs**: This utility constructs argument lists and executes utility commands.
- **bash**: The script uses Bash to execute the selected command.
- **st**: The script expects `st` (suckless terminal) to be installed for floating terminal functionality.

### Example Usage

```bash
./dmenu_run_replacement.sh
```

When you run the script, it will open a fuzzy search menu using `fzf`. As you type, `fzf` will filter the list of commands. Press `Enter` to select a command and execute it.

### Execution Flow

1. **Command Listing**: `dmenu_path` generates a list of all executable commands in the user's path.
2. **Fuzzy Finder**: The list is piped into `fzfmenu.sh` which uses `fzf` for selecting a command.
3. **Command Execution**: The selected command is executed using `xargs -I {} bash -c "{}"` to run the command.

## Installation

1. Clone the repository:
    ```bash
    git clone https://github.com/yourusername/dmenu-run-replacement.git
    ```
2. Navigate to the script directory:
    ```bash
    cd dmenu-run-replacement
    ```
3. Make the script executable:
    ```bash
    chmod +x <script_name>.sh
    ```

4. Run the script:
    ```bash
    ./<script_name>.sh
    ```

## Additional Information

- The script is designed to run with the `st` terminal emulator in mind. If `st` is not installed, you might need to adjust the script to work with your preferred terminal emulator.
- Ensure all dependencies (`dmenu_path`, `fzf`, `xargs`, and `bash`) are installed and correctly configured in your environment.

