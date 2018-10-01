if xrandr | grep 'DisplayPort-0 connected primary'; then
	xrandr --output DisplayPort-0 --auto --mode 1920x1080 --rate 144
fi

