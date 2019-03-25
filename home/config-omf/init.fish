# Golang developers might need this one
set -xg GOPATH $HOME/go

set -xg PATH $PATH $HOME/.software/bin/
set -xg PATH $PATH $HOME/.local/bin/
set -xg PATH $PATH $HOME/.krew/bin/
set -xg PATH $PATH /keybase/private/starkers/scripts/

set -xg EDITOR nvim

alias gss="git status --short"
alias gps="git push -u origin"
alias gpl="git pull -ff"
alias gd="git d"


alias mplayer="mpv"

alias vi="nvim"
alias vim="nvim"
alias vimdiff="nvim -d"
alias vim-clear-tmp-and-swap="rm -rf ~/.config/nvim/tmp/tmp/*.sw*"

alias sternalltail="stern --all-namespaces --tail 10"

alias lg="lazygit"

alias cdb="cd ~/bin"
alias cdd="cd ~/go/src"
alias cdD="cd ~/Downloads"
alias cds="cd ~/Seafile"
alias cdw="cd ~/work"
alias cdh="cd ~/go/src/github.com/starkers/homedirectory/home"
alias cdg="cd ~/go/src/github.com"
alias cdt="cd ~/Torrents"


alias mtr="mtr --curses"
alias nload="sudo nload wlan0 -u K"

alias python=python3
alias pip=pip3

alias j=autojump
