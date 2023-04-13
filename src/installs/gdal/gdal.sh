#!/bin/bash

echo "Installing necessary GDAL libraries"
sudo add-apt-repository ppa:ubuntugis/ppa && sudo apt-get update
sudo apt-get install gdal-bin
sudo apt-get install libgdal-dev

bashrc="$HOME/.bashrc"
if [ -f "$bashrc" ]; then
    # Adding GDAL compilers to .bashrc
    echo "Adding GDAL compilets path to .bashrc"
    while IFS= read -r line || [[ -n "$line" ]]; do
        sed -i 's/[ ]*$/ /' "$bashrc"
        echo "$line" >> "$bashrc"
    done < src/installs/gdal/gdal_bashrc.txt
    echo "sourcing .bashrc file"
    brc
else
    echo "$bashrc does not exist"
    echo "create $bashrc file"
fi