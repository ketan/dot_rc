if [ `uname` = 'Darwin' ]; then
  function emacs() {
    /Applications/MacPorts/Emacs.app/Contents/MacOS/Emacs $@ &
    disown
  }
  function emacsclient() {
    /Applications/MacPorts/Emacs.app/Contents/MacOS/bin/emacsclient $@ &
    disown
  }
fi

