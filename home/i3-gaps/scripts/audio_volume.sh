#! /usr/bin/env bash
###############################################################################
# Author:      David Stark
# Vim:         ts=2 et sw=2 sts=2
# Notes:       very simple volume control
#              on my laptop the "sink" (sound card) I'm interested in is number 1.. (num 0 was hdmi on my kit)
#               run "pactl list sinks short" to determine yours
###############################################################################


SINK="$(pactl list short sinks | grep output | head -n1 | cut -f2)"

#percentage to adjust on default
increments=3

mute(){
  pactl set-sink-mute $SINK true
}
unmute(){
  pactl set-sink-mute $SINK false
}

toggle(){
  pactl set-sink-mute $SINK toggle
}

adjust(){
  unmute
  pactl set-sink-volume $SINK "$1"%
}


case "$1" in
  inc)
    adjust "+${increments}"
    ;;
  dec)
    adjust "-${increments}"
    ;;
  toggle)
    toggle
    ;;
  *)
  echo "Usage: $0 [inc|dec|toggle]"
  exit 2
esac

