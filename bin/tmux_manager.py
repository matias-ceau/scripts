#!/usr/bin/env -S uv run --script --quiet

# /// script
# requires-python = ">=3.12"
# dependencies = [
#     "colorama",
#     "pyyaml",
# ]
# ///

import argparse
import os
import subprocess
import sys
from pathlib import Path
from typing import Dict, List

import yaml
from colorama import Fore, Style, init

# Initialize colorama for cross-platform color support
init()

SCRIPTS = os.environ["SCRIPTS"]
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
            return (
                subprocess.run(
                    ["tmux", "has-session", "-t", self.name],
                    check=False,
                    capture_output=True,
                ).returncode
                == 0
            )
        except:
            return False


def load_config() -> List[TmuxSession]:
    """Load and parse the YAML configuration file"""
    if not CONFIG_FILE.exists():
        print(f"Configuration file not found. Creating default at {CONFIG_FILE}")
        with open(CONFIG_FILE, "w") as f:
            f.write(DEFAULT_CONFIG)

    with open(CONFIG_FILE) as f:
        config = yaml.safe_load(f)

    sessions = []
    for session_config in config["sessions"]:
        sessions.append(
            TmuxSession(
                name=session_config["name"],
                autostart=session_config.get("autostart", False),
                windows=session_config["windows"],
            )
        )
    return sessions


def launch_session(session: TmuxSession, force_relaunch: bool = False) -> bool:
    """Launch a tmux session with all its configured windows"""
    if session.is_running:
        if not force_relaunch:
            print(
                f"Session '{session.name}' is already running. Use --relaunch to force restart."
            )
            return False
        else:
            subprocess.run(["tmux", "kill-session", "-t", session.name], check=False)

    # Create the first window with the first command
    first_window = session.windows[0]
    subprocess.run(
        [
            "tmux",
            "new-session",
            "-d",  # detached
            "-s",
            session.name,
            "-n",
            first_window["name"],
            first_window["command"],
        ],
        check=True,
    )

    # Create additional windows if any
    for window in session.windows[1:]:
        subprocess.run(
            [
                "tmux",
                "new-window",
                "-t",
                session.name,
                "-n",
                window["name"],
                window["command"],
            ],
            check=True,
        )

    print(f"Launched session '{session.name}' with {len(session.windows)} windows")
    return True


def add_new_session() -> None:
    """Interactive prompt to add a new tmux session configuration"""
    print(
        f"\n{Fore.CYAN}=== Adding New Tmux Session Configuration ==={Style.RESET_ALL}"
    )

    # Get session details
    session_name = input(f"{Fore.GREEN}Enter session name:{Style.RESET_ALL} ").strip()
    autostart = (
        input(f"{Fore.GREEN}Enable autostart? (y/N):{Style.RESET_ALL} ").lower() == "y"
    )

    windows = []
    while True:
        window_name = input(
            f"\n{Fore.GREEN}Enter window name (or empty to finish):{Style.RESET_ALL} "
        ).strip()
        if not window_name:
            break

        command = input(
            f"{Fore.GREEN}Enter command for this window:{Style.RESET_ALL} "
        ).strip()
        windows.append({"name": window_name.upper(), "command": command})

        if not windows:
            print(
                f"{Fore.RED}Error: At least one window must be configured{Style.RESET_ALL}"
            )
            return

    # Load existing config
    if CONFIG_FILE.exists():
        with open(CONFIG_FILE) as f:
            config = yaml.safe_load(f) or {"sessions": []}
    else:
        config = {"sessions": []}

    # Check for existing session
    for session in config["sessions"]:
        if session["name"] == session_name:
            overwrite = input(
                f"{Fore.YELLOW}Session '{session_name}' already exists. Overwrite? (y/N):{Style.RESET_ALL} "
            ).lower()
            if overwrite != "y":
                print("Operation cancelled.")
                return
            config["sessions"].remove(session)
            break

    # Add new session
    config["sessions"].append(
        {"name": session_name, "autostart": autostart, "windows": windows}
    )

    # Write updated config
    with open(CONFIG_FILE, "w") as f:
        yaml.dump(config, f, sort_keys=False)

    print(
        f"\n{Fore.GREEN}Session '{session_name}' added successfully!{Style.RESET_ALL}"
    )


def list_sessions(sessions: List[TmuxSession]) -> None:
    """Display all configured sessions and their status"""
    print(f"\n{Fore.CYAN}Configured Tmux Sessions:{Style.RESET_ALL}")
    print("-" * 50)
    for session in sessions:
        status = (
            f"{Fore.GREEN}RUNNING{Style.RESET_ALL}"
            if session.is_running
            else f"{Fore.RED}STOPPED{Style.RESET_ALL}"
        )
        autostart = (
            f"{Fore.BLUE}AUTO{Style.RESET_ALL}"
            if session.autostart
            else f"{Fore.YELLOW}MANUAL{Style.RESET_ALL}"
        )

        # Calculate padding considering the color codes
        name_padding = 20
        status_padding = 8
        auto_padding = 6

        print(
            f"{session.name:<{name_padding}} [{status:<{status_padding}}] [{autostart:<{auto_padding}}] [{len(session.windows)}]"
        )
        for window in session.windows:
            print(
                f"  {Fore.CYAN}•{Style.RESET_ALL} {window['name']:<15} → {window['command']}"
            )
    print("-" * 50)


def main():
    parser = argparse.ArgumentParser(description="Tmux Session Manager")
    group = parser.add_mutually_exclusive_group()
    group.add_argument("-a", "--all", action="store_true", help="Launch all sessions")
    group.add_argument("-s", "--session", help="Launch specific session")
    group.add_argument(
        "-u", "--auto", action="store_true", help="Launch all autostart sessions"
    )
    group.add_argument("-l", "--list", action="store_true", help="List all sessions")
    group.add_argument("--add", action="store_true", help="Add new session")
    parser.add_argument(
        "-r", "--relaunch", action="store_true", help="Force relaunch if session exists"
    )

    args = parser.parse_args()
    sessions = load_config()

    if args.add:
        add_new_session()
        return

    if args.list:
        list_sessions(sessions)
        return

    if args.session:
        session = next((s for s in sessions if s.name == args.session), None)
        if not session:
            print(
                f"{Fore.RED}Session '{args.session}' not found in configuration{Style.RESET_ALL}"
            )
            return
        launch_session(session, args.relaunch)
        return

    if args.all:
        for session in sessions:
            launch_session(session, args.relaunch)
        return

    if args.auto:
        for session in sessions:
            if session.autostart:
                launch_session(session, args.relaunch)
        return

    parser.print_help()


if __name__ == "__main__":
    try:
        main()
    except KeyboardInterrupt:
        print(f"\n{Fore.YELLOW}Operation cancelled by user{Style.RESET_ALL}")
        sys.exit(1)
    except subprocess.CalledProcessError as e:
        print(f"\n{Fore.RED}Error launching tmux session: {e}{Style.RESET_ALL}")
        sys.exit(1)
    except Exception as e:
        print(f"\n{Fore.RED}Unexpected error: {e}{Style.RESET_ALL}")
        sys.exit(1)
