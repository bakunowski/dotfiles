!/bin/sh -x

#export QT_SCREEN_SCALE_FACTOR=0.5
#export QT_AUTO_SCREEN_SCALE_FACTOR=1.5
#export QT_SCALE_FACTOR=1.5
xrandr --dpi 144
xrdb -merge ~/.Xresources

#xrandr --auto
xset -b

eval $(/usr/bin/gnome-keyring-daemon --start --components=gpg,pkcs11,secrets,ssh)
export $(gnome-keyring-daemon --start --components=pkcs11,secrets,ssh,gpg)
dbus-update-activation-environment --systemd DISPLAY

#keyboard tweaks
setxkbmap -option ctrl:nocaps
xcape -e 'Control_L=Escape'

setxkbmap -layout "us,pl,gb" -option grp:shifts_toggle
xset r rate 300 50

#mouse tweaks
xinput set-prop 'Synaptics TM3289-021' 'libinput Accel Speed' 0.6
xinput set-prop 'Synaptics TM3289-021' 'libinput Natural Scrolling Enabled' 1
xinput set-prop 'Synaptics TM3289-021' 'libinput Tapping Enabled' 1

#set wallpaper
feh --bg-scale Pictures/2f336.jpg

#useful programs
xfce4-power-manager &
exec clipmenud &
exec dunst &
exec udiskie --tray --no-notify &
exec mons -a & disown
exec picom -CGb &
exec redshift &
exec unclutter &
#exec xmodmap current.config &

#dwm + status
~/bin/dwm_status &
exec dwm
# exec ~/bin/startdwm
# exec startplasma-x11
