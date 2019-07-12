#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

xrandr --auto

exec >/tmp/startx$$.log 2>&1


userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
    for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

setxkbmap -option ctrl:nocaps
xset -b #disable bell
xset r rate 200 30
exec xset m 2 0 &
exec xinput set-prop 11 296 1 & #enable natural scrolling
exec nitrogen --restore &
exec clipmenud &
exec /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
exec xfce4-power-manager &
~/bin/dwm_status &
exec dwm 2> ~/.dwm.log
