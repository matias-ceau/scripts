#!/bin/bash

#INFO:#@CLI@=2024-07= "get git repos"

usage() {
    echo "Usage: $0 [-s | -l <path>] developer/package"
    echo "  -s, --ssh       Use SSH for cloning (git@github.com:developer/package.git)"
    echo "  -l, --local     Use local repository with the specified path"
    exit 1
}

if [ $# -lt 1 ]; then
    usage
fi

GIT_REPOS="${GIT_REPOS:-"$HOME/git"}"
SSH=false
LOCAL=false
LOCAL_PATH=""

while [[ "$1" =~ ^- && ! "$1" == "--" ]]; do
    case $1 in
    -s | --ssh)
        SSH=true
        ;;
    -l | --local)
        LOCAL=true
        shift
        LOCAL_PATH=$1
        ;;
    *)
        usage
        ;;
    esac
    shift
done

if [ "$SSH" = true ] && [ "$LOCAL" = true ]; then
    usage
fi

if [ "$#" -ne 1 ]; then
    usage
fi

REPO=$1
DEVELOPER="$(echo "$REPO" | cut -d'/' -f1)"
PACKAGE="$(echo "$REPO" | cut -d'/' -f2)"

TARGET_DIR="$GIT_REPOS/$DEVELOPER"

mkdir -p "$TARGET_DIR"

if [ "$SSH" = true ]; then
    git clone "git@github.com:$REPO.git" "$TARGET_DIR/$PACKAGE"
elif [ "$LOCAL" = true ]; then
    git clone "$LOCAL_PATH" "$TARGET_DIR/$PACKAGE"
else
    git clone "https://github.com/$REPO.git" "$TARGET_DIR/$PACKAGE"
fi
