#
# ~/.bashrc
#

# Check shell options, if one of them is not i[nteractive], return
[[ $- != *i* ]] && return

# Source bash-completion if available
[ -r /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion

# Change the window title of X terminals
case ${TERM} in
    xterm*|rxvt*|Eterm*|aterm|kterm|gnome*|interix|konsole*)
        PROMPT_COMMAND='echo -ne "\033]0;${USER}::${HOSTNAME%%.*} ${PWD/#$HOME/\~}\007"'
        ;;
    screen*)
        PROMPT_COMMAND='echo -ne "\033_${USER}::${HOSTNAME%%.*} ${PWD/#$HOME/\~}\033\\"'
        ;;
esac

use_color=true

# Set colorful PS1 only on colorful terminals.
# dircolors --print-database uses its own built-in database
# instead of using /etc/DIR_COLORS.  Try to use the external file
# first to take advantage of user additions.  Use internal bash
# globbing instead of external grep binary.
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

# ANSI Colors Formatting
# Octal Escape: \033    Hex Escape: \x1B    Bash Escape: \e
#
# Attribute:            Background: 4X      Color:
# 00 = none             Foreground: 3X      0 = black
# 01 = bold             Highlight:  9X      1 = red      
# 04 = underscore                           2 = green
# 05 = blink                                3 = yellow
# 07 = reverse                              4 = blue
# 08 = concealed                            5 = magenta
#                                           6 = cyan
# Reset:   \[\033[00m\]                     7 = white
# Example: \[\033[01;40;34m\]

# Bash Escape Sequences
# \u = username                     # \d = date (Mon Jan 01)
# \h = hostname up to '.'           # \t = time (24H)
# \H = hostname                     # \T = time (12H)
# \w = full directory path          # \@ = time (AM/PM)
# \W = current directory            # \j = jobs
# \$ = root                         # \s = shell

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
        PS1='\u::\h \W \$ '
    else
        PS1='\u::\h \w \$ '
    fi
fi

unset use_color safe_term match_lhs sh

# Enable Alias Expansion
shopt -s expand_aliases

# Source Aliases
[ -f ~/.bash_aliases ] && . ~/.bash_aliases

xhost +local:root > /dev/null 2>&1

# Tab complete sudo commands
complete -cf sudo

# Bash won't get SIGWINCH if another process is in the foreground.
# Enable checkwinsize so that bash will check the terminal size when
# it regains control.  #65623
# http://cnswww.cns.cwru.edu/~chet/bash/FAQ (E11)
shopt -s checkwinsize

# Enable history appending instead of overwriting.  #139609
shopt -s histappend

# Enable Vim mode in Bash
set -o vi

# Allow opening files with Vim from :term w/o nesting
if [ -z "$VIMRUNTIME" ]; then
    alias vs='vim --servername VTERMREADY'
else
    alias vs="vim --servername $VIM_SERVERNAME --remote"
fi

# FZF Function
fzf_util() {
    dir_fd="$PWD"
    find_t="d"

    for arg in "$@"; do
        case $arg in
            h)  dir_fd="$HOME"              ;;
            m)  dir_fd="/run/media/$USER"   ;;
            f)  find_t="f"                  ;;
            *)  ;;
        esac
    done

    if [ "$find_t" = "d" ]; then
        cd "$(find "$dir_fd" -type $find_t | fzf)"
    else
        open_f="$(find "$dir_fd" -type $find_t | fzf)"
        path_n="$(sed -E 's|(/.*)/.*?|\1|g' <<< "$open_f")"
        file_n="$(sed -E 's|/.*/(.*?)|\1|g' <<< "$open_f")"
        cd "$path_n"
        ls -AlhN --color=always "$file_n" | \
        awk -vpn="$path_n" '{print "\033[37mFile:\033[00m " $9 \
        "\n\033[37mPath:\033[00m " pn \
        "\n\033[37mSize:\033[00m " $5 \
        "\t\033[37mLast Edited:\033[00m " $6, $7, $8}'
    fi

    unset dir_fd find_t open_f path_n file_n
}


# vim:sw=4:et
