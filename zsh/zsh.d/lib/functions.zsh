#/opt/local/bin/zsh

# return

if [ -z "$PS1" ]; then
  return
fi

# ugly, lots of duplication. there should be a better way to do this!

__java_6(){
  export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Versions/1.6/Home
}

__java_5(){
  export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Versions/1.5/Home
}

# __ruby18

