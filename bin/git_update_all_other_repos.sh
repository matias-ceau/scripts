#!/usr/bin/bash

fd -td -H '\.git$' $GIT_REPOS --exact-depth=3 | while read line; do
    repo="$(dirname "$line")"
    if git -C "$repo" remote -v | rg fetch | rg -q 'https'; then
        echo "$repo" |
        sed -E "s#$GIT_REPOS/(.+)/(.+)#\n        [\2] \#\1/\2#" |
        bat -ppltoml --theme=Monokai\ Extended --highlight-line 2
        git -C "$repo" pull || echo -e "\e[41mFailed to pull:\e[0m\e[31m $repo\e[0m"
    fi
done
