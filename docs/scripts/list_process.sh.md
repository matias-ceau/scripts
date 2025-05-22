# list_process.sh

---

**list_process.sh**: Lists all systemd services, showing their statuses sorted by type

---

### Dependencies

- `systemctl` – The system and service manager used by systemd; core in Arch Linux.
- `sort` – Standard Unix sort utility; sorts output alphabetically by specified column.

---

### Description

This script rapidly lists all available systemd services (units of type `service`), including both active and inactive ones. The output is formatted with:

- No pager, so results display entirely in one go (helpful for scripting or redirecting output).
- No legend or heading, giving you a raw, parsable list.
- The results are piped into `sort -k4`, which sorts the lines based on the fourth whitespace-delimited field (status, typically: enabled, disabled, static, etc.).

This is useful if you want to quickly review the current state of service units without needing to interactively scroll, especially when working in minimal terminal environments inside your Arch + qtile setup.

---

### Usage

You can run this script from any terminal. It does not require arguments.

#### Example:

```sh
~/.scripts/bin/list_process.sh
```

You can also bind this to a key combination in your qtile configuration for quick access, or pipe the results for further processing:

```sh
~/.scripts/bin/list_process.sh | grep running
```

If you want to inspect only enabled services:

```sh
~/.scripts/bin/list_process.sh | grep enabled
```

To save the list to a file:

```sh
~/.scripts/bin/list_process.sh > ~/service_list.txt
```

---

> [!NOTE]
> While the script is functional and minimalist, there are a few points for possible improvement:
> - Sorting by the **fourth column** (`-k4`) might not reflect the most important attribute for all users. Sometimes sorting by unit name (`-k1`) or state (`-k3`) may be more insightful.
> - The script could accept a custom sort key as an argument for flexibility.
> - Consider renaming the file to avoid confusion: the current name (`list_process.sh`) suggests listing running processes, while it strictly lists **systemd services**.
> - A brief help section or usage hint for command-line arguments could be useful if expanded.
> - No color or highlighting is used. If visual clarity is needed, tools like `column` or `grep --color=auto` could be added.