if xrandr | grep 'DP-1 connected primary'; then
	xrandr --output DP-1 --auto --mode 1920x1080 --rate 144
fi

