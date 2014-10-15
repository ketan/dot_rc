#!/bin/zsh
if [ -z "$PS1" ]; then
  return
fi

alias setjdk16='export JAVA_HOME=$(/usr/libexec/java_home -v 1.6)'
alias setjdk17='export JAVA_HOME=$(/usr/libexec/java_home -v 1.7)'
alias setjdk18='export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)'


setjdk18

export MAVEN_OPTS=-Dmaven.artifact.threads=8

#By default only a few common utility plugins are displayed
maven_plugins=(
  'cobertura'
)

zstyle ':completion:*:mvn:*' plugins $maven_plugins

#By default advanced phases are not displayed
zstyle ':completion:*:mvn:*' show-advanced-phases true

# To have a better presentation of completions
zstyle ':completion:*:*:mvn:*:matches' group 'yes'
zstyle ':completion:*:*:mvn:*:options' description 'yes'
zstyle ':completion:*:*:mvn:*:options' auto-description '%d'
zstyle ':completion:*:*:mvn:*:descriptions' format $'\e[1m -- %d --\e[22m'
zstyle ':completion:*:*:mvn:*:messages' format $'\e[1m -- %d --\e[22m'
zstyle ':completion:*:*:mvn:*:warnings' format $'\e[1m -- No matches found --\e[22m'
