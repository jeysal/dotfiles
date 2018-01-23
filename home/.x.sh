# try desktop nouveau
xrandr --output HDMI-1 --left-of DP-1
xrandr --output DVI-D-1 --right-of DP-1
# try desktop nvidia
xrandr --output HDMI-0 --left-of DP-1
xrandr --output DVI-D-0 --right-of DP-1
# try notebook nvidia
xrandr --output DP-2 --right-of HDMI-1
xrandr --output eDP-1 --left-of HDMI-1
# try VM
xrandr --output VGA-3 --auto --right-of VGA-2
xrandr --output VGA-2 --auto --left-of VGA-3
xrandr --output VGA-2 --auto --right-of VGA-1
xrandr --output VGA-1 --auto --left-of VGA-2

# keys
setxkbmap -layout de -variant nodeadkeys
xmodmap ~/.xmodmap

numlockx on

# touchpad
xinput set-prop "DLL07D1:01 044E:120B" "libinput Natural Scrolling Enabled" 1

# beep
xset -b
