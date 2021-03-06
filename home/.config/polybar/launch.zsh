#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

# detect monitor
xrandrOutput=$(xrandr -q | grep " connected ")
for monitor in DP-1 DP-0 DVI-D-1 DVI-D-0 HDMI-1 HDMI-0 HDMI1 HDMI0 VGA-1 VGA1 eDP-1 eDP1 eDP-1-1; do
  echo $monitor;
  if echo "$xrandrOutput" | grep "$monitor"; then
    export POLYBAR_MONITOR=$monitor
  fi
done

# Launch bar1 and bar2
polybar top &

echo "Bars launched..."
