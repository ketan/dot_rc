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

# RoR stuff
alias ss='script/server'
alias sd='script/server --debugger'
alias sc='script/console'

alias sg='script/generate'
alias sd='script/destroy'
alias sp='script/plugin'

alias rdbm='rake db:migrate'
alias devlog='tail -f log/development.log'

# TextMate
alias mrails="mate .gitignore .hgignore app config lib db features public script spec test vendor Rakefile Capfile Todo"

alias mysqlstart='sudo /opt/local/bin/mysqld_safe5 &'
alias mysqlstop='/opt/local/bin/mysqladmin5 -u root -p shutdown'

alias reload="source ~/.zshrc"
