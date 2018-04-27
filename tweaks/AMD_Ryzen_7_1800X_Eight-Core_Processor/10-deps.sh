#!/usr/bin/env bash
set -e

declare -a arch_packages=(
  ovmf
  virt-manager
  qemu
  dnsmasq
  nvidia
)

declare -a arch_packages=(
  libvirtd
)

declare -a extra_groups=(
  libvirt
)

function is_arch(){
  if [ -f /etc/pacman.conf ]; then
    return 0
  else
    return 1
  fi
}

function is_installed_yay(){
  yay -Q "${1}" 1>/dev/null 2>&1
  local rc=$?
  return $rc
}

function instal_yay(){
  yay -S --noconfirm "$1"
}


function deps_arch(){
  # ensure yay is installed
  local data="$(yaourt -Q)"
  if ! grep -q yay-bin <<<"$data" ; then
    set -x
    yaourt -Sy
    yaourt --noconfirm -S yay-bin
  else
    echo $0: yay already installed
  fi

  for i in "${arch_packages[@]}" ; do
    if ! is_installed_yay ${i}  ; then
      echo $0: installing $i
      yay --noconfirm -S ${i}
    else
      echo $0: skipping $i
    fi
  done
}

if is_arch; then
  deps_arch
  for i in "${arch_services[@]}" ; do
    echo systemctl enable $i
    sudo systemctl enable $i
    echo systemctl start $i
    sudo systemctl start $i
  done

  # add myself to these groups
  for i in "${extra_groups[@]}" ; do
    echo sudo usermod -a -G ${i} $(whoami)
    sudo usermod -a -G ${i} $(whoami)
  done

fi
