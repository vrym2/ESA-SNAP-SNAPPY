#!/bin/bash

# Adding source command to the alias
bashrc="$HOME/.bashrc"
if [ -f "$bashrc" ]; then
    sed -i 's/[ ]*$/ /' "$bashrc"
    echo "# source .bashrc alias"
    echo "alias brc='source ~/.bashrc'" >> "$bashrc"
else
    echo ".bashrc not found, create one"
fi