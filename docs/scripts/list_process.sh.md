# list_process.sh

**Script Description:**

This is a Bash shell script that lists all running services on a Linux system.

**Functionality:**

The script uses the `systemctl` command to retrieve a list of all services, including both started and stopped ones. The output is then piped to the `sort` command to sort the list based on the fourth column (which contains the service name).

Here's a breakdown of what each part of the script does:

1. `systemctl`: This is a system service manager that manages system services.
2. `list-units --type=service --all`: This option lists all services, including stopped ones.
	* `--type=service` specifies that we're only interested in services.
	* `--all` includes both started and stopped services.
3. `--no-pager`: This option prevents systemctl from piping its output to a pager (such as less) and instead outputs it directly to the terminal.
4. `--no-legend`: This option suppresses the display of a legend or header line at the top of the output.
5. `sort -k4`: This pipes the output to the sort command, which sorts the list based on the fourth column (the service name).

**Example Output:**

The script's output will be a sorted list of all running services on the system, with each service listed in the format:
```
<service_name>.service loaded active running
```
For example:
```
dbus.service loaded active running
NetworkManager.service loaded active running
systemd-logind.service loaded active running
...
```