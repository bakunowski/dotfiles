alias vim='nvim'

alias ll='ls -alh'
alias ls='ls -G'

alias ssh='TERM=xterm ssh'

# alias dri="docker rmi -f $(docker images -a -q)"
# alias drc="docker rm -vf $(docker ps -a -q)"

# setup dotfile repo alias
alias dotfiles='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# setup external tools completion
. ~/git-completion.bash
. ~/git-prompt.sh
source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.bash.inc"
source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.bash.inc"

export GIT_PS1_SHOWDIRTYSTATE=1
PS1='[bakunowski@mbp \W$(__git_ps1 " (%s)")]\$ '

export GOPATH=$HOME/go
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin

export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completio

complete -C /usr/local/bin/terraform terraform
