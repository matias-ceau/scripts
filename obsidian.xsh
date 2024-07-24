#!/usr/bin/env xonsh

#DOC#@RUN@ "Open any obsidian vault"

#TODO# vault search

# Vault names
vaults = [i for i in $(ls $HOME/PKM).split() if $(file -b $HOME/PKM/@(i)) == 'directory']  # Replace with your actual vault names

# Use dmenu to get the selected vault name
#import subprocess

selected_vault = $(echo @('\n'.join(vaults)) | fzfmenu.sh --preview='eza -T --sort=modified --color=always $HOME/PKM/{}') 

#dmenu_process = subprocess.Popen(
#    ["dmenu", "-i", "-l", "20", "-p", "Select a vault:"],
#    stdin=subprocess.PIPE,
#    stdout=subprocess.PIPE,
#    text=True,  # Ensure text mode for input/output
#)
#dmenu_input = "\n".join(vaults)  # Create the input for dmenu
#selected_vault, _ = dmenu_process.communicate(dmenu_input)  # Get the output from dmenu
#selected_vault = selected_vault.strip()  # Remove any trailing newlines

# Open the selected vault with error handling and feedback
if selected_vault:
    obsidian @(f"obsidian://open?vault={selected_vault}")
else:
    notify-send "Obsidian open script" "No vaults selected"
