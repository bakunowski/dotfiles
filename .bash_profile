#
# ~/.bash_profile
#

export MOZ_ENABLE_WAYLAND=1

[[ -f ~/.bashrc ]] && . ~/.bashrc

# # If running from tty1 start sway
# if [ "$(tty)" = "/dev/tty1" ]; then
#     exec sway
# fi
