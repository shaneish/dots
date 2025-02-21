# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias git='git --no-pager'
alias gpob="git push origin $(git branch --show-current)"
alias gpub="git pull origin $(git branch --show-current)"
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

export PATH="/usr/local/sbin:$PATH:$HOME/.cargo/bin:$HOME/.fzf/bin:$HOME/.local/bin"
sx() { rg "$1" -i -l | xargs $EDITOR -c "/$1"; }

export PROMPT_INFO=""
function _user_prompt() {
    if [ "$SSH_CONNECTION" ]; then
        echo "\\u@\\h"
    else
        echo $PROMPT_INFO
    fi
}
yellow=$(tput setaf 3)
reset=$(tput sgr0)
PROMPT_COMMAND='PS1_CMD1="$yellow$(pwd | sed "s|^$HOME|~|") $(git branch --show-current 2>/dev/null) $(basename $VIRTUAL_ENV 2>/dev/null)"'; PS1='$(printf "%${COLUMNS}s\n" "${PS1_CMD1}  ")$(_user_prompt) > $reset'

function _set_cursor() {
    if [[ $TMUX = '' ]]; then
        echo -ne $1
    else
        echo -ne "\ePtmux;\e\e$1\e\\"
    fi
}

set -o vi
set editing-mode vi
set show-mode-in-prompt on
set vi-cmd-mode-string $(_set_cursor "\1\e[2 q\2")
set vi-ins-mode-string $(_set_cursor "\1\e[5 q\2")

if command -v fzf 2>&1 >/dev/null; then
    eval "$(fzf --bash)"
fi

if command -v bhop 2>&1 >/dev/null; then
    source $HOME/.config/bhop/scripts/runner.sh
fi

if command -v cargo 2>&1 >/dev/null; then
    source $HOME/.cargo/env
fi

