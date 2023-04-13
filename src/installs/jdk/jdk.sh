#!/bin/bash

# Inspired from here: https://javahelps.com/install-oracle-jdk-8-on-linux
# Install the following packages
echo "Installing libc6-i386 package"
sudo apt-get install libc6-i386

# Downloading JDK file
opt_jdk=~/opt/jdk1.8.0_351
tmp_folder=~/apps/tmp

if [ -d $opt_jdk ]; then
    echo "$opt_jdk exists!"
else
    echo "$opt_jdk does not exist"
    echo "Download java source file from $opt_jdk"
    if [ -d "$tmp_folder" ]; then
        echo "Download the tar file in ~/apps/tmp/"
    else
        echo "Creating the folder ~/apps/tmp"
        mkdir apps/tmp/
    fi
fi

# Download from the Oracle distribution archive
# https://www.oracle.com/uk/java/technologies/javase/javase8u211-later-archive-downloads.html
# Direct download is not possible as you need to accept the license agreements

# installing into /opt/jdk-xx-xx folder 
jdk8_file=~/apps/tmp/jdk-8u351-linux-x64.tar.gz
if [ -f $jdk8_file ]; then
    echo "$jdk8_file file exists"
    if [ -d "$opt_jdk" ]; then
        echo "$opt_jdk folder exists!"
    else
        sudo tar -zxvf $jdk8_file --directory /opt/
    fi
else
    link=https://www.oracle.com/uk/java/technologies/javase/javase8u211-later-archive-downloads.html
    echo "Download from the Oracle distribution archive"
    echo "Download the appropriate JDK8 file from the below website"
    echo "Direct download is not possible as you need to accept the license agreements"
    echo "$link"
    echo "if the system is Ubuntu x86_64, the version to look for is: jdk-8u351-linux-x64.tar.gz"
fi

# Moving files from /opt/jdk-xx-x to /usr/lib/jvm
jvm_usr_folder=~/usr/lib/jvm

if [ -d "$jvm_usr_folder" ]; then
    echo "$jvm_usr_folder exists"
else
    sudo mkdir -p $jvm_usr_folder
    sudo cp -r $opt_jdk $jvm_usr_folder
fi

# Adding JAVA PATH to .profile
profile=~/.profile
if [ -f "$profile" ]; then
    # Adding JAVA PATH to .profile
    echo "Adding JAVA path to .profile"
    while IFS= read -r line || [[ -n "$line" ]]; do
        sed -i 's/[ ]*$/ /' "$profile"
        echo "$line" >> "$profile"
    done < src/installs/jdk/jdk_profile.txt
    
    echo "sourcing .bashrc file"
    brc
else
    echo "$profile does not exist"
    echo "create $profile file"
fi

# Adding JAVA PATH to .bashrc
bashrc=~/.bashrc
if [ -f "$bashrc" ]; then
    # Adding JAVA PATH to bashrc
    echo "Adding JAVA PATH to .bashrc "
    while IFS= read -r line || [[ -n "$line" ]]; do
        sed -i 's/[ ]*$/ /' "$bashrc"
        echo "$line" >> "$bashrc"
    done < src/installs/jdk/jdk_bashrc.txt
    echo "sourcing .profile file"
    prof
else
    echo "$bashrc does not exist"
    echo "create $bashrc file"
fi