
if command -v gnome-keyring-daemon &> /dev/null && [ -n "$DESKTOP_SESSION" ]; then
  eval $(gnome-keyring-daemon --start)
  export SSH_AUTH_SOCK
fi

source ~/.bashrc
