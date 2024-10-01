#!/usr/bin/env python3

import os
import sys
import subprocess
import argparse
from datetime import datetime
import shutil

# Color definitions
RED = "\033[31m"
GREEN = "\033[32m"
YELLOW = "\033[33m"
BLUE = "\033[34m"
MAGENTA = "\033[35m"
CYAN = "\033[36m"
RESET = "\033[0m"
BOLD = "\033[1m"

# Check for bat and glow
USE_BAT = shutil.which('bat') is not None
USE_GLOW = shutil.which('glow') is not None

if not USE_BAT:
    print(f"{YELLOW}Warning: 'bat' is not installed. Output might look less pretty.{RESET}")
if not USE_GLOW:
    print(f"{YELLOW}Warning: 'glow' is not installed. Output might look less pretty.{RESET}")

def strip_ansi(text):
    import re
    ansi_escape = re.compile(r'\x1B(?:[@-Z\\-_]|\[[0-?]*[ -/]*[@-~])')
    return ansi_escape.sub('', text)

def print_command(cmd):
    if USE_BAT:
        subprocess.run(f'echo "{GREEN}$ {BLUE}{cmd}{RESET}" | bat -lzsh --style=rule --highlight-line 1 --theme="gruvbox-dark"', shell=True)
    else:
        print(f"{GREEN}$ {BLUE}{cmd}{RESET}")

def run_command(cmd, dry_run=False):
    print_command(cmd)
    if not dry_run:
        return subprocess.run(cmd, shell=True, check=True, text=True, capture_output=True)

def handle_error(message):
    print(f"{RED}Error: {message}{RESET}", file=sys.stderr)
    sys.exit(1)

def print_usage():
    cmd_name = os.path.basename(sys.argv[0])
    print(f"\n{YELLOW}USAGE:{RESET}")
    print(f"    {RED}{cmd_name}{RESET} {BOLD}<repository_path>{RESET} [--dry-run] [--help]\n")
    print(f"{YELLOW}EXAMPLES:{RESET}")
    print(f"    {RED}{cmd_name}{RESET} ~/.scripts")
    print(f"    {RED}{cmd_name}{RESET} {GREEN}$SCRIPTS{RESET}    ---  (if var is set)")
    print(f"    {BLUE}git_sync      {GREEN}$SCRIPTS{RESET}    ---  (if alias is set)")
    print(f"    {RED}{cmd_name}{RESET} {GREEN}$SCRIPTS{RESET} --dry-run    ---  (perform a dry run)")

def print_formatted(text):
    if USE_BAT:
        subprocess.run(f'echo "{text}" | bat -lmd --style="grid" --theme="Solarized (dark)"', shell=True)
    else:
        print(text)

def print_glow(text):
    if USE_GLOW:
        subprocess.run(f'echo "{strip_ansi(text)}" | glow', shell=True)
    else:
        print(text)

def generate_commit_message(repo_dir):
    status = subprocess.run("git status -s", shell=True, capture_output=True, text=True).stdout
    nb_changes = len(status.splitlines())
    return f"{nb_changes} change(s) from {os.environ.get('USER')}@{os.uname().nodename}"

def handle_merge_pull_conflicts():
    print(f"{YELLOW}Conflicts detected during merge. Here are your options:{RESET}")
    print("    [e] - Open your default editor to resolve conflicts manually")
    print("    (a) - Abort the merge and return to the previous state")
    print("    (s) - Skip this commit and continue with the next one")
    
    choice = input().lower()
    if choice == 'a':
        run_command("git merge --abort")
        print("Merge aborted. Repository is back to its previous state.")
    elif choice == 's':
        run_command("git reset --hard")
        print("Skipped conflicting commit. Continuing sync...")
    else:
        run_command("git status")
        print("Opening editor to resolve conflicts...")
        editor = os.environ.get('EDITOR', 'vim')
        conflicted_files = subprocess.run("git diff --name-only --diff-filter=U", shell=True, capture_output=True, text=True).stdout.strip()
        for file in conflicted_files.split('\n'):
            subprocess.run([editor, file])
        run_command("git add .")
        run_command("git commit")

def handle_stash_conflict(file):
    print(f"{YELLOW}Conflict detected when applying stashed changes in file: {file}{RESET}")
    print("Options:")
    print("  [r] - Use remote version (discard local changes)")
    print("  [l] - Keep local version")
    print("  [m] - Manually resolve conflict")
    
    choice = input("Choose an option [r/l/m]: ").lower()
    if choice == 'r':
        run_command(f'git checkout --theirs -- "{file}"')
        run_command(f'git add "{file}"')
        print(f"{GREEN}Remote version of {file} has been applied.{RESET}")
    elif choice == 'l':
        run_command(f'git checkout --ours -- "{file}"')
        run_command(f'git add "{file}"')
        print(f"{GREEN}Local version of {file} has been kept.{RESET}")
    elif choice == 'm':
        editor = os.environ.get('EDITOR', 'vim')
        subprocess.run([editor, file])
        run_command(f'git add "{file}"')
        print(f"{GREEN}Manual edits for {file} have been staged.{RESET}")
    else:
        print(f"{RED}Invalid option. Keeping conflict markers for manual resolution later.{RESET}")

