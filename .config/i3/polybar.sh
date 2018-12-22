#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

export INTERFACE="$(ip link show | grep \<BROADCAST | awk -F':' '{print $2}' | xargs)"

if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload bottom &
  done
else
  polybar --reload bottom &
fi
