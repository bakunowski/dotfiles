#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
alias vim='nvim'
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
#PS1="\[\033[00;32m\]\u\[\033[00;35m\] @ \W \[\033[01;34m\]$\[\033[00m\] "
PS1="\[\033[00;32m\]\[\033[00;35m\] \W \[\033[01;34m\]$\[\033[00m\] "


export PATH=$PATH:~/bin
export PATH=$PATH:~/processing-3.5.3
export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel'


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/bakunowski/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/bakunowski/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/bakunowski/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/bakunowski/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
