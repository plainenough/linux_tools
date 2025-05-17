#!/bin/bash

####################################################################
####################################################################
# This script will install/configure everything needed to setup my #
# Workstation on Ubuntu 20.04 LTS.                                 #
####################################################################
####################################################################

#Create the glorious tmp dir that I throw everything in.
mkdir ~/tmp/
CO='\033[0m'
CY='\033[1;33m'

echo -e "$CY Install all of my packages needed for stuff $CO"
sudo apt-get update
sudo apt-get upgrade -yqq
sudo apt-get install -yqq \
    apt-transport-https \
    build-essential \
    ca-certificates \
    curl \
    git \
    gnupg-agent \
    i3 \
    i3lock-fancy \
    openvpn \
    software-properties-common \
    vim \
    xautolock

# Begin installing docker. This is a must.
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

# Set default editor to vim
sudo ln -sf /usr/bin/vim.basic /etc/alternatives/editor 

sudo apt-get update -qq
sudo apt-get install -yqq docker-ce

# Update user groups to include docker
MYUSER=$USER
sudo usermod -a -G docker $MYUSER

# Begin installing docker-compose
curl -L https://github.com/docker/compose/releases/download/1.25.5/docker-compose-`uname -s`-`uname -m` -o ~/tmp/docker-compose && \
sudo cp ~/tmp/docker-compose /usr/local/bin/docker-compose \
&& sudo chmod +x /usr/local/bin/docker-compose

# Install load script
echo -e "$CY Installing Load script $CO"
sudo cp ~/linux_tools/load /usr/local/bin/load \
&& sudo chown root: /usr/local/bin/load \
&& sudo chmod 755 /usr/local/bin/load \
&& echo "Success" || echo "failed";

# Install AWS CLI v2
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
rm -rf ./aws awscliv2.zip

# Install kubectl
curl -LO https://dl.k8s.io/release/v1.23.6/bin/linux/amd64/kubectl
chmod +x kubectl
sudo mv kubectl /usr/local/bin/kubectl

# Install symlink settings
echo -e "$CY Creating some symlinks $CO"

# Symlink xresources
echo -e "\e[31 Creating symlink for .Xresources \e[0m";
rm -f ~/.Xresources;
ln -s ~/linux_tools/.Xresources ~/.Xresources;
sudo chown $MYUSER: ~/.Xresources;
stat ~/.Xresources \
&& echo "Symlink for Xresources success" || echo "Symlink for Xresources has failed"

# Symlink i3config.
echo -e "$CY Creating symlink to i3 config $CO"
mkdir ~/.config/i3;
rm -rf ~/.config/i3/config
ln -s ~/linux_tools/config ~/.config/i3/config;
sudo chown $MYUSER: ~/.i3 ~/.i3/config;
stat ~/.config/i3 \
&& echo ".i3 directory exists" \
&& stat ~/.config/i3/config \
&& echo ".i3 config symlink is created" \
|| echo "Something went terribly wrong"

# Symlink for vimrc
echo -e "$CY Creating Symlink for vimrc $CO"
ln -s ~/linux_tools/.vimrc ~/.vimrc;
sudo chown $MYUSER: ~/.vimrc;
stat ~/.vimrc && echo "Vimrc Symlink has been created"\
|| echo "Vimrc symlink failed"

# Install crontab
echo -e "$CY Installing user provided crontab $CO"
crontab crontab &&  echo "Succesfully installed crontab!" \
|| echo "Crontab install failed."

# Symlink for bashrc
echo -e "$CY Creating Symlink for bashrc $CO"
rm -f ~/.bashrc;
ln -s ~/linux_tools/.bashrc ~/.bashrc;
sudo chown $MYUSER: ~/.bashrc;
stat ~/.bashrc \
&& echo "Bashrc Symlink has been created" \
|| echo "Bashrc symlink failed."

# This may warrant its own config eventually
git config --global push.autoSetupRemote true
git config --global push.default current
