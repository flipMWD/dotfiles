#
# ~/.bash_aliases
#

alias aliases='vim ~/.bash_aliases && . ~/.bash_aliases'
alias sb='. ~/.bashrc'

alias ..='cd ..'
alias ...='cd ../..'
alias gi="cd /run/media/$USER/ && pwd && ls"

alias la='ls -AlhN'
alias cp='cp -i'
alias mv='mv -i'
alias free='free -m'
alias df='df -h'
alias :q='exit'

alias more=less
alias p='sudo pacman'
alias v='vim'
alias r='ranger'
alias ytv="youtube-dl -o '~/Downloads/%(title)s.%(ext)s'"
alias ytm="youtube-dl -x --audio-format mp3 -o '~/Downloads/%(title)s.%(ext)s'"

alias gits='git status'
alias gita='git add'
alias gitc='git commit -m'
alias gitd='git diff'
alias gitr='git rebase'
alias gitb='git branch'
alias gitk='git checkout'
alias gitm='git merge'
