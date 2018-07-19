xrandr --auto
# try desktop nvidia
xrandr --output HDMI-0 --left-of DP-1
xrandr --output DVI-D-0 --right-of DP-1
# try notebook nvidia
xrandr --output DP-2 --right-of HDMI-1 --rotate left
xrandr --output eDP-1 --left-of HDMI-1

# keys
setxkbmap -layout de -variant nodeadkeys
xmodmap ~/.xmodmap

numlockx on

# touchpad
xinput set-prop "DLL07D1:01 044E:120B" "libinput Natural Scrolling Enabled" 1

# beep
xset -b

# background
BACKGROUND_IMAGES=(/usr/share/archlinux/wallpaper/archlinux-{aftermath,arrival,underground}.jpg)
feh --bg-fill ${BACKGROUND_IMAGES[$(( $RANDOM % ${#BACKGROUND_IMAGES[@]} + 1 ))]}

# polybar
~/.config/polybar/launch.zsh
