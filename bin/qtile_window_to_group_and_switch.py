#!/usr/bin/python

import sys

from libqtile.command.client import InteractiveCommandClient

c = InteractiveCommandClient()

if sys.argv[1] in ["-n", "-p"]:
    current = int(c.screen[0].items("group")[-1][0])
    if sys.argv[1] == "-n":
        target = current % 6 + 1
    if sys.argv[1] == "-p":
        target = (current - 2) % 6 + 1
    c.window.togroup(str(target), switch_group=True)
else:
    import subprocess

    subprocess.run(
        [
            "notify-send",
            "-u",
            "critical",
            "QTILE SCRIPT ERRROR",
            f"Problem running {sys.argv[0]}",
        ]
    )
