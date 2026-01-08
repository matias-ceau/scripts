# Mount MEGA FTP data via curlftpfs

---

**ftp-data-mount.sh**: Mounts the MEGA “DATA” FTP endpoint into `/mnt/ftp/DATA`

---

### Dependencies

- `bash`
- `mega-ftp` (your script/command): prints and/or selects MEGA FTP endpoints
- `curlftpfs`: FUSE-based FTP filesystem mount tool
- `ripgrep` (`rg`): filters `mega-ftp` output by folder name
- `coreutils` (`cut`): extracts the URL field from `mega-ftp` output
- FUSE support (`fuse2`/`fuse3` depending on your setup) and appropriate user permissions

### Description

This script mounts a specific MEGA FTP share (hardcoded as `DATA`) under `/mnt/ftp/DATA` using `curlftpfs`.

Workflow:

1. `FOLDER=DATA` defines the target entry name to locate.
2. `DEST="/mnt/ftp"` defines the base mount directory.
3. `mega-ftp "$FOLDER"` is executed first and must succeed (via `&&`). This likely ensures credentials are available, the endpoint exists, or a session is initialized.
4. It then runs `mega-ftp` again (without args), filters the line matching `DATA` with `rg`, extracts the second space-delimited field with `cut -d' ' -f2` (expected to be the FTP URL), and mounts it to `${DEST}/${FOLDER}`.

Because the URL parsing assumes a fixed output format, changes in `mega-ftp` output (extra spaces/columns) can break the mount step.

### Usage

Run interactively in a terminal, or bind to a qtile key (it does not prompt by itself):

- Mount DATA:
  - `ftp-data-mount.sh`

Typical checks:

- Ensure mountpoint exists:
  - `sudo mkdir -p /mnt/ftp/DATA`
- Verify mounted:
  - `mount | rg '/mnt/ftp/DATA'`
  - `ls /mnt/ftp/DATA`

To unmount:

- `fusermount -u /mnt/ftp/DATA`  
  or (depending on your system) `umount /mnt/ftp/DATA`

---

> [!TIP]
> Consider creating the mountpoint automatically (`mkdir -p`) and adding error handling (`set -euo pipefail`). Also avoid calling `mega-ftp` twice: capture its output once and parse it. Finally, the `cut -d' ' -f2` approach is fragile if spacing varies; prefer a structured output format from `mega-ftp` (e.g., `--json`) or a more robust parser.