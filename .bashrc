#-------------------------------
# Options
#-------------------------------

# Check all shell options, return if none of them is i[nteractive]
[[ $- != *i* ]] && return

shopt -s checkwinsize
shopt -s histappend
shopt -s expand_aliases

complete -cf sudo

# Completion
[[ -r /usr/share/bash-completion/bash_completion ]] &&
    source '/usr/share/bash-completion/bash_completion'

# Source alias
[[ -r $HOME/.aliasrc ]] && source "$HOME/.aliasrc"

# History (ignore duplicates and leading space)
HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000

#-------------------------------
# Appearance
#-------------------------------

# Generate and source LS_COLORS
if [[ -f $HOME/.dir_colors ]] ; then
	eval $(dircolors -b "$HOME/.dir_colors")
elif [[ -f /etc/DIR_COLORS ]] ; then
	eval $(dircolors -b /etc/DIR_COLORS)
fi

# Prompt (fail: shopt -q login_shell)
if [[ $(tty) =~ /dev/tty[0-9]+ ]]; then
	PS1='\u@\h \W \$ '
else
	PS1='\[\033[37m\]◆ \[\033[32m\]\u@\h \[\033[34m\]\w \[\033[01;37m\]>\[\033[0;0m\] '
fi

#-------------------------------
# Keybindings
#-------------------------------

bind -m vi-insert -x '"\C-l":"clear"'
bind -m vi '"\C-f":"fzcd\n"'
bind -m vi-insert '"\C-f":"fzcd\n"'
