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
alias ss='ruby script/server'
alias sd='ruby script/server --debugger'
alias sc='ruby script/console'

alias sg='ruby script/generate'
alias sd='ruby script/destroy'
alias sp='ruby script/plugin'

alias rdbm='rake db:migrate'
alias devlog='tail -f log/development.log'

# TextMate
alias ett='mate app config lib db public spec test Rakefile Capfile Todo &'
alias etp='mate app config lib db public spec test vendor/plugins vendor/gems Rakefile Capfile Todo &'
alias etts='mate app config lib db public script spec test vendor/plugins vendor/gems Rakefile Capfile Todo &'

# Editor Ruby file in TextMate
alias mr='mate CHANGELOG app config db lib public script spec test'
