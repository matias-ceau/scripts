# FTP Data Mount Script

---

**ftp-data-mount.sh**: Mounts a specific folder from Mega's FTP service to a local destination.

---

### Dependencies

- `mega-ftp`: A command from the Mega.nz CLI tools used to initiate an FTP server for Mega folders.
- `curlftpfs`: A utility to mount FTP folders as local file systems.
- `rg`: Short for `ripgrep`, a fast searching tool used to parse and filter output.
- `bash`: The shell interpreter to execute this script. 

Ensure these dependencies are installed on your Arch Linux system before running the script:

```bash
sudo pacman -S ripgrep
yay -S megacmd curlftpfs
```

### Description

This script automates the process of mounting a specific folder from a Mega.nz FTP interface to a local directory on your system. It begins by starting the Mega FTP server tied to the defined folder (`DATA` by default). The script captures the FTP connection string (host and port) using `mega-ftp`, filters the output with `ripgrep` to extract the correct connection URL for the folder, and finally mounts the FTP connection to a local folder (`/mnt/ftp/DATA`) using `curlftpfs`.

The script heavily relies on text manipulation tools and assumes that `mega-ftp` outputs the server connection details in a clear and standard format. Make sure `/mnt/ftp` exists and is writable on your system.

### Usage

You can execute the script directly in your terminal as follows:

```bash
./ftp-data-mount.sh
```

Before running, ensure the script is executable:

```bash
chmod +x /home/matias/.scripts/bin/ftp-data-mount.sh
```

You may also assign this script to a keybinding in qtile for quick access or automate it at startup. 

Below is an example of expected behavior:

```bash
$ ./ftp-data-mount.sh
Starting FTP server on 127.0.0.1:4443...
Mounting FTP data to /mnt/ftp/DATA...
```

---

> [!TIP]
> This script could benefit from error handling enhancements. For example:
> - Check if `mega-ftp` or `curlftpfs` fails and provide meaningful error messages.
> - Ensure `DEST` and `FOLDER` are validated before attempting to mount.
> - Add a pre-check to verify if `/mnt/ftp/DATA` already exists to avoid redundancy.
> For better usability, you might consider making `FOLDER` a command-line argument instead of hardcoding it, which allows dynamic folder selection during execution.
