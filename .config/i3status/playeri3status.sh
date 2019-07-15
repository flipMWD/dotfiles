#!/bin/sh
# Script to show cmus song on i3status-i3bar

i3status | while :
do
	read line
	# search for line with string, cut the field 3 from 2nd space to the end
	artist=$(cmus-remote -Q | grep ' artist ' | cut -d ' ' -f3-)
	song=$(cmus-remote -Q | grep title | cut -d ' ' -f3-)
	# print cmus current song then the i3status line or exit
	echo "  $artist - $song  |  $line" || exit 1
done
