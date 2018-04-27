#!/usr/bin/env bash
set -e

declare -a extra_groups=(
  docker
)

declare -a arch_packages=(
  antigen-git
  arandr
  atool
  compton
  copyq
  correcthorse
  direnv
  docker
  docker-compose
  fail2ban
  feh
  firefox
  flameshot
  fzf
  gitkraken
  go
  gthumb
  htop
  i3-gaps
  i3blocks
  keybase-bin
  libreoffice-fresh-en-gb
  lynx
  mc
  mpv
  ncdu
  neovim
  ntpdate
  openssh
  pwgen
  python-cheat
  python-neovim
  python-virtualenv
  python2-virtualenv
  ranger
  rofi
  rsync
  scrot
  seafile-client
  silver-searcher-git
  slack-desktop
  sysstat
  terminator
  thunderbird
  tig
  tilix
  tmux
  vim
  volumeicon
  xclip
  xdotool
  xorg-xbacklight
  xsel
  zsh
)

declare -a arch_services=(
  docker
  fail2ban
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
