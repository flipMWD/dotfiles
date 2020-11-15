#!/bin/sh

#------------------------------
# /etc/X11/xinit/xinitrc
#------------------------------

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
    for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

#------------------------------
# Custom Settings
#------------------------------

# Disable beeping on Backspace and moving past limits of file
xset -b

# Load Profile settings
if [ -f ~/.profile ]; then
    source ~/.profile
fi

# Temporary statusbar for DWM
while true; do
    xsetroot -name " \
$(sensors | grep 'fan1' | awk '{ printf "  %d ", $2 }') \
$(free -m | awk 'NR == 2 { printf " %.1fG ", $3/1024 }') \
$(date +" %a, %d %b   %H:%M ")"
    sleep 5s
done &

# Disable shadow effects, run as background process
picom -CGb

exec dwm
