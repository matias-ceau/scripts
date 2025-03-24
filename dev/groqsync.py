import os
import subprocess


def run_command(command):
    subprocess.run(command, shell=True, check=True)


def handle_error(message):
    print(f"Error: {message}")
    exit(1)


def handle_stash_conflict(file):
    print(f"Conflict detected when applying stashed changes in file: {file}")
    print("Options:")
    print("  [r] - Use remote version (discard local changes)")
    print("  [l] - Keep local version")
    print("  [m] - Manually resolve conflict")
    choice = input("Choose an option [r/l/m]: ")

    if choice.lower() == "r":
        run_command(f'git checkout --theirs -- "{file}"')
        run_command(f'git add "{file}"')
        print(f"Remote version of {file} has been applied.")
    elif choice.lower() == "l":
        run_command(f'git checkout --ours -- "{file}"')
        run_command(f'git add "{file}"')
        print(f"Local version of {file} has been kept.")
    elif choice.lower() == "m":
        editor = os.environ.get("EDITOR", "nvim")
        subprocess.run(f'{editor} "{file}"', shell=True)
        run_command(f'git add "{file}"')
        print(f"Manual edits for {file} have been staged.")
    else:
        print("Invalid option. Keeping conflict markers for manual resolution later.")


def display_summary():
    print(
        f"                {subprocess.run('date +\"%Y-%m-%d %H:%M:%S %z\"', shell=True, capture_output=True).stdout.decode().strip()}"
    )
    print(
        f"Current commit: {subprocess.run('git show -s --format=%ci HEAD', shell=True, capture_output=True).stdout.decode().strip()}"
    )
    print(
        f"  Previous one: {subprocess.run('git show -s --format=%ci HEAD^', shell=True, capture_output=True).stdout.decode().strip()}"
    )
    print("Last changes")
    subprocess.run("git diff --stat HEAD^", shell=True)


def main():
    repo_dir = ""
    original_dir = ""

    for arg in os.sys.argv[1:]:
        if arg in ["-h", "--help"]:
            print("help")
            exit(0)
        else:
            if not repo_dir:
                repo_dir = os.path.realpath(arg)
            else:
                print("help")
                exit(1)

    if not repo_dir:
        print("help")
        handle_error("No path provided")

    if not os.path.isdir(repo_dir):
        handle_error(f"The provided path is not a directory: {repo_dir}")

    original_dir = os.getcwd()
    os.chdir(repo_dir)

    if not os.path.exists(".git"):
        handle_error(f"The provided directory is not a git repository: {repo_dir}")

    remote = (
        subprocess.run("git remote", shell=True, capture_output=True)
        .stdout.decode()
        .strip()
    )
    local = (
        subprocess.run("git branch --show-current", shell=True, capture_output=True)
        .stdout.decode()
        .strip()
    )
    repo_name = (
        subprocess.run(
            r"git remote -v | grep fetch | awk '{print $2}' | sed 's/.*\/\\(.*\\)\\.git/\\1/'",
            shell=True,
            capture_output=True,
        )
        .stdout.decode()
        .strip()
    )

    print(f"Syncing {repo_name}: {local} -> {remote}")

    subprocess.run("git fetch --all --prune", shell=True, check=True)

    if subprocess.run("git diff --quiet HEAD @{u}", shell=True).returncode == 0:
        print("No changes to pull. Local branch is up to date.")
    else:
        if (
            not subprocess.run("git diff-index --quiet HEAD --", shell=True).returncode
            == 0
        ):
            subprocess.run("git stash", shell=True, check=True)

        if not subprocess.run("git merge --ff-only @{u}", shell=True).returncode == 0:
            print("Cannot fast-forward. Attempting to rebase...")
            if (
                not subprocess.run(
                    f"git pull --rebase {remote} {local}", shell=True
                ).returncode
                == 0
            ):
                print("Conflicts detected during merge. Here are your options:")
                print("  [e] - Open your default editor to resolve conflicts manually")
                print("  (a) - Abort the merge and return to the previous state")
                print("  (s) - Skip this commit and continue with the next one")
                choice = input("Choose an option [e/a/s]: ")

                if choice.lower() == "a":
                    subprocess.run("git merge --abort", shell=True)
                    print("Merge aborted. Repository is back to its previous state.")
                elif choice.lower() == "s":
                    subprocess.run("git reset --hard", shell=True)
                    print("Skipped conflicting commit. Continuing sync...")
                else:
                    subprocess.run("git status", shell=True)
                    print("Opening editor to resolve conflicts...")
                    editor = os.environ.get("EDITOR", "nvim")
                    subprocess.run(
                        f"{editor} $(git diff --name-only --diff-filter=U)", shell=True
                    )
                    subprocess.run("git add .", shell=True)
                    subprocess.run("git commit", shell=True)

        if not subprocess.run("git stash list", shell=True).returncode == 0:
            if not subprocess.run("git stash pop", shell=True).returncode == 0:
                print("Conflicts detected when applying stashed changes")
                conflicted_files = (
                    subprocess.run(
                        "git diff --name-only --diff-filter=U",
                        shell=True,
                        capture_output=True,
                    )
                    .stdout.decode()
                    .strip()
                )
                for file in conflicted_files.split():
                    handle_stash_conflict(file)
                subprocess.run("git stash drop", shell=True)

    if not subprocess.run("git status -s", shell=True).returncode == 0:
        subprocess.run("git add -A", shell=True)
        message = (
            subprocess.run(r"git status -s | wc -l", shell=True, capture_output=True)
            .stdout.decode()
            .strip()
            + " change(s) from "
            + os.environ.get("USER")
            + "@"
            + os.environ.get("HOSTNAME")
        )
        subprocess.run(f'git commit -m "{message}"', shell=True)

        if not subprocess.run(f"git push {remote} {local}", shell=True).returncode == 0:
            print("Push failed. Pulling latest changes and trying again...")
            subprocess.run(
                f"git pull --ff-only {remote} {local}", shell=True, check=True
            )
            subprocess.run(f"git push {remote} {local}", shell=True, check=True)
    else:
        print("No local changes to commit and push.")

    print("Repository in", repo_dir, "has been successfully synced.")
    display_summary()

    os.chdir(original_dir)


if __name__ == "__main__":
    main()

