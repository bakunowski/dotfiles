#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
alias vim='nvim'
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
PS1="\[\033[00;32m\]\u \[\033[00;35m\]@ \w \[\033[01;34m\]$\[\033[00m\] "

export PATH=$PATH:~/bin
export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on'
