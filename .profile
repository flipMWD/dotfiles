#-----------------------------
# ~/.profile
#-----------------------------

# PATH
export PATH="$PATH:$HOME/documents/dasht/bin"
export MANPATH="$HOME/documents/dasht/man:$MANPATH"

# XDG Base Directory
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"

export DOCKER_CONFIG="${XDG_CONFIG_HOME}/docker"
export ELINKS_CONFDIR="${XDG_CONFIG_HOME}/elinks"
export GTK2_RC_FILES="${XDG_CONFIG_HOME}/gtk-2.0/gtkrc"
export LESSHISTFILE=-
export NPM_CONFIG_USERCONFIG="${XDG_CONFIG_HOME}/npm/npmrc"
export PASSWORD_STORE_DIR="${XDG_CONFIG_HOME}/pass"
export WGETRC="${XDG_CONFIG_HOME}/wget/wgetrc"

# Default Programs
export BROWSER="/usr/bin/chromium"
export EDITOR="/usr/bin/vim"

# Program Options
export FZF_DEFAULT_COMMAND="find ."
export FZF_DEFAULT_OPTS="--color=16,gutter:0,fg+:15,bg+:-1,hl:11,hl+:11 \
--height=40% --layout=reverse"

