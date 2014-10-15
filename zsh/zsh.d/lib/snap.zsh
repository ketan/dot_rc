#!/bin/zsh
if [ -z "$PS1" ]; then
  return
fi

case $(uname -o) in
  Darwin)
    export PATH=$PATH:$HOME/projects/snap/go-saas-chef/scripts

    fpath=($HOME/projects/snap/go-saas-chef/scripts/completion $fpath)
    autoload -Uz compinit && compinit

  ;;
  GNU/Linux)
    for i in $HOME/src/*; do
        dir=$i:t
        hash -d $dir=$i
    done

    export JAVA_HOME=/opt/local/java/1.8
    export PATH=$JAVA_HOME/bin:$PATH

    export PATH=/opt/local/ruby/2.0.0-p353/bin:$PATH
    export PATH=/opt/local/python/2.7.5/bin:$PATH
    export PATH=/opt/local/nodejs/0.10.28/bin:$PATH
    export PATH=/opt/local/awscli/bin:$PATH

    export PATH=/go-saas-src/go-saas-chef/scripts:$PATH

    export EDITOR=${EDITOR:-vim}
    export BUNDLE_JOBS=4

    fpath=(/go-saas-src/go-saas-chef/scripts/completion $fpath)
    autoload -Uz compinit && compinit -u

  ;;
esac
