#!/bin/bash

####################################################################
## This script is to install all of the stuff that I have put on ###
## my repo to my current machines. #################################
####################################################################

#load script 
echo "Installing Load script";
cp ~dwalton/linux_tools/load /bin/load && chown root: /bin/load && chmod 755 /bin/load && echo "Success" || echo "failed";

#symlink settings
echo "Creating some symlinks";
#Symlink xresources
echo "Creating symlink for .Xresources"; 
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
ln -s ~dwalton/linux_tools/.bashrc ~dwalton/.bashrc; chown dwalton: ~dwalton/.bashrc; stat ~dwalton/.bashrc && echo "Bashrc Symlink has been created"\
|| echo "Bashrc failed.";
#Symlink for .xinitrc
#echo "Creating Symlink for xinitrc";
#ln -s ~dwalton/linux_tools/.xinitrc ~dwalton/.xinitrc; chown dwalton: ~dwalton/.xinitrc; stat ~dwalton/.xinitrc && echo "xinitrc Symlink has been created"\
#|| echo "xinitrc failed.";
