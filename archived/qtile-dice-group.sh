#!/bin/bash

current_group=$(qtile cmd-obj -o group -f info | rg "'name': '\d'" | tr -cd '0-9')
dice_complement=$((7 - current_group))
qtile cmd-obj -o group "$dice_complement" -f toscreen
