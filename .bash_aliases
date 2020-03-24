#
# ~/.bash_aliases
#

alias aliases='vim ~/.bash_aliases && . ~/.bash_aliases'
alias sb='. ~/.bashrc'

alias ..='cd ..'
alias ...='cd ../..'
alias cm="cd /run/media/$USER/ && pwd && ls"

alias la='ls -AlhN'
alias cp='cp -i'
alias mv='mv -i'
alias free='free -m'
alias df='df -h'
alias du='du -h'
alias :q='exit'

alias more=less
alias p='sudo pacman'
alias v='vim'
alias r='ranger'
alias f='vifm'
alias web='elinks'
alias ytv="youtube-dl -o '~/Downloads/%(title)s.%(ext)s'"
alias ytm="youtube-dl -x --audio-format mp3 -o '~/Downloads/%(title)s.%(ext)s'"

alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gd='git diff'
alias gb='git branch'
alias gk='git checkout'
alias gm='git merge'
alias gr='git rebase'
alias gp='git push'
alias gu='git pull'
alias gg='git log --all --graph --decorate --oneline'
