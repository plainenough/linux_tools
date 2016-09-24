#!/bin/bash

#Generate a list of all of the pictures for the lock screen. 

PICT=$(for i in `ls /home/dwalton/background/`; do echo /home/dwalton/background/$i; done | sort -R | head -1);

#now to lock the screen. 

feh --bg-scale $PICT;
