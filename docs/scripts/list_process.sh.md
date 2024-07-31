# List Running Services (list_process.sh)

---

List and sort running services on a Linux system using systemctl.

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

- `systemctl`: comes pre-installed with systemd, required to manage services.
- A shell environment capable of executing shell scripts.

<a name="description" />

### Description

<a name="overview" />

#### Overview

The `list_process.sh` script provides a simple way to list all running services on a system that uses `systemd`. It does this by utilizing the `systemctl list-units` command, which displays the status of units (in this case, services). The output is then sorted by the fourth column, which typically contains the name of the service and is formatted for easier reading. The script excludes pagination and unnecessary legends to allow for a concise output.

The command breakdown:
- `systemctl list-units --type=service --all --no-pager --no-legend`: This command lists all service units regardless of their state. The `--no-pager` option prevents the output from being sent through a pager (like `less`), and `--no-legend` removes the headers from the output.
- `sort -k4`: This sorts the output based on the fourth column.

---

<a name="usage" />

#### Usage

To use this script, simply invoke it from the terminal as follows:
```bash
./list_process.sh
```
Make sure that the script has executable permissions. You can set this using the command:
```bash
chmod +x /home/matias/.scripts/list_process.sh
```
You can also assign this script to a keybinding in qtile for quick access.

<a name="examples" />

#### Examples

1. To list the running services, run:
   ```bash
   ./home/matias/.scripts/list_process.sh
   ```
   This will provide a quick overview of all running services sorted for ease of review.

---

<a name="notes" />

### Notes

Ensure that your user has permissions to run `systemctl` commands. If you encounter issues, you may need to execute the script with `sudo`.

> **Critique:**  
> - The script could benefit from some error handling. For instance, if `systemctl` is not available, the user should receive a clear error message rather than failing silently. 
> - Additional filtering options could be introduced to allow users to focus on specific types of services, increasing the script's utility.