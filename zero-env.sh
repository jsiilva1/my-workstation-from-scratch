#!/bin/bash

# Apt useless files
echo "Removing apt useless files"
sudo rm /var/lib/dpkg/lock-frontend ; sudo rm /var/cache/apt/archives/lock ;

echo "Updating list of repos"
sudo apt update && 

# Usefull packages from deb repo
echo "Install usefull packages of deb repo"
sudo apt install python3 python3-pip git build-essential ubuntu-restricted-extras libssl-dev -y &&

# Snap Packages
echo "Installing some snap packages"
sudo snap install code --classic &&  
sudo snap install insomnia &&  

# Download external softwares
echo "Downloading some .deb apps"
cd ~/Downloads/ && 
wget -c https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb &&

# Setting up node js env
echo "Setting up nodejs env"
sudo curl -sL https://deb.nodesource.com/setup_12.x -o nodesource_setup.sh &&
sudo bash nodesource_setup.sh &&
sudo apt install nodejs &&

# Install .deb packages
echo "Installing downloaded apps"
cd ~/Downloads/ &&
  sudo apt update && 
  dpkg -i *.deb &&

# System updates
echo "Updating core system"
sudo apt update && 
sudo apt dist-upgrade -y && 
sudo apt autoclean -y && 
sudo apt autoremove -y &&

echo "DONE!"