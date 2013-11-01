if [ -d /opt/local/Library/Frameworks/Python.framework/Versions/Current/bin ]
then
  export PATH=/opt/local/Library/Frameworks/Python.framework/Versions/Current/bin:$PATH
fi

if [ -f /opt/local/Library/Frameworks/Python.framework/Versions/Current/bin/aws_zsh_completer.sh ]
then
  source /opt/local/Library/Frameworks/Python.framework/Versions/Current/bin/aws_zsh_completer.sh
fi
