if [ -d "$HOME/local/android-sdk-macosx" ]; then
  export ANDROID_HOME=$HOME/local/android-sdk-macosx
  export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools
fi
