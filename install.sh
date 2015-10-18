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
ln -s ~dwalton/linux_tools/.Xresources ~dwalton/.Xresources; chown dwalton: ~dwalton/.Xresources; stat ~dwalton/.Xresources && echo "Symlink for Xresources success" || echo "Symlink for Xresources has failed"; 
