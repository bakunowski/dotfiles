export PATH=~/bin:$PATH
xrdb -merge ~/.Xresources

xset -b

eval $(/usr/bin/gnome-keyring-daemon --start --components=gpg,pkcs11,secrets,ssh)
export $(gnome-keyring-daemon --start --components=pkcs11,secrets,ssh,gpg)
dbus-update-activation-environment --systemd DISPLAY

#keyboard tweaks
setxkbmap -option ctrl:nocaps
xcape -e 'Control_L=Escape'

setxkbmap -layout "us,pl,gb" -option grp:shifts_toggle
xset r rate 300 50

hsetroot -solid '#5c6370' &

#mouse tweaks
xinput set-prop "Synaptics TM3289-021" "libinput Accel Speed" 0.5
xinput set-prop 'Synaptics TM3289-021' 'libinput Natural Scrolling Enabled' 1
xinput set-prop 'Synaptics TM3289-021' 'libinput Tapping Enabled' 1
xinput set-prop "TPPS/2 Elan TrackPoint" "libinput Accel Speed" 1

#useful programs
exec clipmenud &
#exec dunst &
exec udiskie --tray --no-notify &
exec mons -a & disown
/* exec redshift & */
exec unclutter &
exec libinput-gestures-setup autostart &
exec libinput-gestures-setup start &

#dwm + status
exec ~/bin/dwm_status &
exec ~/bin/startdwm
