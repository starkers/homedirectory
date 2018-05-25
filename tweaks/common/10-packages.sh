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
  atool
  chrome-gnome-shell
  compton
  copyq
  correcthorse
  ctags
  direnv
  docker
  docker-compose
  dunst
  fail2ban
  feh
  firefox
  flake8
  flameshot
  fzf
  gitkraken
  gksu
  go
  google-cloud-sdk-minimal
  gthumb
  htop
  i3-gaps
  i3blocks
  i3lock-fancy-dualmonitors-git
  keybase-bin
  kubectl-bin
  libreoffice-fresh-en-gb
  lynx
  mc
  minikube-bin
  mpd
  mpv
  ncdu
  ncmpc
  neovim
  nload
  ntpdate
  openssh
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
  seafile-client
  silver-searcher-git
  slack-desktop
  sonata
  sysstat
  terminator
  thunderbird
  tig
  tilix
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
