#!/bin/sh -x
xrdb -merge ~/.Xresources

xrandr --auto
xset -b

#keyboard tweaks
setxkbmap -option ctrl:nocaps
xcape -e 'Control_L=Escape'

setxkbmap -layout "us,pl,gb" -option grp:shifts_toggle
xset r rate 300 50

#mouse tweaks
xinput set-prop 12 165 6.0, 0.0, 0.0, 0.0, 6.0, 0.0, 0.0, 0.0, 1.0
xinput set-prop 11 165 2.4, 0.0, 0.0, 0.0, 2.4, 0.0, 0.0, 0.0, 1.0
xinput --set-prop 11 'libinput Natural Scrolling Enabled' 1
xinput --set-prop 11 'libinput Tapping Enabled' 1

#setup default cursor for xmonad
xsetroot -cursor_name left_ptr

#set wallpaper
feh --bg-scale Downloads/mac_wallpaper.png

#useful programs
xfce4-power-manager &
exec clipmenud &
exec dunst &
exec udiskie --tray --no-notify &

#dwm + status
#~/bin/dwm_status &
#exec dwm 2> ~/.dwm.log
exec xmonad
