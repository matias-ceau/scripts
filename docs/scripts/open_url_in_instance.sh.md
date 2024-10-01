# Open URL in Qutebrowser Instance

---

**open_url_in_instance.sh**: Launches a specified URL in an existing Qutebrowser instance.

---

### Dependencies

- `qutebrowser`: A keyboard-focused browser with a minimal GUI that is launched via command line.
- `socat`: A command line based utility that establishes two bidirectional byte streams and transfers data between them. It is used here for IPC communication.

### Description

The `open_url_in_instance.sh` script is designed to open a specified URL in a running instance of Qutebrowser using a form of inter-process communication (IPC). This can improve your workflow by allowing quick access to web pages without needing to start a new browser window. 

The initial idea for this script was conceived by Florian Bruhin, and the current iteration is authored by Thore Bödecker. It utilizes pipes and sockets to send commands directly to a Qutebrowser instance that is already running, thus maintaining session state and open tabs.

Essential metadata is constituted in JSON format, which includes:
- `args`: an array containing the URL to open.
- `target_arg`: set to null for compatibility.
- `version`: the version of Qutebrowser being targeted.
- `protocol_version`: a numeric value indicating the supported version of the protocol defined between processes.
- `cwd`: the current working directory when this command is executed.

### Usage

To use this script, you can run it from the terminal followed by the desired URL as an argument. If Qutebrowser is running, the specified URL will be opened in that instance. If Qutebrowser is not running, it will launch a new instance with the provided URL.

Example command:

```bash
/home/matias/.scripts/open_url_in_instance.sh "https://www.example.com"
```

For other use cases, you could bind this script to a key combination in your window manager (e.g., Qtile) or automate it in your workflow to open frequently used links.

---

> [!TIP] 
> Currently, the script does not handle errors such as failing to connect to the Qutebrowser IPC socket or invalid URL inputs. Adding error checking would improve its robustness. Additionally, you might consider supporting multiple tabs or browsing contexts by expanding the `args` array.