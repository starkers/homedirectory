#!/usr/bin/env bash
set -e

function is_installed_rpm(){
  set +e
  rpm -q ${1} 1>/dev/null 2>/dev/null
  rc=$?
  set -e
  return ${rc}
}

if ! is_installed_rpm gitflow ; then

sudo dnf copr enable elegos/gitflow
sudo dnf install gitflow -y

else
  echo gitflow already installed
fi
