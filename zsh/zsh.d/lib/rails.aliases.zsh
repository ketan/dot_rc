#!/bin/zsh

# aliases for working with RoR

function r(){
  if [ -f script/rails ]; then
    script/rails $*
  fi
  
  if [ -f script/server ]; then
    SCRIPT=$1
    shift
    script/$SCRIPT $*
  fi
}

alias ss='r server'
alias sc='r console'
alias sd='r destroy'
alias sd='r plugin'

alias ssprod='ss -eproduction'
alias sd='ss --debugger'
alias scprod='sc production'

alias rdbm='rake db:migrate'
alias rdbmprod='rake db:migrate RAILS_ENV=production'
alias devlog='tail -f log/development.log'

# TextMate
alias mrails="mate .gitignore .hgignore app config lib db features public script spec test vendor Rakefile Capfile Todo"
