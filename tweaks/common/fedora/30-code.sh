#!/usr/bin/env bash

set -e

function is_installed_rpm(){
  set +e
  rpm -q ${1} 1>/dev/null 2>/dev/null
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

# ensure some basics are installed
if ! is_installed_rpm code; then
  echo $0: installing code
  sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
  sudo dnf update -y
  sudo dnf install -y code
else
  echo vscode already installed
fi