def display_summary():
    print_glow('# Git log')
    changes = subprocess.run("git diff --stat '@{1}'", shell=True, capture_output=True, text=True).stdout
    if changes:
        print(f"                {datetime.now().strftime('%Y-%m-%d %H:%M:%S %z')}")
        head_commit_date = subprocess.run("git show -s --format=%ci HEAD", shell=True, capture_output=True, text=True).stdout.strip()
        prev_commit_date = subprocess.run("git show -s --format=%ci HEAD^", shell=True, capture_output=True, text=True).stdout.strip()
        print(f"Current commit: {head_commit_date}")
        print(f"  Previous one: {prev_commit_date}")
        print("Last changes")
        subprocess.run("git diff --stat HEAD^", shell=True)
    else:
        print(f"\n{BOLD}No changes were made during this sync.{RESET}")

def main():
    parser = argparse.ArgumentParser(description="Sync Git repository")
    parser.add_argument("repo_dir", help="Path to the Git repository")
    parser.add_argument("--dry-run", action="store_true", help="Perform a dry run without making changes")
    args = parser.parse_args()

    repo_dir = os.path.realpath(args.repo_dir)
    dry_run = args.dry_run

    if not os.path.isdir(repo_dir):
        handle_error(f"The provided path is not a directory: {repo_dir}")

    original_dir = os.getcwd()
    os.chdir(repo_dir)

    if not os.path.isdir(".git"):
        handle_error(f"The provided directory is not a git repository: {repo_dir}")

    remote = subprocess.run("git remote", shell=True, capture_output=True, text=True).stdout.strip()
    local = subprocess.run("git branch --show-current", shell=True, capture_output=True, text=True).stdout.strip()
    repo_name = subprocess.run("git remote -v | grep fetch | awk '{print $2}' | sed 's/.*\\/\\(.*\\)\\.git/\\1/'", shell=True, capture_output=True, text=True).stdout.strip()

    print_formatted(f"Syncing {BOLD}{repo_name}{RESET}")
    print_formatted(f"   {CYAN}{local}{RESET} -> {MAGENTA}{remote}{RESET}")

    if dry_run:
        print(f"{YELLOW}Performing dry run. No changes will be made.{RESET}")

    run_command("git fetch --all --prune", dry_run)

    if subprocess.run(f"git diff --quiet {local} '@{{u}}'", shell=True).returncode == 0:
        print("No changes to pull. Local branch is up to date.")
    else:
        if subprocess.run("git diff-index --quiet HEAD --", shell=True).returncode != 0:
            run_command("git stash", dry_run)

        if run_command("git merge --ff-only @{u}", dry_run).returncode != 0:
            print("Cannot fast-forward. Attempting to rebase...")
            if run_command(f"git pull --rebase {remote} {local}", dry_run).returncode != 0:
                handle_merge_pull_conflicts()

        if not dry_run and subprocess.run("git stash list", shell=True, capture_output=True, text=True).stdout:
            if run_command("git stash pop", dry_run).returncode != 0:
                print(f"{YELLOW}Conflicts detected when applying stashed changes.{RESET}")
                conflicted_files = subprocess.run("git diff --name-only --diff-filter=U", shell=True, capture_output=True, text=True).stdout.strip().split('\n')
                for file in conflicted_files:
                    handle_stash_conflict(file)
                run_command("git stash drop", dry_run)

    run_command("git status -s", dry_run)

    if subprocess.run("git status -s", shell=True, capture_output=True, text=True).stdout:
        if not dry_run:
            run_command("git add -A", dry_run)
            message = generate_commit_message(repo_dir)
            run_command(f'git commit -m "{message}"', dry_run)

            if run_command(f"git push {remote} {local}", dry_run).returncode != 0:
                print(f"{YELLOW}Push failed. Pulling latest changes and trying again...{RESET}")
                run_command(f"git pull --ff-only {remote} {local}", dry_run)
                run_command(f"git push {remote} {local}", dry_run)
        else:
            print_command("git add -A")
            print_command(f'git commit -m "...changes from {os.environ.get("USER")}@{os.uname().nodename}"')
            print_command(f"git push {remote} {local}")
    else:
        print("No local changes to commit and push.")

    run_command("git maintenance run", dry_run)

    print_glow(f"# Repository in **{repo_dir}** has been successfully synced.")

    if not dry_run:
        display_summary()

    os.chdir(original_dir)

if __name__ == "__main__":
    main()