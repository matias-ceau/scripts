#!/usr/bin/env python

import sys

from rich import box
from rich.console import Console
from rich.markdown import Markdown
from rich.panel import Panel


def main(md_style="github-dark", panel_width=None):
    if len(sys.argv) != 2:
        if sys.argv[2].isnumeric():
            panel_width = int(sys.argv[2])
        else:
            print("Usage: python script.py <markdown_file>")
            sys.exit(1)

    console = Console()

    try:
        with open(sys.argv[1], "r") as file:
            markdown_content = file.read()
    except FileNotFoundError:
        console.print(f"[red]Error: File '{sys.argv[1]}' not found.[/red]")
        sys.exit(1)
    except IOError:
        console.print(f"[red]Error: Unable to read file '{sys.argv[1]}'.[/red]")
        sys.exit(1)

    markdown = Markdown(markdown_content, style=md_style)
    panel = Panel(
        markdown, expand=False, border_style="blue", box=box.ROUNDED, width=panel_width
    )
    console.print(panel)


if __name__ == "__main__":
    main()
