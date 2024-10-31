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
SSH=''
LOCAL=''
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

if [[ "$SSH"  &&  "$LOCAL" ]]; then
    usage
fi

if [ "$#" -ne 1 ]; then
    usage
fi

REPO="$1"
DEVELOPER="$(echo "$REPO" | cut -d'/' -f1)"
PACKAGE="$(echo "$REPO" | cut -d'/' -f2)"

TARGET_DIR="$GIT_REPOS/$DEVELOPER"

mkdir -p "$TARGET_DIR"

if [[ "$SSH" ]]; then
    echo "Using SSH"
    git clone "git@github.com:$REPO.git" "$TARGET_DIR/$PACKAGE"
elif [[ "$LOCAL" ]]; then
    echo "Using local repo"
    git clone "$LOCAL_PATH" "$TARGET_DIR/$PACKAGE"
else
    echo "Using https"
    git clone "https://github.com/$REPO.git" "$TARGET_DIR/$PACKAGE"
fi
