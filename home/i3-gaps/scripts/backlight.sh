#!/usr/bin/env bash
sudo xbacklight "$@"
pkill -RTMIN+2 i3blocks
