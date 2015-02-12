#!/bin/zsh

export RUBY_GC_MALLOC_LIMIT=1000000000
export RUBY_FREE_MIN=500000
# export RUBY_HEAP_MIN_SLOTS=40000
export RUBY_HEAP_MIN_SLOTS=4000000

export RUBY_GC_HEAP_FREE_SLOTS=$RUBY_FREE_MIN
export RUBY_GC_HEAP_INIT_SLOTS=$RUBY_HEAP_MIN_SLOTS

export JRUBY_OPTS='--dev -J-Xmx1g'

# to prevent nokogiri to compile libxml/libxml and the works
export NOKOGIRI_USE_SYSTEM_LIBRARIES=1
