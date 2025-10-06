#!/bin/bash

#INFO:#@CLI@=2024-07= "get git repos"

usage() {
    echo "Usage: $0 [-s | -l <path> | --git-options <opts>] developer/package"
    echo "  -s, --ssh     Use SSH for cloning (git@github.com:developer/package.git)"
    echo "  -l, --local   Use local repository with the specified path"
    echo "  -g <opt>     Run git clone with additional option (can be provided multiple times)"
    exit 1
}

if [ $# -lt 1 ]; then
    usage
fi

GIT_REPOS="${GIT_REPOS:-"$HOME/git"}"
SSH=''
LOCAL=''
LOCAL_PATH=""
GIT_CMD="git clone"

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
        -g)
            shift
            GIT_CMD="$GIT_CMD ${1}"
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
    $GIT_CMD "git@github.com:$REPO.git" "$TARGET_DIR/$PACKAGE"
elif [[ "$LOCAL" ]]; then
    echo "Using local repo"
    $GIT_CMD "$LOCAL_PATH" "$TARGET_DIR/$PACKAGE"
else
    echo "Using https"
    $GIT_CMD "https://github.com/$REPO.git" "$TARGET_DIR/$PACKAGE"
fi
