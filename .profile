#-----------------------------
# ~/.profile
#-----------------------------

# XDG_CONFIG_HOME
export DOCKER_CONFIG="$XDG_CONFIG_HOME"/docker
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME"/npm/npmrc

# Terminal
export TERM=rxvt-unicode-256color
export EDITOR=/usr/bin/vim
export FZF_DEFAULT_COMMAND="find ."
export FZF_DEFAULT_OPTS="--color=16,gutter:0,fg+:15,bg+:-1,hl:11,hl+:11 \
--height=40% --layout=reverse"

# Graphical
export BROWSER=/usr/bin/firefox
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
export QT_QPA_PLATFORMTHEME="qt5ct"

