# vim: ft=sh
setxkbmap gb
if uname -v | grep -q "Debian"; then
  exec dwm.ed
else
  exec dwm
fi
