# Setting Up Syncs

---

**setting-up-syncs.sh**: Script to sync user directories to a backup location using Mega.nz

---

### Dependencies

- `mega-sync`: This is the command-line utility for synchronizing files and directories with Mega.nz cloud storage. Ensure you have it installed and properly configured to use it.

### Description

The `setting-up-syncs.sh` script is designed to facilitate the backup of important user directories to a designated location on Mega.nz. The script retrieves the hostname of the machine using the `hostnamectl` command and constructs backup paths accordingly. It synchronizes the following directories located in the user's home directory:

- Desktop
- Downloads
- Templates
- Share
- Documents
- Music
- Pictures
- Videos

Each directory's contents are mirrored to a corresponding directory within the `/BACKUPS/<hostname>/` folder on Mega.nz.

The use of variables and shell commands ensures that the script is dynamically tailored to the system it runs on, eliminating the need for hard-coded values and allowing for seamless integration into Arch Linux setups, especially when utilizing the Qtile window manager.

### Usage

To use the script, simply execute it in the terminal as follows:

```bash
bash /home/matias/.scripts/setting-up-syncs.sh
```

Ensure that the Mega.nz synchronization tool is installed and configured with your account credentials beforehand. After running the script, your files will be backed up to Mega.nz in the specified directories. 

To automate the process, you can schedule this script to run at regular intervals using `cron`. For example, to run the script every day at 2 AM, you can add the following line to your crontab:

```bash
0 2 * * * /bin/bash /home/matias/.scripts/setting-up-syncs.sh
```

---

> [!TIP] 
> The script assumes the Mega.nz account is set up correctly. Consider adding checks to ensure the connection to Mega.nz is active before running the sync commands. Additionally, incorporating logging functionalities would help track the success or failure of each sync operation for better debugging and user experience.