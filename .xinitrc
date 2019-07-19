#!/bin/sh
#
#~/.xinitrc
#
#Executed by start x

setxkbmap -option ctrl:nocaps
xset -b
xset r rate 300 50
xinput --set-prop 12 321 0.7
xinput --set-prop 11 309 1
xfce4-power-manager &
~/bin/dwm_status &
exec clipmenud &
exec dwm 2> ~/.dwm.log
