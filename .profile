#-----------------------------
# ~/.profile
#-----------------------------

# Append to PATH and MANPATH only once
function append_path() {
    if [[ ":$PATH:" != *:"$1":* ]]; then
        PATH="${PATH:+$PATH:}$1"
    fi
}

append_path "$HOME/scripts"
append_path "$HOME/scripts/statusbar"
append_path "$HOME/scripts/dasht/bin"

export PATH

function prepend_manpath() {
    if [[ ":$MANPATH:" != *:"$1":* ]]; then
        MANPATH="$1:$MANPATH"
    fi
}

prepend_manpath "$HOME/scripts/dasht/man"

export MANPATH

# XDG Base Directory
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"

export XDG_DESKTOP_DIR="$HOME/Desktop"
export XDG_DOCUMENTS_DIR="$HOME/Documents"
export XDG_DOWNLOAD_DIR="$HOME/Downloads"
export XDG_MUSIC_DIR="$HOME/Downloads"
export XDG_PICTURES_DIR="$HOME/Pictures"
export XDG_PUBLICSHARE_DIR="$HOME/Downloads"
export XDG_TEMPLATES_DIR="$HOME/Documents"
export XDG_VIDEOS_DIR="$HOME/Downloads"

export DOCKER_CONFIG="$XDG_CONFIG_HOME/docker"
export ELINKS_CONFDIR="$XDG_CONFIG_HOME/elinks"
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc"
export INPUTRC="$XDG_CONFIG_HOME/shell/inputrc"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export PASSWORD_STORE_DIR="$XDG_CONFIG_HOME/pass"
export SHELL_DOTFILES_DIR="$XDG_CONFIG_HOME/shell"
export VIMINIT='let $MYVIMRC="$XDG_CONFIG_HOME/vim/vimrc" | source $MYVIMRC'
export WGETRC="$XDG_CONFIG_HOME/wget/wgetrc"
export XINITRC="$XDG_CONFIG_HOME/X11/xinitrc"

export XAUTHORITY="${XDG_RUNTIME_DIR:-/run/user/$UID}/Xauthority"
[[ ! -f $XAUTHORITY ]] && touch "$XAUTHORITY"

# Default Programs
export BROWSER='librewolf'
export EDITOR='vim'
export READER='zathura'
export TERMINAL='st'

# Program Options
export FZF_DEFAULT_COMMAND="fd -Ht f -E '.git' -E 'node_modules' '' ."
export FZF_DEFAULT_OPTS="--color=16,gutter:0,fg+:15,bg+:-1,hl:11,hl+:11 \
    --height=40% --layout=reverse"

export FFF_COL2=0   # status bg
export FFF_COL3=3   # selected
export FFF_COL4=9   # cursor
export FFF_COL5=4   # status fg
export FFF_HIDDEN=1
export FFF_FAV1="$HOME/.config"
export FFF_FAV2="$HOME/Downloads"
export FFF_FAV3="$HOME/Documents"
export FFF_FAV4="$HOME/Pictures"
export FFF_FILE_FORMAT=' %f '
export FFF_MARK_FORMAT='> %f '
export FFF_KEY_GO_HOME='`'
export FFF_KEY_GO_DIR=';'

export LESSHISTFILE=-
export LESS_TERMCAP_mb="$(printf '\e[5;93m')"       # blink
export LESS_TERMCAP_md="$(printf '\e[1;34m')"       # bold
export LESS_TERMCAP_us="$(printf '\e[32m')"         # underline
export LESS_TERMCAP_so="$(printf '\e[7;49;39m')"    # bottom msg/search
export LESS_TERMCAP_me="$(printf '\e[0m')"
export LESS_TERMCAP_ue="$(printf '\e[0m')"
export LESS_TERMCAP_se="$(printf '\e[0m')"

export QT_QPA_PLATFORMTHEME='qt5ct'

