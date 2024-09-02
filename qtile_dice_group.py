#!/usr/bin/python

from libqtile.command.client import InteractiveCommandClient


def main() -> None:
    c = InteractiveCommandClient()
    current_group = int(c.group.info()["name"])
    complementary = 7 - current_group
    c.group[str(complementary)].toscreen()


if __name__ == "__main__":
    main()
