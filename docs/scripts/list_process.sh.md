# list_process.sh

# List Running Services Script

This script lists all the running services on a system using `systemctl` and sorts them by their status.

## Usage

Execute the script in a Unix-like terminal to see a sorted list of all the systemd services, including their status.

### Example

```sh
./list_running_services.sh
```

## Description

This script leverages `systemctl` to list all service units on the system. It then sorts these services by their status (running, exited, etc.) to provide an organized view. The output of the command does not include any pager or extra formatting legend, making it suitable for piping into other commands or scripts.

## Script Details

```sh
#! /bin/sh

#DOC#@CLI@=2024-07= "list running services"

systemctl list-units --type=service --all --no-pager --no-legend | sort -k4
```

1. **Shebang**: `#!/bin/sh`
   - Indicates the script should be run in the POSIX shell.

2. **Documentation Tag**: `#DOC#@CLI@=2024-07= "list running services"`
   - This tag is a placeholder for documentation purposes, perhaps denoting the script's CLI usage or versioning information.

3. **Command**: `systemctl list-units --type=service --all --no-pager --no-legend | sort -k4`
   - `systemctl list-units`: Lists the systemd units currently loaded on the system.
   - `--type=service`: Filters the list to only include service units.
   - `--all`: List all units, even the inactive ones.
   - `--no-pager`: Disables paging, i.e., does not pipe output into a pager.
   - `--no-legend`: Removes the legend (the column headers and footer).
   - `| sort -k4`: Pipes the output into the `sort` command to sort by the fourth field, which is the status of each service.

## Prerequisites

This script requires:
- A Unix-like operating system with `systemd` installed.
- User privileges that allow the execution of `systemctl` commands.

## Output

The script outputs a sorted list of services showing their current status (e.g., running, exited, etc.)

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Contributions

Contributions are welcome! Please open an issue or submit a pull request.

## Author

[Your Name]

## Additional Notes

Feel free to modify this script to suit your needs. For more details on `systemctl`, see the [systemd documentation](https://www.freedesktop.org/wiki/Software/systemd/).

