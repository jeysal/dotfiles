#!/usr/bin/env zsh

autorandr -c || ~/.display.sh

# asus touchpad
xinput set-prop "ELAN1201:00 04F3:3098 Touchpad" "libinput Natural Scrolling Enabled" 1
xinput set-prop "ELAN1201:00 04F3:3098 Touchpad" "libinput Tapping Enabled" 0
xinput set-prop "ELAN1201:00 04F3:3098 Touchpad" "libinput Accel Speed" 0.5
xinput set-prop "ELAN1201:00 04F3:3098 Touchpad" "libinput Middle Emulation Enabled" 1
xinput set-prop "ELAN1201:00 04F3:3098 Touchpad" "libinput Disable While Typing Enabled" 0

# beep
xset -b

# numlock
numlockx on
