#!/usr/bin/bash

fd -td -H '\.git$' $GIT_REPOS | sed '/matias-ceau/d; s#/\.git.##' | while read -r line; do
    echo -e "\n\e[33m$line\e[0m"
    cd "$line" && git pull --verbose || echo -e "\e[31mFailed for $line\e[0m"
    git status -v && sleep 1
done
