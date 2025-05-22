# FTP Data Mount Script

---

**ftp-data-mount.sh**: Mounts a remote DATA folder from Mega via FTP to /mnt/ftp/DATA

---

### Dependencies

- `mega-ftp` : Command-line tool for managing Mega.nz storage via FTP interface.
- `curlftpfs` : Mounts remote FTP folders as local filesystems using FUSE.
- `rg` : Ripgrep, a fast grep alternative for searching text (used here for output parsing).
- `cut` : Basic UNIX command for splitting lines of text.
- Bash (intended for `/usr/bin/bash`, not /bin/sh).

---

### Description

This script is designed to mount a specific folder named `DATA` from your Mega.nz account (or any service accessible via `mega-ftp`) to a local directory at `/mnt/ftp/DATA`.

**Core steps:**
1. It defines `FOLDER` as `DATA` and `DEST` as `/mnt/ftp`.
2. It invokes `mega-ftp` with the folder name, presumably to initialize or refresh authorization or listing.
3. It then obtains the FTP URL corresponding to the `DATA` folder using:
   - `mega-ftp` to list FTP targets,
   - `rg` to search for the `DATA` folder line,
   - `cut -d' ' -f2` to extract the FTP URL/Path.
4. It mounts the remote folder to `/mnt/ftp/DATA` using `curlftpfs`.

The script assumes that:
- The output of `mega-ftp` contains lines with the folder name and its corresponding FTP URL, separated by spaces.
- The destination directory `/mnt/ftp` (and `/mnt/ftp/DATA`) exists and is writable.

---

### Usage

**Mount DATA folder to /mnt/ftp/DATA:**
```bash
~/.scripts/bin/ftp-data-mount.sh
```

**Typical workflow:**
- You can run this script manually in a terminal.
- For integration in qtile, assign it to a keybinding for quick mount operations.
- To unmount, use:
  ```bash
  fusermount -u /mnt/ftp/DATA
  ```

**Automate on login/startup:**
You may call this script from your `.xprofile` or as a hook in your qtile config.

---

> [!NOTE]
> - The script lacks error handling: If `mega-ftp` fails or if the folder doesn't exist, the script will either do nothing or may return confusing errors.
> - There are hardcoded paths and folder names (`DATA` and `/mnt/ftp`). Make these script parameters for reuse and flexibility.
> - It assumes output formats for both `mega-ftp` and the folder listings. Changes upstream may break parsing.
> - Ensure the `DEST` path exists before running, or add logic to create it as-needed.
> - Consider saving logs, and providing feedback to the user upon failure/success.