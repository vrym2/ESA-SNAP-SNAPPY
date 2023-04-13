#!/bin/bash

# echo "Installing necessary GDAL libraries"
# sudo add-apt-repository ppa:ubuntugis/ppa && sudo apt-get update
# sudo apt-get install gdal-bin
# sudo apt-get install libgdal-dev

echo "Adding GDAL compilets path to .bashrc"
while IFS= read -r line || [[ -n "$line" ]]; do
    sed -i 's/[ ]*$/ /' src/installs/test.txt
    echo "$line" >> /.bashrc
done < src/installs/gdal_bashrc.txt