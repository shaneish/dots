# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias git='git --no-pager'
alias gpob="git push origin (git branch --show-current)"
alias gpub="git pull origin (git branch --show-current)"
alias gap='git add -p'
alias gau='git add -u'
alias gaa='git add .'
alias ga='git add'
alias gcm='git commit -m'
alias gb='git branch --show-current'
alias gm='git merge'
alias gpo='git push origin'
alias gpu='git pull origin'
alias gco='git checkout'
alias gs='git status'
alias gcb='git checkout -b'
alias gwt='git worktree'
alias gd='git diff'

alias EDITOR='vim'

export PATH="/usr/local/sbin:$PATH:$HOME/.cargo/bin:$HOME/.fzf/bin:$HOME/.local/bin"

cwd=$(pwd | sed "s|^$HOME|~|")
PROMPT_COMMAND='PS1_CMD1="$cwd $(git branch --show-current 2>/dev/null) $(basename $VIRTUAL_ENV 2>/dev/null)"'; PS1='$(printf "%${COLUMNS}s\n" "${PS1_CMD1}  ") > '

set -o vi
set show-mode-in-prompt on

if command -v fzf 2>&1 >/dev/null; then
    eval "$(fzf --bash)"
fi

if command -v bhop 2>&1 >/dev/null; then
    source $HOME/.config/bhop/scripts/runner.sh
fi

if command -v cargo 2>&1 >/dev/null; then
    source $HOME/.cargo/env
fi
