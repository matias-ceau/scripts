#!/usr/bin/env python

import argparse
import datetime
import os
import subprocess
import sys

from rich import print as rprint
from rich.console import Console
from rich.panel import Panel
from rich.progress import Progress
from rich.syntax import Syntax
from rich.table import Table

console = Console()


def run_command(command):
    console.print(f"[bold cyan]Command:[/bold cyan] {command}")
    result = subprocess.run(command, shell=True, text=True, capture_output=True)
    if result.stdout:
        syntax = Syntax(result.stdout, "bash", theme="monokai", line_numbers=True)
        console.print(syntax)
    if result.returncode != 0:
        console.print(f"[bold red]Error:[/bold red] {result.stderr}", style="red")
    return result


def handle_error(message):
    console.print(f"[bold red]Error:[/bold red] {message}", style="red")
    sys.exit(1)


def generate_commit_message():
    status = run_command("git status -s")
    changes = len(status.stdout.splitlines())
    return f"{changes} change(s) from {os.environ.get('USER')}@{os.environ.get('HOSTNAME')}"


def handle_merge_pull_conflicts():
    console.print(Panel("Conflicts detected during merge. Here are your options:"))
    console.print("[e] - Open your default editor to resolve conflicts manually")
    console.print("[a] - Abort the merge and return to the previous state")
    console.print("[s] - Skip this commit and continue with the next one")

    choice = input().lower()
    if choice == "a":
        run_command("git merge --abort")
        console.print(
            "[yellow]Merge aborted. Repository is back to its previous state.[/yellow]"
        )
    elif choice == "s":
        run_command("git reset --hard")
        console.print("[yellow]Skipped conflicting commit. Continuing sync...[/yellow]")
    else:
        run_command("git status")
        console.print("[green]Opening editor to resolve conflicts...[/green]")
        editor = os.environ.get("EDITOR", "vim")
        conflicted_files = run_command(
            "git diff --name-only --diff-filter=U"
        ).stdout.splitlines()
        for file in conflicted_files:
            subprocess.run([editor, file])
        run_command("git add .")
        run_command("git commit")


def handle_stash_conflict(file):
    console.print(
        Panel(f"Conflict detected when applying stashed changes in file: {file}")
    )
    console.print("Options:")
    console.print("  [r] - Use remote version (discard local changes)")
    console.print("  [l] - Keep local version")
    console.print("  [m] - Manually resolve conflict")

    choice = input("Choose an option [r/l/m]: ").lower()
    if choice == "r":
        run_command(f'git checkout --theirs -- "{file}"')
        run_command(f'git add "{file}"')
        console.print(f"[green]Remote version of {file} has been applied.[/green]")
    elif choice == "l":
        run_command(f'git checkout --ours -- "{file}"')
        run_command(f'git add "{file}"')
        console.print(f"[green]Local version of {file} has been kept.[/green]")
    elif choice == "m":
        editor = os.environ.get("EDITOR", "nvim")
        subprocess.run([editor, file])
        run_command(f'git add "{file}"')
        console.print(f"[green]Manual edits for {file} have been staged.[/green]")
    else:
        console.print(
            "[yellow]Invalid option. Keeping conflict markers for manual resolution later.[/yellow]"
        )


def display_summary():
    table = Table(title="Sync Summary")
    table.add_column("Item", style="cyan", no_wrap=True)
    table.add_column("Value", style="magenta")

    current_time = datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S %z")
    table.add_row("Current Time", current_time)

    current_commit = run_command("git show -s --format=%ci HEAD").stdout.strip()
    previous_commit = run_command("git show -s --format=%ci HEAD^").stdout.strip()
    table.add_row("Current Commit", current_commit)
    table.add_row("Previous Commit", previous_commit)

    console.print(table)

    console.print(Panel("Last Changes"))
    run_command("git diff --stat HEAD^")


def main():
    parser = argparse.ArgumentParser(description="Sync git repository")
    parser.add_argument("repo_dir", nargs="?", help="Path to the git repository")
    args = parser.parse_args()

    if not args.repo_dir:
        handle_error("No path provided")

    repo_dir = os.path.realpath(args.repo_dir)
    original_dir = os.getcwd()

    if not os.path.isdir(repo_dir):
        handle_error(f"The provided path is not a directory: {repo_dir}")

    os.chdir(repo_dir)

    if not os.path.isdir(".git"):
        handle_error(f"The provided directory is not a git repository: {repo_dir}")

    remote = run_command("git remote").stdout.strip()
    local = run_command("git branch --show-current").stdout.strip()
    repo_name = run_command(
        "git remote -v | grep fetch | awk '{print $2}' | sed 's/.*\\(.*\\)\\.git/\\1/'"
    ).stdout.strip()

    console.print(
        Panel(f"Syncing {repo_name}: {local} -> {remote}", style="bold green")
    )

    console.print(Panel("FETCHING/PULLING", style="bold blue"))

    with Progress() as progress:
        task = progress.add_task("[cyan]Fetching...", total=100)
        run_command("git fetch --all --prune")
        progress.update(task, advance=100)

    if run_command(f"git diff --quiet {local} @{{u}}").returncode == 0:
        console.print("[green]No changes to pull. Local branch is up to date.[/green]")
    else:
        if run_command("git diff-index --quiet HEAD --").returncode != 0:
            run_command("git stash")

        if run_command("git merge --ff-only @{u}").returncode != 0:
            console.print(
                "[yellow]Cannot fast-forward. Attempting to rebase...[/yellow]"
            )
            if run_command(f"git pull --rebase {remote} {local}").returncode != 0:
                handle_merge_pull_conflicts()

        if run_command("git stash list").stdout:
            if run_command("git stash pop").returncode != 0:
                console.print(
                    "[yellow]Conflicts detected when applying stashed changes[/yellow]"
                )
                conflicted_files = run_command(
                    "git diff --name-only --diff-filter=U"
                ).stdout.splitlines()
                for file in conflicted_files:
                    handle_stash_conflict(file)
                run_command("git stash drop")

    console.print(
        Panel("CHECKING STATUS - ADD AND COMMIT IF NEEDED", style="bold blue")
    )

    run_command("git status -s")

    if run_command("git status -s").stdout:
        run_command("git add -A")
        message = generate_commit_message()
        run_command(f'git commit -m "{message}"')

        with Progress() as progress:
            task = progress.add_task("[cyan]Pushing...", total=100)
            if run_command(f"git push {remote} {local}").returncode != 0:
                console.print(
                    "[yellow]Push failed. Pulling latest changes and trying again...[/yellow]"
                )
                run_command(f"git pull --ff-only {remote} {local}")
                run_command(f"git push {remote} {local}")
            progress.update(task, advance=100)
    else:
        console.print("[green]No local changes to commit and push.[/green]")

    console.print(Panel("QUICK SUMMARY", style="bold blue"))
    console.print(
        f"[green]Repository in {repo_dir} has been successfully synced.[/green]"
    )
    display_summary()

    os.chdir(original_dir)


if __name__ == "__main__":
    main()
