if [ -f ~/.bashrc_local ] ; then
  . ~/.bashrc_local
fi

# enhancd
[ -f $HOME/.enhancd/init.sh ] && source $HOME/.enhancd/init.sh
ENHANCD_FILTER=fzf; export ENHANCD_FILTER

# fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# starship
export PATH=/opt/homebrew/bin:$PATH
eval "$(starship init bash)"

# alias
alias vi='nvim'
alias g='git'
alias ls='ls -CFG'
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias lg='lazygit'
alias k='kube-prompt'
alias t='tmux'
alias tn='tmux new -s'
alias ta='tmux a -t'
alias tk='tmux kill-server'

# prompt
function parse_git_branch {
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ [\1]/'
}
function promps {
    # 色は気分で変えたいかもしれないので変数宣言しておく
    local  BLUE="\[\e[1;34m\]"
    local  RED="\[\e[1;31m\]"
    local  GREEN="\[\e[1;32m\]"
    local  WHITE="\[\e[00m\]"
    local  GRAY="\[\e[1;37m\]"

    case $TERM in
        xterm*) TITLEBAR='\[\e]0;\W\007\]';;
        *)      TITLEBAR="";;
    esac
    local BASE="\u"
    PS1="${TITLEBAR}${GREEN}${BASE}${WHITE}: ${RED}\W${GRAY}\$(parse_git_branch)${BLUE}\${WHITE} \[\e[0m\]\n\\$ "
}

if type "direnv"; then
  eval "$(direnv hook bash)"
fi

export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
