#-------------------------------
# ~/.config/zsh/.zshrc
#-------------------------------

#-------------------------------
# Options
#-------------------------------

# Quit if not interactive shell
[[ ! -o interactive ]] && return

#-------------------------------
# Sourcing
#-------------------------------

[[ -r ${SHELL_DOTFILES_DIR:-$HOME/.config/shell}/private_env ]] &&
    source "${SHELL_DOTFILES_DIR:-$HOME/.config/shell}/private_env"

[[ -r ${SHELL_DOTFILES_DIR:-$HOME/.config/shell}/aliasrc ]] &&
    source "${SHELL_DOTFILES_DIR:-$HOME/.config/shell}/aliasrc"

# Set alt path for .zcompdump
[[ ! -d ${XDG_CACHE_HOME:-$HOME/.cache}/zsh ]] &&
    mkdir -p "${XDG_CACHE_HOME:-$HOME/.cache}/zsh"

# Set alt path for HISTFILE
[[ ! -d ${XDG_DATA_HOME:-$HOME/.local/share}/zsh ]] &&
    mkdir -p "${XDG_DATA_HOME:-$HOME/.local/share}/zsh" &&
    touch "${XDG_DATA_HOME:-$HOME/.local/share}/zsh/history"

#-------------------------------
# History
#-------------------------------

export HISTFILE="${XDG_DATA_HOME:-$HOME/.local/share}/zsh/history"

HISTSIZE=2000
SAVEHIST=2000

setopt HIST_IGNORE_ALL_DUPS

#-------------------------------
# Appearance
#-------------------------------

# Generate and source LS_COLORS
if [[ -r ${SHELL_DOTFILES_DIR:-$HOME/.config/shell}/dir_colors ]]; then
    eval $(dircolors -b ${SHELL_DOTFILES_DIR:-$HOME/.config/shell}/dir_colors)
elif [[ -r /etc/DIR_COLORS ]]; then
    eval $(dircolors -b /etc/DIR_COLORS)
fi

# which colors
autoload -U colors && colors

# Prompt
[[ $SSH_CONNECTION ]] && local uath='%F{2}%n@%M%f '

if [[ -o login ]]; then
    PS1='%n@%m %/ %# '
else
	PS1="%(1j.%F{3}.%F{7})◆%f ${uath}%F{4}%B%3~%b%f %(?.%F{7}.%F{1})%B>%b%f "
fi

# Insert new line before Prompt, except top line
precmd() {
    precmd() {
        echo
    }
}

#-------------------------------
# Completion
#-------------------------------

# Enable menu select with isearch on single <Tab>
setopt MENU_COMPLETE

# CD by just typing path
setopt AUTO_CD

autoload -Uz compinit

# Module    Pattern                 Standard Styles
zstyle      ':completion:*'         menu select interactive
zstyle      ':completion:*'         list-colors ${(s.:.)LS_COLORS} "ma=40;93"
zstyle      ':completion:*'         file-sort access

zstyle      ':completion:*'         matcher-list '' \
    'm:{[:lower:]\-}={[:upper:]\_}' \
    'r:[^[:alpha:]]||[[:alpha:]]=** r:|=* m:{[:lower:]\-}={[:upper:]\_}' \
    'r:|?=** m:{[:lower:]\-}={[:upper:]\_}'
    # 'match-spec:left-pattern=trial-pattern'
    # 'lr:lranchor|lrpat=tpat' 'lr:lanchor||ranchor=tpat'
    # match-spec: Uppercase keeps cli input, lowercase changes to trial

zstyle      ':completion:*'         completer \
    _expand _complete _ignored _correct _approximate
    # ^ Control Functions

zmodload zsh/complist
compinit -d "${XDG_CACHE_HOME:-$HOME/.cache}/zsh/zcompdump"
_comp_options+=(globdots)

# Quote URLs automatically when pasting on terminal
autoload -Uz bracketed-paste-magic
zle -N bracketed-paste bracketed-paste-magic

autoload -Uz url-quote-magic
zle -N self-insert url-quote-magic

#-------------------------------
# Keybindings
#-------------------------------

# Enable Vi mode
export KEYTIMEOUT=1
bindkey -v

# Menu Select
bindkey -M menuselect 'H' vi-backward-char          # directional
bindkey -M menuselect 'J' vi-down-line-or-history
bindkey -M menuselect 'K' vi-up-line-or-history
bindkey -M menuselect 'L' vi-forward-char
bindkey -M menuselect '[' vi-backward-word          # pages
bindkey -M menuselect ']' vi-forward-word
bindkey -M menuselect 'I' accept-and-menu-complete  # include more files
bindkey -M menuselect 'U' undo                      # remove them
bindkey -M menuselect '^[' send-break               # reset menu search

# Default -M main (emacs + viins)
bindkey '^?' backward-delete-char
bindkey '^W' backward-kill-word
bindkey '^U' backward-kill-line
bindkey '^K' kill-line
bindkey '^Y' yank
bindkey '\e[3~' vi-delete-char

# Search History
bindkey '^R' history-incremental-pattern-search-backward
bindkey '^F' history-incremental-pattern-search-forward

autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd '^V' edit-command-line

_exit-zsh() { exit }
zle -N _exit-zsh
bindkey '^D' _exit-zsh

#-------------------------------
# Utility
#-------------------------------

# CD with FZF
fzcd() {
    local dirfd arign fzout

    dirfd='.'
    arign=(.git node_modules)
    if [[ ${(L)1} = 'h' ]]; then
        dirfd="$HOME"
        arign+=("${HOME_IGNORE[@]}")
    elif [[ ${(L)1} = 'm' ]]; then
        dirfd="$MEDIA_DIRECTORY"
        arign+=("${MEDIA_IGNORE[@]}")
    elif [[ -d $1 ]]; then
        [[ ${1:0:1} = '/' ]] && dirfd="$1" || cd "$dirfd/$1"
    fi

    fzout="$(eval fd -HIpt f ${arign/#/-E } '""' '"$dirfd"' | fzf)"
    [[ -e $fzout ]] && cd "$(dirname -- "$fzout")"
}

# CD to Vifm last directory
vfcd() {
    local dest

    dest="$(command "$HOME/.config/vifm/scripts/vifmrun" --choose-dir - "$@")"
    [[ -d $dest ]] && cd "$dest"
}
