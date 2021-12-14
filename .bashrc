#-------------------------------
# ~/.bashrc
#-------------------------------

#-------------------------------
# Options
#-------------------------------

# Check all shell options, return if none of them is i[nteractive]
[[ $- != *i* ]] && return

shopt -s checkwinsize
shopt -s histappend
shopt -s expand_aliases

complete -cf sudo

xhost +local:root > /dev/null 2>&1

#-------------------------------
# Sourcing
#-------------------------------

[[ -r /usr/share/bash-completion/bash_completion ]] &&
    source '/usr/share/bash-completion/bash_completion'

[[ -r ${SHELL_DOTFILES_DIR:-$HOME/.config/shell}/private_env ]] &&
    source "${SHELL_DOTFILES_DIR:-$HOME/.config/shell}/private_env"

[[ -r ${SHELL_DOTFILES_DIR:-$HOME/.config/shell}/aliasrc ]] &&
    source "${SHELL_DOTFILES_DIR:-$HOME/.config/shell}/aliasrc"

# Set alt path for .bash_history
[[ ! -d ${XDG_DATA_HOME:-$HOME/.local/share}/bash ]] &&
    mkdir -p "${XDG_DATA_HOME:-$HOME/.local/share}/bash" &&
    touch "${XDG_DATA_HOME:-$HOME/.local/share}/bash/history"

export HISTFILE="${XDG_DATA_HOME:-$HOME/.local/share}/bash/history"

#-------------------------------
# Bindings
#-------------------------------

bind -m vi-insert -x '"\C-l":"clear"'
bind -m vi '"\C-f":"fzcd\n"'
bind -m vi-insert '"\C-f":"fzcd\n"'

#-------------------------------
# Appearance
#-------------------------------

# Generate and source LS_COLORS
if [[ -f ${SHELL_DOTFILES_DIR:-$HOME/.config/shell}/dir_colors ]] ; then
    eval $(dircolors -b ${SHELL_DOTFILES_DIR:-$HOME/.config/shell}/dir_colors)
elif [[ -f /etc/DIR_COLORS ]] ; then
    eval $(dircolors -b /etc/DIR_COLORS)
fi

# Prompt (fail: shopt -q login_shell)
if [[ $(tty) =~ /dev/tty[0-9]+ ]]; then
    PS1='\u@\h \W \$ '
else
    PS1='\[\033[40;90m\]▌\[\033[01;40;97m\] \W \[\033[00;40;90m\]▐\[\033[07;47;90m\]»\[\033[00;90m\]▌\[\033[00m\] '
fi

#-------------------------------
# Utility
#-------------------------------

# CD with FZF
fzcd() {
    local dirfd arign fzout

    dirfd='.'
    arign=(.git node_modules)
    if [[ ${1,,} = 'h' ]]; then
        dirfd="$HOME"
        arign+=("${HOME_IGNORE[@]}")
    elif [[ ${1,,} = 'm' ]]; then
        dirfd="$MEDIA_DIRECTORY"
        arign+=("${MEDIA_IGNORE[@]}")
    elif [[ -d $1 ]]; then
        [[ ${1::1} = '/' ]] && dirfd="$1" || cd "$dirfd/$1"
    fi

    fzout="$(eval fd -HIpt f ${arign[@]/#/-E } '""' '"$dirfd"' | fzf)"
    [[ -e $fzout ]] && cd "$(dirname -- "$fzout")"
}

# CD to Vifm last directory
vfcd() {
    local dest

    dest="$(command "$HOME/.config/vifm/scripts/vifmrun" --choose-dir - "$@")"
    [[ -d $dest ]] && cd "$dest"
}
