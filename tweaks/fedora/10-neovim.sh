#!/usr/bin/env bash
set -e

function copr_enabled(){
  set +e
  #make a list of copr's that are installed
  LIST="$(dnf copr list --enabled)"
  grep -q "$1" <<<"${LIST}"
  rc=$?
  set -e
  return ${rc}
}

function is_installed_rpm(){
  set +e
  rpm -q ${1} 1>/dev/null 2>/dev/null
  rc=$?
  set -e
  return ${rc}
}


COPR=agriffis/neovim-nightly
if ! is_installed_rpm ${COPR} ; then
  set -x
  sudo dnf copr enable ${COPR} -y
  sudo dnf install neovim -y
  set +x


else
  echo ${COPR} already installed
fi
