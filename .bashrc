#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# export PS1="[\[\e[32;40m\]\u\[\e[m\]@\h \W] "

# export MOZ_ENABLE_WAYLAND=1
# export XDG_CURRENT_DESKTOP=sway
# export XDG_SESSION_TYPE=wayland
export MOZ_X11_EGL=1
export LIBVA_DRIVER_NAME=i965
export _JAVA_AWT_WM_NONREPARENTING=1

alias ls='ls --color=auto'
alias vim=nvim
# alias t='tmux -u'
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

[ -f /opt/miniconda3/etc/profile.d/conda.sh ] && source /opt/miniconda3/etc/profile.d/conda.sh
[ -f /usr/share/autojump/autojump.bash ] && . /etc/profile.d/autojump.sh
