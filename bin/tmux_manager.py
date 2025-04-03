#!/usr/bin/env -S uv run --script --quiet

# /// script
# requires-python = ">=3.13"
# dependencies = [
#     "colorama",
#     "pyyaml",
# ]
# ///

import argparse
import os
import signal
import subprocess
import sys
from pathlib import Path
from typing import Dict, List

import yaml
from colorama import Fore, Style, init

# Initialize colorama for cross-platform color support
init(autoreset=True)  # Auto reset colors after each print statement

# Constants
SCRIPTS = os.environ.get("SCRIPTS", str(Path.home() / "scripts"))
CONFIG_FILE = Path(f"{SCRIPTS}/config/tmux_sessions.yaml")

DEFAULT_CONFIG = """
# Tmux Sessions Configuration
sessions:
  - name: MEGA
    autostart: true
    windows:
      - name: megacmd
        command: mega-cmd
  
  - name: MUSIC
    autostart: true
    windows:
      - name: cmus
        command: cmus
"""


class TmuxSession:
    def __init__(self, name: str, autostart: bool, windows: List[Dict[str, str]]):
        self.name = name.upper()
        self.autostart = autostart
        self.windows = windows

    @property
    def is_running(self) -> bool:
        """Check if the tmux session is currently running"""
        try:
            result = run_command(["tmux", "has-session", "-t", self.name], check=False)
            return result.returncode == 0
        except Exception:
            return False


def run_command(
    cmd: List[str], check: bool = True, capture: bool = True
) -> subprocess.CompletedProcess:
    """Run a command with proper error handling and return the result

    Args:
        cmd: Command and arguments as a list
        check: Whether to raise an exception on non-zero exit
        capture: Whether to capture output

    Returns:
        CompletedProcess instance
    """
    try:
        return subprocess.run(
            cmd,
            check=check,
            capture_output=capture,
            text=True,
        )
    except subprocess.CalledProcessError as e:
        if check:
            print(f"{Fore.RED}Command failed: {' '.join(cmd)}")
            if e.stdout:
                print(f"{Fore.YELLOW}STDOUT: {e.stdout.strip()}")
            if e.stderr:
                print(f"{Fore.RED}STDERR: {e.stderr.strip()}")
            raise
        return e


def ensure_config_dir() -> None:
    """Ensure the config directory exists"""
    config_dir = CONFIG_FILE.parent
    if not config_dir.exists():
        config_dir.mkdir(parents=True, exist_ok=True)
        print(f"{Fore.BLUE}Created config directory: {config_dir}")


def load_config() -> List[TmuxSession]:
    """Load and parse the YAML configuration file"""
    ensure_config_dir()

    if not CONFIG_FILE.exists():
        print(
            f"{Fore.YELLOW}Configuration file not found. Creating default at {CONFIG_FILE}"
        )
        with open(CONFIG_FILE, "w") as f:
            f.write(DEFAULT_CONFIG)

    try:
        with open(CONFIG_FILE) as f:
            config = yaml.safe_load(f) or {"sessions": []}
    except Exception as e:
        print(f"{Fore.RED}Error loading config: {e}")
        # Return empty config instead of crashing
        return []

    sessions = []
    for session_config in config.get("sessions", []):
        try:
            sessions.append(
                TmuxSession(
                    name=session_config["name"],
                    autostart=session_config.get("autostart", False),
                    windows=session_config.get("windows", []),
                )
            )
        except KeyError as e:
            print(f"{Fore.RED}Invalid session config, missing key: {e}")

    return sessions


