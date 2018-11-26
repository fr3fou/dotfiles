#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

source "${HOME}/.cache/wal/colors.sh"
background=$color0
background_alt=$color3
foreground=$color15
foreground_alt=$color2 
highlight=$color4 

export POLY_WS_ICON_0="1;%{F$foreground_alt}%{F-} web"
export POLY_WS_ICON_1="2;%{F$foreground_alt}%{F-} dev"
export POLY_WS_ICON_2="3;%{F$foreground_alt}%{F-} ent"
export POLY_WS_ICON_3="4;%{F$foreground_alt}%{F-} com"
export POLY_WS_ICON_4="5;%{F$foreground_alt}%{F-} vid"
export POLY_WS_ICON_5="6;%{F$foreground_alt}%{F-} bit"
export POLY_WS_ICON_6="7;%{F$foreground_alt}%{F-} rnd"
export POLY_WS_ICON_7="8;%{F$foreground_alt}%{F-} rnd"
export POLY_WS_ICON_8="9;%{F$foreground_alt}%{F-} rnd"

export INTERFACE="$(ip link show | grep \<BROADCAST | awk -F':' '{print $2}' | xargs)"

if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload top &
  done
else
  polybar --reload top &
  polybar --reload bottom &
fi
