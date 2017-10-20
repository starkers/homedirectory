#!/usr/bin/env bash

# this uses AUR: aur/i3lock-blur

inactivity_timeout=10 #how long to wait before turning off monitor
i3lock -I ${inactivity_timeout} -e --blur

# pkill i3lock

# scrot -e 'convert $f -blur 8x8 $f && ( i3lock --pointer=default -i $f && rm $f)'

# tmpd="$(mktemp -d)"
# lockimg="${tmpd}/image.png"
# image="$HOME/.config/i3/wallpapers/default"
# convert "$image" "$lockimg"
# i3lock -i "$lockimg"
# rm -rf "$tmpd"
