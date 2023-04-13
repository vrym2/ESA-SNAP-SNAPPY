#!/bin/bash

# Downloading miniconda bash script
echo "creating a directory for downloads"
downloads="$HOME/apps/tmp/downloads"
sudo mkdir -p "$downloads"
echo "Downloading miniconda installer"
echo "Make sure the system is 64 bit Ubuntu"
echo "Installing miniconda with *Python3.9"
sleep 5s
mkdir https://repo.anaconda.com/miniconda/Miniconda3-py39_23.1.0-1-Linux-x86_64.sh -P "$downloads"

# Installing miniconda
echo "Installing Miniconda"
miniconda_shell="$downloads/Miniconda3-py39_23.1.0-1-Linux-x86_64.sh"
sudo chmod +x "$miniconda_shell"
bash "$miniconda_shell"
conda init
echo "Open a new terminal for the completion"

# Installing mamba
echo "Installing mamba in the base conda environment"
conda install mamba -n base -c conda-forge

# Create mamba env
echo "Now, conda commands can be replaced with mamba"
echo "Add channels to the conda environemnt"
conda config --show channels
echo "Adding conda-forge channels"
conda config --add channels conda-forge
echo "example mamba install command"
echo "mamba install -c conda-forge <package>"



