#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

# detect monitor
xrandrOutput=$(xrandr -q | grep " connected ")
for monitor in DVI-D-0 eDP1 VGA-1 VGA1 HDMI-0 HDMI1; do
  echo $monitor;
  if echo "$xrandrOutput" | grep "$monitor"; then
    export POLYBAR_MONITOR=$monitor
  fi
done

# Launch bar1 and bar2
polybar top &

echo "Bars launched..."
