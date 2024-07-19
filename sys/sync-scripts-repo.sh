#!/usr/bin/bash

#DOC#@UTILS@=2024-07= "sync scripts repository"

ORIGINAL_DIR=$(pwd)
SCRIPT_DIR="$HOME/.scripts"

echo -e "\e[1mMoving to $SCRIPT_DIR\e[0m"
cd $SCRIPT_DIR

REMOTE="$(git remote)"
LOCAL="$(git branch --show-current)"
echo "Pulling from $(git remote -v | sed -n '1p')"
echo "Local branches are $(git branch -l --color=always)" 

echo -e "\e[1m$ git pull $REMOTE $LOCAL\e[0m"
git pull "$REMOTE" "$LOCAL"

echo -e "\e[1m$ git status\e[0m"
git status

echo -e "\e[1m$ git add -A\e[0m"
git add -A

if [ -z "$1" ]; then
    echo -e "No commit message provided\n    [D]efault?\n    [i]nteractive?"

    read -r user_input
    user_input=${user_input:-d}
    if [ "$user_input" == "i" ]; then
        echo -e "\e[1m$ Running 'git commit --interactive'\e[0m"
        git commit --interactive
    else
        MESSAGE="$(git status -s | wc -l) changes from $USER@$HOSTNAME" 
        git commit -m "$MESSAGE"
    fi
else
    echo -e "\e[1m$ git commit -m \"$1\"\e[0m"
    git commit -m "$1"
fi

echo -e "\e[1m$ git push $REMOTE $LOCAL\e[0m"
git push "$REMOTE" "$LOCAL"

cd "$ORIGINAL_DIR"
