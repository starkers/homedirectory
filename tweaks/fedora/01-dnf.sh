#!/usr/bin/env bash
set -e


declare -a packages_fedora=(
  ImageMagick
  adapta-backgrounds
  adwaita-icon-theme
  android-tools
  atop
  awscli
  bat
  bluecurve-icon-theme
  chromium
  cmake
  code
  copyq
  ctags
  direnv
  docker-compose
  evolution-ews
  expect
  expect
  faience-icon-theme
  figlet
  fish
  flameshot
  flatpak
  flatpak-builder
  fortune-mod
  fzf
  gcc
  gcc-c++
  git
  gitflow
  glances
  gnome-colors-icon-theme
  gnome-shell-theme-flat-remix
  gnome-shell-theme-selene
  gnome-shell-theme-yaru
  gnome-tweaks
  golang
  google-cloud-sdk
  gstreamer1-libav
  htop
  jq
  libcurl
  libcurl-devel
  links
  lm_sensors
  make
  meld
  mlocate
  moka-icon-theme
  mpv
  ncdu
  nodejs
  ntpsec
  numix-icon-theme-circle
  numix-icon-theme-square
  obs-studio
  openssl-devel
  pavucontrol
  podman-compose
  podman-docker
  pwgen
  python3-devel
  python3-virtualenv
  redhat-lsb-core
  ripgrep
  rofi
  rofi
  rofi-themes
  seafile-client
  snapd
  the_silver_searcher
  tig
  tilix
  tlp
  transmission
  v4l2loopback
  virt-manager
  xclip
  youtube-dl
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
