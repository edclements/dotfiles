case $1 in
dwm)
	conky -d -y 2 &
	xsetroot -name "$(uname -s) $(uname -r)"
	exec ck-launch-session dwm
	;;
openbox)
	jackd -dalsa -dhw:0 &
	exec ck-launch-session openbox-session
	;;
awesome)
	jackd -dalsa -dhw:0 &
	exec awesome
	;;
xmonad)
	xsetroot -cursor_name left_ptr
	setxkbmap -layout gb
	numlockx &
	xbindkeys &
	jackd -dalsa -dhw:0 &
	exec ck-launch-session xmonad
	;;
*)
	conky -d -y 2 &
	xsetroot -name "$(uname -s) $(uname -r)"
	exec ck-launch-session dwm
	;;
esac
