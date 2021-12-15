#-------------------------------
# Startup Files
#
# /etc/zsh/zshenv   ~/.zshenv
# /etc/zsh/zprofile ~/.zprofile
# /etc/zsh/zshrc    ~/.zshrc
# /etc/zsh/zlogin   ~/.zlogin
# /etc/zsh/zlogout  ~/.zlogout (v)
#
# Optional:
# ZDOTDIR=$HOME/.config/zsh (set in /etc/zsh/zshenv)
# compinit -d $XDG_CACHE_HOME/zsh/zcompdump
#-------------------------------

# Source Environment Variables
[[ -r $HOME/.profile ]] && source "$HOME/.profile"
