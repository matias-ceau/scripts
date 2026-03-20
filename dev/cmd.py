import subprocess
from rich import print

cmds = [
    "echo $DBUS_SESSION_BUS_ADDRESS",
    "busctl --user list",
    "journalctl --user -u xdg-desktop-portal.service",
    "nyxt --version",
]

for c in cmds:
    print(f"[bold green]$ {c}[/bold green]")
    try:
        result = subprocess.run(
            c, shell=True, check=True, text=True, capture_output=True
        )
        print(result.stdout)
    except subprocess.CalledProcessError as e:
        print(f"[bold red]Error:[/bold red] {e.stderr}")
