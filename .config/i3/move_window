#!/bin/sh

# Screen Width, Height
sw=1920
sh=1080

# Margin/Border
mb=10

# Window Size, Width, Height
ws=$(xdotool getactivewindow getwindowgeometry | grep Geometry | cut -d ' ' -f4)
ww=$(echo $ws | cut -d 'x' -f1)
wh=$(echo $ws | cut -d 'x' -f2)

# Position
x=$(expr $sw - $ww - $mb)
y=$(expr $sh - $wh - $mb)

exec i3-msg -q floating enable, move position $x $y, mode "default"
