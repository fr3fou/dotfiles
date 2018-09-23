#!/bin/sh
# source ~/dotfiles/.sensitive
. ~/.cache/wal/colors.sh
ping -W 1 -c 1 -s 1 $PI_IP > /dev/null 2>&1
if [ $? -eq 0 ]; then
  echo "%{u$color1 +u}π: %{F#00aa00}⇄%{F-}%{u#0000ff}"
else
  echo "%{u$color5 +u}π: %{F#aa0000}%{F-}%{u#0000ff}"
fi
