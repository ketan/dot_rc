if [ -d "$HOME/projects/mobile/adt-bundle-mac-x86_64-20130219/sdk" ]; then
  export ANDROID_HOME=$HOME/projects/mobile/adt-bundle-mac-x86_64-20130219/sdk
  export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools
fi
