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


function jr(){
  ruby=''
  if [ -x './jruby' ]; then
    ruby='./jruby'
  elif [ -x './script/jruby' ]; then
    ruby='./script/jruby'
  fi

  if [ -f script/rails ]; then
    $ruby script/rails $*
  fi

  if [ -f script/server ]; then
    SCRIPT=$1
    shift
    $ruby script/$SCRIPT $*
  fi
}

alias ss='r server'
alias sc='r console'
alias sd='r destroy'
alias sg='r generate'
alias sd='r plugin'

alias ssprod='ss -eproduction'
alias sd='ss --debugger'
alias scprod='sc production'


alias jss='jr server'
alias jsc='jr console'
alias jsd='jr destroy'
alias jsg='jr generate'
alias jsd='jr plugin'

alias jssprod='jss -eproduction'
alias jsd='jss --debugger'
alias jscprod='jsc production'

alias rdbm='rake db:migrate'
alias rdbmprod='rake db:migrate RAILS_ENV=production'

alias devlog='tail -f log/development.log'

# TextMate
alias mrails="mate .gitignore .hgignore app config lib db features public script spec test vendor Rakefile Capfile Todo Gemfile* ./j*"
function m(){
  if [[ -d "config" && -d "app" && -d 'public' ]]; then
    mate .gitignore .hgignore app config lib db features public script spec test vendor/plugins vendor/ruby Rakefile Capfile Todo Gemfile Gemfile.lock $*
  else
    mate $*
  fi
}

alias gem_cache='(cd ~/Downloads/scache; java -cp . scache)'

export RUBY_GC_MALLOC_LIMIT=1000000000
export RUBY_FREE_MIN=500000
export RUBY_HEAP_MIN_SLOTS=40000
