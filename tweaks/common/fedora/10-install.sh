#!/usr/bin/env bash
set -e


declare -a packages_fedora=(
  adapta-backgrounds
  adapta-gtk-theme
  adwaita-icon-theme
  bluecurve-icon-theme
  cmake
  copyq
  ctags
  direnv
  docker-ce
  docker-compose
  expect
  faience-icon-theme
  figlet
  flameshot
  flatpak
  flatpak-builder
  fzf
  gcc
  gcc-c++
  git
  gnome-colors-icon-theme
  gnome-tweaks
  golang
  guake
  jq
  libcurl
  libcurl-devel
  make
  mlocate
  moka-icon-theme
  mpv
  nodejs
  numix-icon-theme-circle
  numix-icon-theme-square
  openssl-devel
  pop-icon-theme
  pwgen
  python2-devel
  python3-devel
  python3-virtualenv
  redhat-lsb-core
  rofi
  rofi-themes
  seafile-client
  the_silver_searcher
  tig
  tilix
  transmission
  virt-manager
  xclip
  zsh
)


function snx_deps(){
  sudo dnf install /lib/ld-linux.so.2 libX11.so.6 libpam.so.0 libstdc++.so.5 libnsl.so.1 -y
}
function is_fedora(){
  if [ -f /etc/fedora-release ]; then
    return 0
  else
    return 1
  fi
}

function is_installed_rpm(){
  set +e
  rpm -q ${1} 1>/dev/null 2>/dev/null
  rc=$?
  set -e
  return ${rc}
}
function deps_fedora(){
  # ensure some basics are installed
  for i in "${packages_fedora[@]}" ; do
  if ! is_installed_rpm ${i}; then
      echo $0: installing $i
      sudo dnf install -y ${i}
    else
      echo ${i} already installed
  fi
  done
}

# TODO: remove: 'whois-mkpasswd'

if is_fedora; then
  echo is fedora
  deps_fedora
  snx_deps
fi
