#!/bin/bash
FILENAME="/tmp/$(date +%s).png"
if [[ $1 = "r" ]]; then
    maim -f png -m 10 -s "$FILENAME"
elif [[ $1 = "w" ]]; then
    maim -f png -m 10 -i $(xdotool getactivewindow) "$FILENAME"
elif [[ $1 = "s" ]]; then
    SCREENSIZE=$(xrandr | grep primary | cut -d' ' -f 4)
    maim -f png -m 10 -g "$SCREENSIZE" "$FILENAME"
fi 

FILESIZE=$(du -k $FILENAME | cut -f 1)
SIZECOND="1024" # 1MB

if [ $FILESIZE -ge $SIZECOND ]; then
    notify-send "Image larger than 1MB, saving to file." "$FILENAME"
else
    xclip -selection clipboard -t image/png -i "$FILENAME"
    rm "$FILENAME"
    notify-send "Image less than 1MB, copied to clipboard."
fi