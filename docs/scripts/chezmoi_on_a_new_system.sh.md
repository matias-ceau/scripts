
---

Initial setup script for chezmoi on a new system.

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

- Bash
- curl
- chezmoi

<a name="description" />

### Description

<a name="overview" />

#### Overview

This script automates the initialization and application of the chezmoi configuration management tool on a new Arch Linux system. It leverages `curl` to fetch the installation script for chezmoi and directly execute it. The command used is `curl -fsLS get.chezmoi.io`, which retrieves the latest chezmoi installation script. The `-- init --apply matias-ceau` options set up the configuration for a user named "matias-ceau". 

Using chezmoi, users can manage their dotfiles and configuration files effortlessly across different machines, which is particularly helpful for maintaining consistency on new setups. 

---

<a name="usage" />

#### Usage

To use this script, simply run it from the terminal:

```bash
bash /home/matias/.scripts/sys/setup/chezmoi_on_a_new_system.sh
```

Make sure you have the necessary permissions, and that you have installed `curl` on your system. The script does not require any additional command-line arguments.

<a name="examples" />

#### Examples

- To initialize chezmoi on a new Arch Linux system:

```bash
bash /home/matias/.scripts/sys/setup/chezmoi_on_a_new_system.sh
```

---

<a name="notes" />

### Notes

Ensure that your system has `curl` and that you have an internet connection as the script fetches the installation script from the web. Review your chezmoi configuration before running the script to confirm it meets your needs.

> **Critique:** 
> The script executes a command fetched via `curl` without any checksum verification or validation of the downloaded content. This approach may expose the system to security vulnerabilities, as it could execute malicious code if the endpoint is compromised. Consider verifying the integrity of the script or prompting users to review it before executing. Additionally, the script currently lacks error handling; implementing checks for successful command execution will enhance its robustness.