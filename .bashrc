# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fzf='fzf --bind \'ctrl-l:toggle+out,ctrl-h:toggle+in,ctrl-space:toggle\''
alias EDITOR='vim'

export PATH="/usr/local/sbin:$PATH:$HOME/.local/bin"

PS1='\[\033[01;32m\][\u@\h\[\033[01;37m\] \W\[\033[01;32m\]]$\[\033[00m\] '

set -o vi

if command -v fzf 2>&1 >/dev/null; then
    eval "$(fzf --bash)"
fi