def launch_session(session: TmuxSession, force_relaunch: bool = False) -> bool:
    """Launch a tmux session with all its configured windows

    Args:
        session: The session to launch
        force_relaunch: Whether to kill and restart if already running

    Returns:
        Success status
    """
    if not session.windows:
        print(
            f"{Fore.RED}Cannot launch session '{session.name}': No windows configured"
        )
        return False

    if session.is_running:
        if not force_relaunch:
            print(
                f"Session '{session.name}' is already running. Use --relaunch to force restart."
            )
            return False
        else:
            print(f"{Fore.YELLOW}Killing existing session: {session.name}")
            try:
                run_command(["tmux", "kill-session", "-t", session.name])
            except Exception as e:
                print(f"{Fore.RED}Failed to kill session: {e}")
                return False

    # Create the first window with the first command
    first_window = session.windows[0]

    # Use Popen for tmux session creation to better handle process detachment
    try:
        # First, sanitize the command
        window_cmd = first_window["command"]

        cmd = [
            "tmux",
            "new-session",
            "-d",  # detached
            "-s",
            session.name,
            "-n",
            first_window["name"],
        ]

        if window_cmd:
            cmd.extend([window_cmd])

        proc = subprocess.Popen(
            cmd,
            start_new_session=True,  # Properly detach from parent
        )

        # Wait a brief moment to ensure session is created
        exit_code = proc.wait(timeout=2)
        if exit_code != 0:
            print(
                f"{Fore.RED}Failed to create session '{session.name}', exit code: {exit_code}"
            )
            return False

    except Exception as e:
        print(f"{Fore.RED}Failed to launch session '{session.name}': {e}")
        return False

    # Create additional windows if any
    window_count = 1
    for window in session.windows[1:]:
        try:
            cmd = [
                "tmux",
                "new-window",
                "-t",
                session.name,
                "-n",
                window["name"],
            ]

            if window["command"]:
                cmd.extend([window["command"]])

            run_command(cmd)
            window_count += 1
        except Exception as e:
            print(f"{Fore.RED}Failed to create window '{window['name']}': {e}")
            # Continue with other windows

    print(
        f"{Fore.GREEN}Launched session '{session.name}' with {window_count} window(s)"
    )
    return True


def add_new_session() -> None:
    """Interactive prompt to add a new tmux session configuration"""
    print(f"\n{Fore.CYAN}=== Adding New Tmux Session Configuration ===")

    # Get session details
    session_name = (
        input(f"{Fore.GREEN}Enter session name: {Style.RESET_ALL}").strip().upper()
    )
    if not session_name:
        print(f"{Fore.RED}Session name cannot be empty")
        return

    autostart = (
        input(f"{Fore.GREEN}Enable autostart? (y/N): {Style.RESET_ALL}").lower() == "y"
    )

    windows = []
    while True:
        window_name = input(
            f"\n{Fore.GREEN}Enter window name (or empty to finish): {Style.RESET_ALL}"
        ).strip()
        if not window_name:
            if windows:  # Only break if we have at least one window
                break
            print(f"{Fore.RED}At least one window must be configured")
            continue

        command = input(
            f"{Fore.GREEN}Enter command for this window: {Style.RESET_ALL}"
        ).strip()
        windows.append({"name": window_name.upper(), "command": command})

    # Load existing config
    ensure_config_dir()
    if CONFIG_FILE.exists():
        try:
            with open(CONFIG_FILE) as f:
                config = yaml.safe_load(f) or {"sessions": []}
        except Exception as e:
            print(f"{Fore.RED}Error reading config: {e}")
            config = {"sessions": []}
    else:
        config = {"sessions": []}

    # Check for existing session
    for i, session in enumerate(config.get("sessions", [])):
        if session["name"].upper() == session_name:
            overwrite = (
                input(
                    f"{Fore.YELLOW}Session '{session_name}' already exists. Overwrite? (y/N): {Style.RESET_ALL}"
                ).lower()
                == "y"
            )

            if not overwrite:
                print("Operation cancelled.")
                return

            # Remove existing session
            config["sessions"].pop(i)
            break

    # Add new session
    if "sessions" not in config:
        config["sessions"] = []

    config["sessions"].append(
        {"name": session_name, "autostart": autostart, "windows": windows}
    )

    # Write updated config
    try:
        with open(CONFIG_FILE, "w") as f:
            yaml.dump(config, f, sort_keys=False)
        print(f"\n{Fore.GREEN}Session '{session_name}' added successfully!")
    except Exception as e:
        print(f"{Fore.RED}Error saving configuration: {e}")


