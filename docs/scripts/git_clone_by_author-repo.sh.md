# Clone GitHub repo by `author/repo`

---

**git_clone_by_author-repo.sh**: Clone a GitHub repo into `$GIT_REPOS/<author>/<repo>` with ssh/https/local

---

### Dependencies

- `bash`
- `git` (used via `git clone`)
- `coreutils` (`mkdir`)
- `cut` (from `coreutils`)

### Description

This script standardizes where your GitHub checkouts land on your Arch setup by enforcing a directory layout based on the GitHub owner:

- Default base directory: `$HOME/git`
- Override base directory: set `GIT_REPOS` (e.g. `GIT_REPOS=$HOME/dev`)
- Destination layout: `$GIT_REPOS/<developer>/<package>`

It accepts a single positional argument in the form `developer/package`, extracts both parts using `cut`, ensures `$GIT_REPOS/<developer>` exists, then runs `git clone` using one of three sources:

1. **HTTPS** (default): `https://github.com/developer/package.git`
2. **SSH** (`-s|--ssh`): `git@github.com:developer/package.git`
3. **Local path** (`-l|--local <path>`): clones from an existing local repo location

You can also append extra `git clone` flags using `-g <opt>` multiple times (e.g. `--depth 1`, `--recurse-submodules`), which are concatenated into the final clone command.

### Usage

```sh
git_clone_by_author-repo.sh developer/package
```

```sh
git_clone_by_author-repo.sh --ssh neovim/neovim
```

```sh
git_clone_by_author-repo.sh -l /mnt/repos/neovim neovim/neovim
```

```sh
GIT_REPOS="$HOME/git" git_clone_by_author-repo.sh -g --depth=1 -g --recurse-submodules burntsushi/ripgrep
```

Qtile keybinding friendly (non-interactive): run it directly in `lazy.spawn(...)`.

---

> [!TIP]
> Consider tightening argument parsing: `-g` currently accepts a single token, so options requiring a value with spaces won’t work (e.g. `-c key=value` without quoting). Using `getopts` (or supporting `--git-options "..."`) would match the help text and improve robustness. Also, validate `developer/package` more strictly (ensure both parts are non-empty) and quote/array the git command to avoid word-splitting issues (`GIT_CMD` as an array).