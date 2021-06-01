#!/bin/bash

####################################################################
## This script is to install all of the stuff that I have put on ###
## my repo to my current machines. #################################
####################################################################
echo "Install all of my packages needed for stuff"
apt-get install -yqq \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common \
    build-essential \
    openvpn \
    git \
    i3lock-fancy \
    vim
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
apt-get update -qq
apt-get install -yqq docker-ce
curl -L https://github.com/docker/compose/releases/download/1.25.5/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
#load script 
echo "Installing Load script";
cp ~dwalton/linux_tools/load /usr/local/bin/load && chown root: /usr/local/bin/load && chmod 755 /usr/local/bin/load && echo "Success" || echo "failed";
#symlink settings
echo "Creating some symlinks";
#Symlink xresources
echo "Creating symlink for .Xresources";
rm -f ~dwalton/.Xresources;
ln -s ~dwalton/linux_tools/.Xresources ~dwalton/.Xresources; chown dwalton: ~dwalton/.Xresources; stat ~dwalton/.Xresources \
&& echo "Symlink for Xresources success" || echo "Symlink for Xresources has failed"; 
#Symlink i3config. 
echo "Creating symlink to i3 config";
mkdir ~dwalton/.i3; ln -s ~dwalton/linux_tools/config ~dwalton/.i3/config; chown dwalton: ~dwalton/.i3 ~dwalton/.i3/config; stat ~dwalton/.i3 \
&& echo ".i3 directory exists" && stat ~dwalton/.i3/config && echo ".i3 config symlink is created" || echo "Something went \
terribly wrong";
#Symlink for vimrc
echo "Creating Symlink for vimrc";
ln -s ~dwalton/linux_tools/.vimrc ~dwalton/.vimrc; chown dwalton: ~dwalton/.vimrc; stat ~dwalton/.vimrc && echo "Vimrc Symlink has been created"\
|| echo "Vimrc symlink failed";
#Symlink for bashrc
echo "Creating Symlink for bashrc";
rm -f ~dwalton/.bashrc;
ln -s ~dwalton/linux_tools/.bashrc ~dwalton/.bashrc; chown dwalton: ~dwalton/.bashrc; stat ~dwalton/.bashrc && echo "Bashrc Symlink has been created"\
|| echo "Bashrc symlink failed.";
