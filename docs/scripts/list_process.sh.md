
---

Lists running services on the system.

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

- `systemctl`: This script requires systemd, which is usually available on modern Arch Linux installations.

<a name="description" />

### Description

<a name="overview" />

#### Overview

This shell script provides a straightforward way to list all running services on an Arch Linux system using `systemctl`. The command utilized is `systemctl list-units` with specific flags for better readability:

- `--type=service`: Limits the output to service units.
- `--all`: Displays all units, including inactive ones.
- `--no-pager`: Outputs the results directly to the terminal without using a pager.
- `--no-legend`: Suppresses the header information, making the output easier to read.

The output is then sorted based on the fourth column, which typically contains the state of the service.

---

<a name="usage" />

#### Usage

To execute the script, simply run it from a terminal:

```bash
bash /home/matias/.scripts/list_process.sh
```

Alternatively, you can make the script executable and run it directly:

```bash
chmod +x /home/matias/.scripts/list_process.sh
/home/matias/.scripts/list_process.sh
```

This script can also be bound to a key combination in your window manager (qtile) to quickly access the list of running services.

<a name="examples" />

#### Examples

```bash
# Run the script
/home/matias/.scripts/list_process.sh
```

Output (formatted for clarity):

```
 ● sshd.service         loaded active running   OpenSSH Daemon
 ● NetworkManager.service loaded active running   Network Manager
 ● apache2.service      loaded active running   Apache Web Server
```

---

<a name="notes" />

### Notes

- This script will display all services, whether they're running or not, but the sort will primarily change the active services appearance.

> **Critique:** The script is straightforward and functional; however, consider implementing options to filter services based on their state (active, inactive, failed) for more tailored outputs. Additionally, adding comments for each command might enhance readability for users unfamiliar with `systemctl`.