#/opt/local/bin/zsh

# return

if [ -z "$PS1" ]; then
  return
fi

# ugly, lots of duplication. there should be a better way to do this!

__RUBY_18_BIN=/opt/ruby/ruby-1.8.7-p249/bin
__RUBY_18_GEM_HOME=$HOME/.gem/ruby/1.8

__RUBY_19_BIN=/opt/ruby/ruby-1.9.1-p376/bin
__RUBY_19_GEM_HOME=$HOME/.gem/ruby/1.9.1

__RUBY_EE_BIN=/opt/ruby/ruby-enterprise-1.8.7-2009.10/bin
__RUBY_EE_GEM_HOME=$HOME/.gem/ruby/ee

__JRUBY_14_BIN=/opt/jruby/jruby-1.4.1/bin
__JRUBY_14_GEM_HOME=$HOME/.gem/jruby/1.8

__JRUBY_15_BIN=/opt/jruby/jruby-1.5.0.RC3/bin
__JRUBY_15_GEM_HOME=$HOME/.gem/jruby/1.8

__java_6(){
  export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Versions/1.6/Home
}

__java_5(){
  export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Versions/1.5/Home
}

__ruby_none(){
  # remove all ruby from path!
  export PATH=`echo $PATH | sed -e "s#${__RUBY_18_BIN}##g" -e "s#${__RUBY_19_BIN}##g" -e "s#${__RUBY_EE_BIN}##g"`
  export PATH=`echo $PATH | sed -e "s#${__RUBY_18_GEM_HOME}/bin##g" -e "s#${__RUBY_19_GEM_HOME}/bin##g" -e "s#${__RUBY_EE_GEM_HOME}/bin##g"`
  export PATH="${PATH:s#::#g}"
  unset GEM_HOME
}

__ruby_print(){
  echo "Ruby version is now `ruby --version`"
  echo "GEM_HOME is $GEM_HOME"
}
__ruby18(){
  __ruby_none
  export PATH=$__RUBY_18_BIN:$__RUBY_18_GEM_HOME:$PATH
  export GEM_HOME=$__RUBY_18_GEM_HOME
  __ruby_print
}

__ruby19(){
  __ruby_none
  export PATH=$__RUBY_19_BIN:$__RUBY_19_GEM_HOME:$PATH
  export GEM_HOME=$__RUBY_19_GEM_HOME
  __ruby_print
}

__rubyee(){
  __ruby_none
  export PATH=$__RUBY_EE_BIN:$__RUBY_EE_GEM_HOME$PATH
  export GEM_HOME=$__RUBY_EE_GEM_HOME
  __ruby_print
}

__jruby14(){
  __ruby_none
  export PATH=$__JRUBY_14_BIN:$__JRUBY_14_GEM_HOME$PATH
  export GEM_HOME=$__JRUBY_14_GEM_HOME
  __ruby_print
}

__jruby15(){
  __ruby_none
  export PATH=$__JRUBY_15_BIN:$__JRUBY_15_GEM_HOME$PATH
  export GEM_HOME=$__JRUBY_15_GEM_HOME
  __ruby_print
}

# __ruby18

