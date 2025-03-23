#!/usr/bin/env -L uv python

# INFO:#@RUN@~KJL~ "Transform a midi controller to a keyboard/script launcher"

import shlex
import sys
from subprocess import PIPE, run
from typing import Dict, List, Optional

import click


def get_amidi_controllers() -> Dict[str, str]:
    """Get a mapping of MIDI controller names to their device IDs."""
    p = run(["amidi", "-l"], stdout=PIPE, text=True)

    # Split into lines and skip header
    lines = p.stdout.split("\n")[1:]
    lines = [l for l in lines if l.strip()]

    # Split each line into parts
    parts = [shlex.split(l) for l in lines]

    # Create mapping of name -> device
    return {p[-1]: p[1] for p in parts}


@click.group(context_settings=dict(help_option_names=["-h", "--help"]))
def cli():
    """MIDI controller management tool."""
    pass


@cli.command(short_help="List available MIDI controllers")
def list():
    """List all available MIDI controllers."""
    controllers = get_amidi_controllers()
    if not controllers:
        click.echo("No MIDI controllers found.")
        return

    click.echo("Available controllers:")
    for name, dev_id in controllers.items():
        click.echo(f"  {name} (hw:{dev_id})")


@cli.command(short_help="Monitor MIDI controller")
@click.argument("controller", required=False, default="nanoKONTROL2")
@click.option(
    "--mode",
    "-m",
    type=click.Choice(["raw", "parsed"], case_sensitive=False),
    default="raw",
    help="Output mode for MIDI messages",
)
def monitor(controller: str, mode: str):
    """Monitor MIDI messages from specified controller.

    If no controller is specified, defaults to nanoKONTROL2.
    """
    controllers = get_amidi_controllers()

    try:
        dev = controllers[controller]
    except KeyError:
        click.echo(f"Error: Controller '{controller}' not found", err=True)
        click.echo(f"Available controllers: {list(controllers.keys())}", err=True)
        sys.exit(1)

    cmd = ["amidi", "-d", "-p", f"hw:{dev}"]
    click.echo(f"Monitoring {controller} (hw:{dev}) in {mode} mode...")

    try:
        # Run amidi and process output based on mode
        process = run(cmd, capture_output=True, text=True)

        match mode.lower():
            case "raw":
                click.echo(process.stdout)
            case "parsed":
                for line in process.stdout.splitlines():
                    try:
                        # Basic MIDI message parsing - expand as needed
                        bytes_str = line.strip()
                        bytes_list = [int(b, 16) for b in bytes_str.split()]
                        match bytes_list:
                            case [status, data1, data2] if 0xB0 <= status <= 0xBF:
                                channel = status & 0x0F
                                click.echo(
                                    f"Control Change: Channel {channel}, Controller {data1}, Value {data2}"
                                )
                            case [status, data1, data2] if 0x90 <= status <= 0x9F:
                                channel = status & 0x0F
                                click.echo(
                                    f"Note On: Channel {channel}, Note {data1}, Velocity {data2}"
                                )
                            case [status, data1, data2] if 0x80 <= status <= 0x8F:
                                channel = status & 0x0F
                                click.echo(
                                    f"Note Off: Channel {channel}, Note {data1}, Velocity {data2}"
                                )
                            case _:
                                click.echo(f"Unknown message: {bytes_str}")
                    except ValueError:
                        click.echo(f"Invalid MIDI message: {line}")

    except KeyboardInterrupt:
        click.echo("\nMonitoring stopped.")


@cli.command(short_help="Test MIDI controller connection")
@click.argument("controller", required=False, default="nanoKONTROL2")
def test(controller: str):
    """Test connection to a MIDI controller.

    Attempts to open the device and verify it's accessible.
    """
    controllers = get_amidi_controllers()

    try:
        dev = controllers[controller]
        click.echo(f"Testing connection to {controller} (hw:{dev})...")

        # Try to open the device briefly
        cmd = ["amidi", "-p", f"hw:{dev}", "-d", "-t", "0.1"]
        result = run(cmd, capture_output=True)

        if result.returncode == 0:
            click.echo(click.style("✓ Controller is accessible", fg="green"))
        else:
            click.echo(click.style("✗ Failed to access controller", fg="red"))

    except KeyError:
        click.echo(
            click.style(f"✗ Controller '{controller}' not found", fg="red"), err=True
        )
        click.echo("Available controllers:", err=True)
        for name in controllers:
            click.echo(f"  - {name}", err=True)
        sys.exit(1)


if __name__ == "__main__":
    cli()
