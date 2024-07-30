#! /bin/bash

#INFO:#=2024-07= "A script that finds scripts without inline docs"

rg '#INFO:#' --files-without-match "$SCRIPTS" | rg -v '/docs/|/config/|\.csv|\.md'
