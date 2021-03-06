#!/bin/zsh
if [ -z "$PS1" ]; then
  return
fi

# some aliases
alias ls='ls -hG'
alias vi='vim'
alias less='less -R'
alias -g ..='..'
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'

alias mysqlstart='sudo mysqld_safe &'
alias mysqlstop='mysqladmin -u root -p shutdown'

alias reload="source ~/.zshrc"

alias grep='grep --color'

alias ls='ls --color=auto -hF'

alias ikill="ps axu | grep Developer | grep -v Xcode.app | grep -v grep | awk '{print \$2}' | xargs kill -9"

path() {
  echo $PATH | tr ":" "\n"
}

if [[ $OSTYPE == darwin* ]]; then
  pman() { man $1 -t | open -f -a Preview }
fi
