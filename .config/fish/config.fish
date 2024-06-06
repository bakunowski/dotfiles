# Tide help:
# | Symbol    | Meaning                               |
# | --------- | ------------------------------------- |
# | `feature` | current branch                        |
# | `merge`   | repository state (ongoing actions)    |
# | `⇣1`      | this many commits behind the remote   |
# | `⇡2`      | this many commits ahead of the remote |
# | `*3`      | this many stashes                     |
# | `~4`      | this many merge conflicts             |
# | `+5`      | this many staged changes              |
# | `!6`      | this many unstaged changes            |
# | `?7`      | this many untracked files             |

# Tide config

function _tide_item_kubectl2
	kubectl config view --minify --output 'jsonpath={.current-context}/{..namespace}' | sed -e 's/k8s.//g' -e 's/.clearscore.io//g' 2>/dev/null | read -l context &&
	_tide_print_item kubectl $tide_kubectl_icon' ' (string replace -r '/(|default)$' '' $context)
end

set --universal tide_right_prompt_items status jobs kubectl2
# ghostty cuts it off :(
set --universal tide_right_prompt_suffix " "

set --universal tide_kubectl_color normal
set --universal tide_kubectl_icon ""

set --universal tide_character_color green

set --universal tide_jobs_icon ""
set --universal tide_jobs_color brmagenta

set --universal tide_pwd_color_anchors blue
set --universal tide_pwd_color_dirs blue

set --universal tide_git_color_branch normal

alias vim=nvim
# alias ssh='TERM=xterm-256color ssh'

alias ga="git add"
alias gc="git commit"
alias gdiff="git diff"
alias gsw="git switch"
alias gl="git prettylog"
alias gp="git push"
alias gpl="git pull"
alias gs="git status"
alias gcp="git cherry-pick"

export KUBE_EDITOR="nvim"
export EDITOR="nvim"

export GPG_TTY=$(tty)
export HOMEBREW_NO_INSTALLED_DEPENDENTS_CHECK=1

# homebrew dissapeared after upgrading
eval $(/opt/homebrew/bin/brew shellenv)

# enable autojump
[ -f /opt/homebrew/share/autojump/autojump.fish ]; and source /opt/homebrew/share/autojump/autojump.fish

set -g fish_greeting

# kubectl krew
set -gx PATH $PATH $HOME/.krew/bin
set -gx PATH $PATH /Users/karolbakunowski/bin
set -gx PATH $PATH /Users/karolbakunowski/bin/nvim-macos-arm64/bin
set -gx PATH $PATH /Users/karolbakunowski/go/bin
