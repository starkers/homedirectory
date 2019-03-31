# Golang developers might need this one
set -xg GOPATH $HOME/go
set -xg PATH $PATH $GOPATH/bin

set -xg PATH $PATH $HOME/.bin/
set -xg PATH $PATH $HOME/.software/bin/
set -xg PATH $PATH $HOME/.local/bin/
set -xg PATH $PATH $HOME/.krew/bin/
set -xg PATH $PATH /keybase/private/starkers/scripts/

set -xg EDITOR nvim


source ~/.aliases
