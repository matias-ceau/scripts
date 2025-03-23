#!/usr/bin/bash

_chosen="$(pass ssh_cmds | fzf)"
[[ -n "$_chosen" ]] && bash -l -c "$_chosen"


