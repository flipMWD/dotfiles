#!/bin/sh

cmus-remote -C clear
cmus-remote -C "add /media/hdd/music"
cmus-remote -C "update-cache -f"
exit 0
