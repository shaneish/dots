# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fzf='fzf --bind \'ctrl-l:toggle+out,ctrl-h:toggle+in,ctrl-space:toggle\''
alias EDITOR='vim'

export PATH="/usr/local/sbin:$PATH:$HOME/.local/bin"

bindkey -v

if command -v fzf 2>&1 >/dev/null; then
    eval "$(fzf --bash)"
fi
