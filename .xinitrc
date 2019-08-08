#!/bin/sh -x

xrandr --auto
xset -b

#keyboard + mouse tweaks
setxkbmap -option ctrl:nocaps
xset r rate 300 50
xinput --set-prop 12 'libinput Accel Speed' 0.7
xinput --set-prop 11 'libinput Natural Scrolling Enabled' 1

#set wallpaper
feh --bg-scale Pictures/r1wv3lbrmfc11.png

#useful programs
xfce4-power-manager &
exec clipmenud &
exec dunst &

#dwm + status
~/bin/dwm_status &
exec dwm 2> ~/.dwm.log

#xmonad
