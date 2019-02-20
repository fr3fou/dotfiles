xrandr | grep 'DisplayPort-0 connected primary' && \
xrandr --output DisplayPort-0 --auto --output DisplayPort-0 --mode 1920x1080 --rate 144.0 && \
xrandr --output HDMI-A-0 --auto --output HDMI-A-0 --auto --right-of DisplayPort-0 && \
xrandr --output DVI-D-0 --auto --output DVI-D-0 --auto --left-of DisplayPort-0 
