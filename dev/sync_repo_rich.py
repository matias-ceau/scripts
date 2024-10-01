import argparse
import os
import subprocess
import sys

from rich.console import Console
from rich.panel import Panel
from rich.syntax import Syntax
from rich.text import Text

console = Console()


def run_command(command, check=True, capture_output=False):
    print_command(command)
    result = subprocess.run(
        command, check=check, capture_output=capture_output, text=True
    )
    return result


def print_command(command):
    syntax = Syntax(" ".join(command), "bash", theme="monokai")
    console.print(Panel(syntax, expand=False, border_style="cyan"))


def print_formatted(message, style="bold green"):
    console.print(Panel(Text(message, style=style), expand=False))


def print_error(message):
    console.print(Panel(Text(message, style="bold red"), expand=False))


def handle_error(message, command_output=None):
    print_error(f"Error: {message}")
    if command_output:
        print_error(f"Command output:\n{command_output}")
    sys.exit(1)


def resolve_conflicts():
    while True:
        choice = input(
            "How do you want to resolve conflicts? (m)anually, (a)bort, (s)kip: "
        ).lower()
        if choice == "m":
            print_formatted(
                "Please resolve conflicts manually, then press Enter to continue."
            )
            input()
            return True
        elif choice == "a":
            return False
        elif choice == "s":
            return True


def main():
    global args
    parser = argparse.ArgumentParser(description="Sync Git repository")
    parser.add_argument("repo_path", help="Path to the Git repository")
    # parser.add_argument("--dry-run", action="store_true", help="Print commands without executing them")
    args = parser.parse_args()

    os.chdir(args.repo_path)

    if not os.path.isdir(".git"):
        handle_error(f"{args.repo_path} is not a Git repository.")

    print_formatted("Fetching changes from remote...")
    run_command(["git", "fetch", "--all", "--prune"])

    local_branch = run_command(
        ["git", "rev-parse", "--abbrev-ref", "HEAD"], capture_output=True
    ).stdout.strip()
    remote_branch = f"origin/{local_branch}"

    print_formatted("Checking for changes to pull...")
    behind_count = int(
        run_command(
            ["git", "rev-list", f"{local_branch}..{remote_branch}", "--count"],
            capture_output=True,
        ).stdout
    )

    if behind_count == 0:
        print_formatted("Local branch is up to date.")
    else:
        print_formatted(f"Found {behind_count} new commit(s) to pull.")

        stash_result = run_command(
            ["git", "stash", "push", "-m", "Auto-stash before syncing"], check=False
        )
        changes_stashed = stash_result.returncode == 0

        try:
            run_command(["git", "merge", "--ff-only", remote_branch])
        except subprocess.CalledProcessError:
            print_error("Fast-forward merge failed. Attempting to merge with commit...")
            try:
                run_command(["git", "merge", remote_branch])
            except subprocess.CalledProcessError:
                print_error("Merge failed. Manual intervention required.")
                if not resolve_conflicts():
                    run_command(["git", "merge", "--abort"])
                    handle_error("Merge aborted.")

        if changes_stashed:
            print_formatted("Applying stashed changes...")
            try:
                run_command(["git", "stash", "pop"])
            except subprocess.CalledProcessError:
                print_error("Conflict occurred while applying stashed changes.")
                if not resolve_conflicts():
                    run_command(["git", "reset", "--hard"])
                    run_command(["git", "stash", "pop", "--index", "1"])
                    handle_error("Stash application aborted.")

    print_formatted("Checking for local changes to commit...")
    status_output = run_command(
        ["git", "status", "--porcelain"], capture_output=True
    ).stdout

    if status_output:
        print_formatted("Found local changes. Committing...")
        run_command(["git", "add", "-A"])
        run_command(["git", "commit", "-m", "Auto-commit: Local changes"])
        print_formatted("Pushing changes to remote...")
        run_command(["git", "push"])
    else:
        print_formatted("No local changes to commit.")

    print_formatted("Running Git maintenance...")
    run_command(["git", "maintenance", "run"])

    print_formatted("Sync completed successfully!")
    print_formatted("Summary of changes:")
    run_command(
        ["git", "log", "--oneline", "--graph", "--decorate", "--all", "-n", "10"]
    )


if __name__ == "__main__":
    main()