def list_sessions(sessions: List[TmuxSession]) -> None:
    """Display all configured sessions and their status"""
    if not sessions:
        print(
            f"{Fore.YELLOW}No sessions configured. Use --add to create a new session."
        )
        return

    print(f"\n{Fore.CYAN}Configured Tmux Sessions:")
    print(f"{Fore.CYAN}" + "-" * 60)

    # Table header
    print(f"{'NAME':<20} {'STATUS':<10} {'STARTUP':<10} {'WINDOWS':<10}")
    print(f"{Fore.CYAN}" + "-" * 60)

    for session in sessions:
        status = f"{Fore.GREEN}RUNNING" if session.is_running else f"{Fore.RED}STOPPED"
        autostart = f"{Fore.BLUE}AUTO" if session.autostart else f"{Fore.YELLOW}MANUAL"

        print(
            f"{session.name:<20} {status:<10} {autostart:<10} {len(session.windows):<10}"
        )

        for window in session.windows:
            print(
                f"  {Fore.CYAN}•{Style.RESET_ALL} {window['name']:<15} → {window['command']}"
            )

    print(f"{Fore.CYAN}" + "-" * 60)


def setup_signal_handlers():
    """Set up proper signal handling for clean exits"""

    def signal_handler(sig, frame):
        print(f"\n{Fore.YELLOW}Operation cancelled by user")
        sys.exit(0)

    signal.signal(signal.SIGINT, signal_handler)
    signal.signal(signal.SIGTERM, signal_handler)


def main():
    setup_signal_handlers()

    parser = argparse.ArgumentParser(
        description="Tmux Session Manager",
        formatter_class=argparse.ArgumentDefaultsHelpFormatter,
    )

    # Create command groups
    group = parser.add_mutually_exclusive_group()
    group.add_argument("-a", "--all", action="store_true", help="Launch all sessions")
    group.add_argument(
        "-s", "--session", help="Launch specific session (case insensitive)"
    )
    group.add_argument(
        "-u", "--auto", action="store_true", help="Launch all autostart sessions"
    )
    group.add_argument("-l", "--list", action="store_true", help="List all sessions")
    group.add_argument("--add", action="store_true", help="Add new session")

    # Additional options
    parser.add_argument(
        "-r", "--relaunch", action="store_true", help="Force relaunch if session exists"
    )

    args = parser.parse_args()

    try:
        sessions = load_config()
    except Exception as e:
        print(f"{Fore.RED}Failed to load configuration: {e}")
        sys.exit(1)

    if args.add:
        add_new_session()
        return

    if args.list:
        list_sessions(sessions)
        return

    if args.session:
        # Case insensitive session name matching
        session_name = args.session.upper()
        session = next((s for s in sessions if s.name.upper() == session_name), None)
        if not session:
            print(f"{Fore.RED}Session '{args.session}' not found in configuration")
            sys.exit(1)
        success = launch_session(session, args.relaunch)
        if not success:
            sys.exit(1)
        return

    if args.all:
        if not sessions:
            print(f"{Fore.YELLOW}No sessions configured")
            sys.exit(1)

        failed = []
        for session in sessions:
            if not launch_session(session, args.relaunch):
                failed.append(session.name)

        if failed:
            print(f"{Fore.YELLOW}Failed to launch: {', '.join(failed)}")
            sys.exit(1)
        return

    if args.auto:
        auto_sessions = [s for s in sessions if s.autostart]
        if not auto_sessions:
            print(f"{Fore.YELLOW}No autostart sessions configured")
            sys.exit(1)

        failed = []
        for session in auto_sessions:
            if not launch_session(session, args.relaunch):
                failed.append(session.name)

        if failed:
            print(f"{Fore.YELLOW}Failed to launch: {', '.join(failed)}")
            sys.exit(1)
        return

    # No arguments, show help
    parser.print_help()


if __name__ == "__main__":
    try:
        main()
    except KeyboardInterrupt:
        print(f"\n{Fore.YELLOW}Operation cancelled by user")
        sys.exit(1)
    except subprocess.CalledProcessError as e:
        print(f"\n{Fore.RED}Error launching tmux session: {e}")
        sys.exit(1)
    except Exception as e:
        print(f"\n{Fore.RED}Unexpected error: {e}")
        import traceback

        traceback.print_exc()
        sys.exit(1)
