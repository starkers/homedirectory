#!/usr/bin/env bash
set -e


declare -a packages_fedora=(

  # themes n stuff
  adapta-backgrounds
  adwaita-icon-theme
  bluecurve-icon-theme
  faience-icon-theme
  gnome-colors-icon-theme
  moka-icon-theme
  numix-icon-theme-circle
  numix-icon-theme-square

  gnome-shell-theme-flat-remix
  gnome-shell-theme-selene
  gnome-shell-theme-yaru

  gnome-shell-extension-do-not-disturb-button



  chromium
  cmake
  copyq
  ctags
  direnv
  # docker-ce
  # docker-compose
  evolution-ews
  expect
  figlet
  flameshot
  flatpak
  flatpak-builder
  fzf
  gcc
  gcc-c++
  git
  gnome-tweaks
  golang
  # guake
  jq
  libcurl
  libcurl-devel
  make
  mlocate
  openssl-devel
  mpv
  nodejs
  pwgen
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
fi
