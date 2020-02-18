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

if uname -v | grep -q -E "Debian|Ubuntu"; then
  exec dwm.ed
else
  exec dwm
fi

# vim: ft=sh
