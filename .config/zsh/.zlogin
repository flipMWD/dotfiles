#-------------------------------
# ~/.config/zsh/.zlogin
#-------------------------------

# Autostart DWM on Login
if [[ $(tty) = '/dev/tty1' ]]; then
    pgrep -x dwm >/dev/null 2>&1 || startx
fi

