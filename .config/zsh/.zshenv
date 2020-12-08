#-------------------------------
# Startup Files
#
# /etc/zsh/zshenv   ~/.zshenv
# /etc/zsh/zprofile ~/.zprofile
# /etc/zsh/zshrc    ~/.zshrc
# /etc/zsh/zlogin   ~/.zlogin
# /etc/zsh/zlogout  ~/.zlogout (v)
#
# ZDOTDIR=$HOME/.config/zsh
# compinit -d $XDG_CACHE_HOME/zsh/zcompdump
#-------------------------------

# Source Environment Variables
[[ -r $HOME/.profile ]] && source "$HOME/.profile"

