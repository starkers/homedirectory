#!/usr/bin/env bash
set -e

declare -a extra_groups=(
  docker
  mpd
  vboxusers
)

declare -a arch_packages=(
  abricotine
  android-sdk-platform-tools
  antigen-git
  arandr
  atom
  atool
  bat
  bitwarden-bin
  bombardier
  chrome-gnome-shell
  compton
  copyq
  correcthorse
  ctags
  direnv
  dep
  docker
  docker-compose
  dunst
  fail2ban
  feh
  figlet
  firefox
  flake8
  flameshot
  # flatpak
  fzf
  gitkraken
  gksu
  go
  google-cloud-sdk
  gthumb
  htop
  httpie
  i3-gaps
  i3blocks
  i3lock-fancy-dualmonitors-git
  ipython
  jdk8-openjdk
  jq
  keybase-bin
  kubectl-bin
  libreoffice-fresh-en-gb
  lynx
  mc
  minikube-bin
  mpd
  mpv
  mtr
  ncdu
  ncmpc
  neovim
  nerd-fonts-complete
  nload
  ntpdate
  openssh
  pinta
  pv
  pwgen
  python-cheat
  python-neovim
  python-pip
  python-virtualenv
  python2-virtualenv
  ranger
  rofi
  rsync
  scrot
  silver-searcher-git
  sipcalc
  sipcalc
  slack-desktop
  sonata
  sysstat
  terminator
  thunderbird
  tig
  tilix
  tiny-media-manager-bin
  tmux
  vagrant
  vim
  virtualbox
  virtualbox-guest-iso
  virtualbox-host-dkms
  volumeicon
  xautolock
  xclip
  xdotool
  xinit-xsession
  xorg-xbacklight
  xsel
  zsh
)

declare -a arch_services=(
  docker
  fail2ban
  mpd
  sshd
  sysstat
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
fi

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
