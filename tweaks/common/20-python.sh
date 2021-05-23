#!/usr/bin/env bash
set -e

# PER https://github.com/zchee/deoplete-jedi#virtual-environments
# creates two virtual-envs in my homedir

# let g:python_host_prog = '/full/path/to/neovim2/bin/python'
# let g:python3_host_prog = '/full/path/to/neovim3/bin/python'


# for golang.. should probably make this its own init script when I can be bothered to tidy up
go get -u github.com/mdempsky/gocode

function jedi(){
  local VER=${1}
  figlet py${VER} neovim
  DIR=${HOME}/.venv_nvim_${VER}
  if [ -d ${DIR} ]; then
    echo no need to crete venv in ${DIR}, it already exists
  else
    virtualenv --python=python${VER} ${DIR}
  fi
  source ${DIR}/bin/activate
  pip install --upgrade pip
  pip install \
    autoflake \
    black \
    cheat \
    flake8 \
    jedi \
    neovim
  deactivate
}


jedi 2
jedi 3
