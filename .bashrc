#------------------------------
# ~/.bashrc
#------------------------------

#------------------------------
# Options
#------------------------------

# Check all shell options, return if none of them is i[nteractive]
[[ $- != *i* ]] && return

# Bash won't get SIGWINCH if another process is in the foreground.
# Enable checkwinsize so that bash will check the terminal size when
# it regains control.  #65623
# http://cnswww.cns.cwru.edu/~chet/bash/FAQ (E11)
shopt -s checkwinsize
shopt -s histappend
shopt -s expand_aliases

complete -cf sudo

set -o vi

#------------------------------
# Sourcing
#------------------------------

[ -r /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion
[ -r ~/.bash_aliases ] && . ~/.bash_aliases
[ -r ~/.private_env ] && . ~/.private_env

#------------------------------
# Bindings
#------------------------------

bind -m vi-insert -x '"\C-l":"clear"'
bind -m vi '"\C-f":"fzf_util\n"'
bind -m vi-insert '"\C-f":"fzf_util\n"'

#------------------------------
# Misc
#------------------------------

# Change the window title of X terminals
case ${TERM} in
    xterm*|rxvt*|Eterm*|aterm|kterm|gnome*|interix|konsole*)
        PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*} ${PWD/#$HOME/\~}\007"'
        ;;
    screen*)
        PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*} ${PWD/#$HOME/\~}\033\\"'
        ;;
esac

xhost +local:root > /dev/null 2>&1

# Set colorful PS1 only on colorful terminals.
# dircolors --print-database uses its own built-in database
# instead of using /etc/DIR_COLORS.  Try to use the external file
# first to take advantage of user additions.  Use internal bash
# globbing instead of external grep binary.
use_color=true
safe_term=${TERM//[^[:alnum:]]/?}   # sanitize TERM
match_lhs=""
[[ -f ~/.dir_colors   ]] && match_lhs="${match_lhs}$(<~/.dir_colors)"
[[ -f /etc/DIR_COLORS ]] && match_lhs="${match_lhs}$(</etc/DIR_COLORS)"
[[ -z ${match_lhs}    ]] \
    && type -P dircolors >/dev/null \
    && match_lhs=$(dircolors --print-database)
[[ $'\n'${match_lhs} == *$'\n'"TERM "${safe_term}* ]] && use_color=true

if ${use_color} ; then
    # Enable colors for ls, etc.  Prefer ~/.dir_colors #64489
    if type -P dircolors >/dev/null ; then
        if [[ -f ~/.dir_colors ]] ; then
            eval $(dircolors -b ~/.dir_colors)
        elif [[ -f /etc/DIR_COLORS ]] ; then
            eval $(dircolors -b /etc/DIR_COLORS)
        fi
    fi

# ANSI Colors Formatting: \[\033|\x1b|\e[attr;bg;fgm\]
# Attribute: 0=none, 1=bold, 4=underscore, 5=blink, 7=reverse, 8=concealed
# Group: 3X=fg, 4X=bg, 9X=hifg, 10X=hibg
# Color: 0=black, 1=red, 2=green, 3=yellow, 4=blue, 5=magenta, 6=cyan, 7=white

# Bash Escape Sequences:
# \u[sername], \h[ostname].tld, \H[ostname full], \w[orking dir path],
# \W[orking dir current], \d[ate], \t[ime (24)], \T[ime (12], \@ [time (AM/PM)],
# \j[obs], \$ [root], \s[hell]

    if [[ ${EUID} == 0 ]] ; then
        PS1='\[\033[01;31m\]\h\[\033[01;37m\] \W\[\033[01;31m\] \$\[\033[00m\] '
    else
        PS1='\[\033[40;90m\]▌\[\033[01;40;97m\] \W \[\033[00;40;90m\]▐\[\033[07;47;90m\]»\[\033[00;90m\]▌\[\033[00m\] '
    fi

    alias ls='ls --color=auto --group-directories-first'
    alias grep='grep --colour=auto'
    alias egrep='egrep --colour=auto'
    alias fgrep='fgrep --colour=auto'
else
    if [[ ${EUID} == 0 ]] ; then
        # show root@ when we don't have colors
        PS1='\u@\h \W \$ '
    else
        PS1='\u@\h \w \$ '
    fi
fi

unset use_color safe_term match_lhs sh

# Allow opening files with Vim from :term w/o nesting
if [ -z "$VIMRUNTIME" ]; then
    alias vs='vim --servername VTERMREADY'
else
    alias vs="vim --servername ${VIM_SERVERNAME} --remote"
fi

#------------------------------
# Functions
#------------------------------

fzf_util() {
    local dir_fd found

    dir_fd="."  # $PWD
    if [ "${1,,}" = "h" ]; then
        dir_fd="$HOME"
        shift
    elif [ "${1,,}" = "m" ]; then
        dir_fd=(${MEDIA_LOCALS[@]/#/$MEDIA_DIRECTORY})
        shift
    elif [ -d "$1" ]; then
        if [ "${1::1}" = "/" ]; then
            dir_fd="$1"
        else
            cd "${dir_fd}/${1}"
        fi
        shift
    fi

    found="$(find "${dir_fd[@]}" | fzf -m)"
    if [ $(wc -l <<< "$found") -eq 1 -a -z "$1" ]; then
        if [ -d "$found" ]; then
            cd "$found"
        elif [ -d "${found%/*}" ]; then
            cd "${found%/*}"
            ls -AlhN --color=always "${found##*/}" |
            awk -vpn="${found%/*}" '{print "\033[37mFile:\033[00m " $9 \
                "\n\033[37mPath:\033[00m " pn \
                "\n\033[37mSize:\033[00m " $5 \
                "\t\033[37mLast Edited:\033[00m " $6, $7, $8}'
        fi
        return
    fi

    if [ $# -gt 0 ]; then
        $@ $(echo "$found")
        return
    fi

    [ ! -z "$found" ] && echo "$found"
}

# vim:sw=4:et
