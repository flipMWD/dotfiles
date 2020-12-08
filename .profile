#-----------------------------
# ~/.profile
#-----------------------------

# Append to PATH and MANPATH only once
if  [[ ":$PATH:" != *":$HOME/scripts:"* ]] &&
    [[ ":$PATH:" != *":$HOME/documents/dasht/bin:"* ]]
then
    export PATH="$PATH:$HOME/scripts:$HOME/documents/dasht/bin"
fi

if  [[ ":$MANPATH:" != *":$HOME/documents/dasht/man:"* ]]
then
    export MANPATH="$MANPATH:$HOME/documents/dasht/man"
fi

# XDG Base Directory
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"

export XDG_DESKTOP_DIR="$HOME/documents"
export XDG_DOWNLOAD_DIR="$HOME/download"
export XDG_DOCUMENTS_DIR="$HOME/documents"
export XDG_PICTURES_DIR="$HOME/pictures"
export SHELL_DOTFILES_DIR="$XDG_CONFIG_HOME/shell"

export DOCKER_CONFIG="$XDG_CONFIG_HOME/docker"
export ELINKS_CONFDIR="$XDG_CONFIG_HOME/elinks"
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc"
export INPUTRC="$XDG_CONFIG_HOME/shell/inputrc"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export PASSWORD_STORE_DIR="$XDG_CONFIG_HOME/pass"
export WGETRC="$XDG_CONFIG_HOME/wget/wgetrc"

# Default Programs
export BROWSER='chromium'
export EDITOR='vim'
export READER='zathura'

# Program Options
export FZF_DEFAULT_COMMAND="fd -HIt f '' ."
export FZF_DEFAULT_OPTS="--color=16,gutter:0,fg+:15,bg+:-1,hl:11,hl+:11 \
--height=40% --layout=reverse"

export LESSHISTFILE=-
export LESS_TERMCAP_mb="$(printf '\e[5;93m')"       # blink
export LESS_TERMCAP_md="$(printf '\e[1;34m')"       # bold
export LESS_TERMCAP_us="$(printf '\e[32m')"         # underline
export LESS_TERMCAP_so="$(printf '\e[7;49;39m')"    # bottom msg/search
export LESS_TERMCAP_me="$(printf '\e[0m')"
export LESS_TERMCAP_ue="$(printf '\e[0m')"
export LESS_TERMCAP_se="$(printf '\e[0m')"

