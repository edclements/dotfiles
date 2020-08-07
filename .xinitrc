#!/bin/bash

setxkbmap gb

if [ -f ~/.Xresources ]; then
  xrdb -merge -I$HOME ~/.Xresources
fi

if [  -f ~/.fehbg ]; then
  ~/.fehbg
else
  xsetroot -solid "#002b36"
fi

while true; do
  xsetroot -name "$( date +"%F %R" )"
  sleep 1m
done &

if [ -d ~/.screenlayout ]; then
  ~/.screenlayout/two-monitors.sh
fi

if [ -n "$DESKTOP_SESSION" ];then
  eval $(gnome-keyring-daemon --start --components=secrets,ssh)
  export SSH_AUTH_SOCK
fi

if [ -x "$(command -v nm-applet)" ]; then
  (sleep 2 && nm-applet) &
fi

if uname -v | grep -q -E "Debian|Ubuntu"; then
  exec dwm.ed
else
  exec dwm
fi

# vim: ft=sh
