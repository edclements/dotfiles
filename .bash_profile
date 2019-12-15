
if command -v gnome-keyring-daemon &> /dev/null && [ -n "$DESKTOP_SESSION" ]; then
  eval $(gnome-keyring-daemon --start)
  export SSH_AUTH_SOCK
fi

if [[ `uname` == 'Darwin' ]]; then
  export BASH_SILENCE_DEPRECATION_WARNING=1
fi

source ~/.bashrc
