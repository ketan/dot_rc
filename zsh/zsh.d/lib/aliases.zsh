#!/bin/zsh
if [ -z "$PS1" ]; then
  return
fi

# some aliases
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

alias ls='ls --color=auto -hF'
# because coreutils with macports builds with a 'g' prefix
# alias ls='ls -GhF'
# alias cp='gcp'
# alias mv='gmv'
# alias rm='grm'
# alias ln='gln'
# 
# alias cat='gcat'
# alias head='ghead'
# alias tail='gtail'
# 
# alias chown='gchown'
# alias chmod='gchmod'
# 
# alias du='gdu'
# alias df='gdf'
