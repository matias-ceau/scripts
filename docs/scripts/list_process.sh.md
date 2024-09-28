# List Running Services Script

---

**list_process.sh**: This script lists all running system services in a sorted order.

---

### Dependencies

- `systemctl`: A command-line utility to examine and control the systemd system and service manager.
- `sort`: A command-line utility used to sort lines of text.

### Description

This script is intended for listing all system services on an Arch Linux system that are managed by `systemd`. It utilizes `systemctl list-units` to display the services, and it is executed with specific flags to format the output:

- `--type=service`: Filters the units to include only services.
- `--all`: Shows all loaded units regardless of their state.
- `--no-pager`: Disables paging, allowing you to see the full output at once.
- `--no-legend`: Removes the column headers for cleaner output, useful for scripting.
- The output is then piped to `sort -k4`, which sorts the lines based on the fourth field, typically the status.

This script is especially useful for managing and auditing services within a Unix-like environment, providing a quick way to check the statuses and details of currently loaded service units.

### Usage

To execute this script, open a terminal and navigate to the directory containing the script. You can run it using the following command:

```sh
sh /home/matias/.scripts/list_process.sh
```

Ensure that the script has executable permissions if you want to execute it directly:

```sh
chmod +x /home/matias/.scripts/list_process.sh
./home/matias/.scripts/list_process.sh
```

This script can be set up as a keybinding in qtile for quick access or run from terminal sessions.

---

> [!NOTE]  
> An improvement could be the inclusion of additional information or context for the user, such as displaying only active services or including headers for more clarity. Additionally, more sorting options could be beneficial for users wanting different views of their service statuses.