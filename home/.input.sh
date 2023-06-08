# asus touchpad
xinput set-prop "ELAN1201:00 04F3:3098 Touchpad" "libinput Natural Scrolling Enabled" 1
xinput set-prop "ELAN1201:00 04F3:3098 Touchpad" "libinput Tapping Enabled" 0
xinput set-prop "ELAN1201:00 04F3:3098 Touchpad" "libinput Accel Speed" 0.5
xinput set-prop "ELAN1201:00 04F3:3098 Touchpad" "libinput Middle Emulation Enabled" 1
xinput set-prop "ELAN1201:00 04F3:3098 Touchpad" "libinput Disable While Typing Enabled" 0

# logitech wireless all-in-one keyboard
xinput set-prop "pointer:Logitech Wireless Device PID:404d" "libinput Accel Speed" 1.0
xinput set-prop "pointer:Logitech Wireless Device PID:404d" "libinput Natural Scrolling Enabled" 1

# beep
xset -b

# numlock
numlockx on
