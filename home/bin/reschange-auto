#!/usr/bin/env bash


# automatically detect if this is plugged into the screen at home, otherwise do nothing


say(){
  echo "$0: $@"
}

is_display_connected(){
  # accepts one variable
  # runs xrander, returns "1" (true) if that is a connected display
  local var="$1"

  DATA="$(xrandr)"
  if [ $? -gt 0 ]; then
    say "xrandr exited badly.. quitting"
    exit
  fi

  if grep -q "$var" <<<"$DATA" ; then
    say "matched: $var"
    return 0
  else
    say "failed to match: $var"
    return 1
  fi

}


if is_display_connected "HDMI-1 connected 3440x1440" ; then
# if is_display_connected "HDMI-1 connected 3440x1440+0+0" ; then
# if is_display_connected "HDMI-1 connected 3440x1440+1920+0" ; then
  say "Looks like I'm connected to the big display at home"
  xrandr --output HDMI-2 --off --output HDMI-1 --mode 3440x1440 --pos 0x0 --rotate normal --output DP-1 --off --output eDP-1 --off --output DP-2 --off
  gsettings set org.gnome.desktop.interface scaling-factor 1
  feh --bg-fill $HOME/.config/i3/wallpapers/octocat.jpg
  /usr/bin/setxkbmap gb
  /usr/bin/setxkbmap -option "terminate:ctrl_alt_bksp"
else
  say "not connected to anything fancy, doing defaults"
  reschange "default"
fi
