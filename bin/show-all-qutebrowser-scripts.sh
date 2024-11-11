#!/usr/bin/bash

pacman -Ql qutebrowser | tail -n 37 | rg -v '/$' | sed 's/^.*qutebrowser //' | xargs bat
