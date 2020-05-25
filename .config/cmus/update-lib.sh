#!/bin/sh

cmus-remote -C clear
cmus-remote -C "add /run/media/$USER/Data/music"
cmus-remote -C "update-cache -f"
exit 0
