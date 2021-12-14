#-------------------------------
# ~/.bash_profile
#-------------------------------

# Source Environment Variables and Interactive Bash functions
[[ -r $HOME/.profile ]] && source "$HOME/.profile"
[[ -r $HOME/.bashrc  ]] && source "$HOME/.bashrc"

# Autostart DWM on Login
if [[ $(tty) = '/dev/tty1' ]]; then
    pgrep -x dwm >/dev/null 2>&1 ||
        startx "${XDG_CONFIG_HOME:-$HOME/.config}/X11/xinitrc"
fi
