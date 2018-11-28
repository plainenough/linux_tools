#!/bin/bash 
PICT=$(for i in `ls /home/dwalton/lockscreenimages/`; do echo /home/dwalton/lockscreenimages/$i; done | sort -R | head -1);
#now to lock the screen. 
i3lock -i $PICT -t;
