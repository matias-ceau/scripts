#!/usr/bin/bash

_chosen="$(pass ssh_cmds | fzf)"
[[ -n "$_chosen" ]] && ssh "$_chosen"


