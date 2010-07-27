#!/bin/zsh
if [ -z "$PS1" ]; then
  return
fi

# some aliases
alias ls='ls -hF --color=auto'
alias vi='vim'
alias less='less -R'
alias -g ..='..'
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'

alias mysqlstart='sudo /opt/local/bin/mysqld_safe5 &'
alias mysqlstop='/opt/local/bin/mysqladmin5 -u root -p shutdown'

alias reload="source ~/.zshrc"

alias grep='grep --color'

