#!/usr/bin/env zsh

(
  flock -n 9 || exit 1

  # Terminate already running bar instances
  killall -q polybar

  # Wait until the processes have been shut down
  while pgrep -x polybar >/dev/null; do sleep 1; done

  # Launch
  polybar top &disown
) 9>~/.local/state/polybar-restart.lock
