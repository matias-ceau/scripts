#!/usr/bin/env python3

import os
import subprocess
import sys
import datetime
import argparse

def run_command(command):
    print(f"command: {command}")
    result = subprocess.run(command, shell=True, text=True, capture_output=True)
    print(result.stdout)
    if result.returncode != 0:
        print(f"Error: {result.stderr}", file=sys.stderr)
    return result

def handle_error(message):
    print(f"Error: {message}", file=sys.stderr)
    sys.exit(1)

def generate_commit_message():
    status = run_command("git status -s")
    changes = len(status.stdout.splitlines())
    return f"{changes} change(s) from {os.environ.get('USER')}@{os.environ.get('HOSTNAME')}"

def handle_merge_pull_conflicts():
    print("Conflicts detected during merge. Here are your options:")
    print("[e] - Open your default editor to resolve conflicts manually")
    print("(a) - Abort the merge and return to the previous state")
    print("(s) - Skip this commit and continue with the next one")
    
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
        conflicted_files = run_command("git diff --name-only --diff-filter=U").stdout.splitlines()
        for file in conflicted_files:
            subprocess.run([editor, file])
        run_command("git add .")
        run_command("git commit")

def handle_stash_conflict(file):
    print(f"Conflict detected when applying stashed changes in file: {file}")
    print("Options:")
    print("  [r] - Use remote version (discard local changes)")
    print("  [l] - Keep local version")
    print("  [m] - Manually resolve conflict")
    
    choice = input("Choose an option [r/l/m]: ").lower()
    if choice == 'r':
        run_command(f'git checkout --theirs -- "{file}"')
        run_command(f'git add "{file}"')
        print(f"Remote version of {file} has been applied.")
    elif choice == 'l':
        run_command(f'git checkout --ours -- "{file}"')
        run_command(f'git add "{file}"')
        print(f"Local version of {file} has been kept.")
    elif choice == 'm':
        editor = os.environ.get('EDITOR', 'nvim')
        subprocess.run([editor, file])
        run_command(f'git add "{file}"')
        print(f"Manual edits for {file} have been staged.")
    else:
        print("Invalid option. Keeping conflict markers for manual resolution later.")

def display_summary():
    print(f"                {datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S %z')}")
    current_commit = run_command("git show -s --format=%ci HEAD").stdout.strip()
    previous_commit = run_command("git show -s --format=%ci HEAD^").stdout.strip()
    print(f"Current commit: {current_commit}")
    print(f"  Previous one: {previous_commit}")
    print("Last changes")
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
    repo_name = run_command("git remote -v | grep fetch | awk '{print $2}' | sed 's/.*\\(.*\\)\\.git/\\1/'").stdout.strip()

    print(f"Syncing {repo_name}: {local} -> {remote}")

    print("\n        2. FETCHING/PULLING\n")

    run_command("git fetch --all --prune")

    if run_command("git diff --quiet {local} @{u}").returncode == 0:
        print("No changes to pull. Local branch is up to date.")
    else:
        if run_command("git diff-index --quiet HEAD --").returncode != 0:
            run_command("git stash")

        if run_command(f"git merge --ff-only @{{u}}").returncode != 0:
            print("Cannot fast-forward. Attempting to rebase...")
            if run_command(f"git pull --rebase {remote} {local}").returncode != 0:
                handle_merge_pull_conflicts()

        if run_command("git stash list").stdout:
            if run_command("git stash pop").returncode != 0:
                print("Conflicts detected when applying stashed changes")
                conflicted_files = run_command("git diff --name-only --diff-filter=U").stdout.splitlines()
                for file in conflicted_files:
                    handle_stash_conflict(file)
                run_command("git stash drop")

    print("\n        3. CHECKING STATUS - ADD AND COMMIT IF NEEDED\n")

    run_command("git status -s")

    if run_command("git status -s").stdout:
        run_command("git add -A")
        message = generate_commit_message()
        run_command(f'git commit -m "{message}"')

        if run_command(f"git push {remote} {local}").returncode != 0:
            print("Push failed. Pulling latest changes and trying again...")
            run_command(f"git pull --ff-only {remote} {local}")
            run_command(f"git push {remote} {local}")
    else:
        print("No local changes to commit and push.")

    print("\n        4. QUICK SUMMARY\n")
    print(f"Repository in {repo_dir} has been successfully synced.")
    display_summary()

    os.chdir(original_dir)

if __name__ == "__main__":
    main()