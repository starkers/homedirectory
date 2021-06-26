#!/bin/sh
gsettings set org.gnome.desktop.wm.preferences resize-with-right-button true
gsettings set org.gnome.desktop.wm.preferences mouse-button-modifier '<Alt>'
gsettings set org.gnome.desktop.interface clock-show-seconds true


dconf write /org/gnome/shell/extensions/nothing-to-say/keybinding-toggle-mute '["<Super>Space", "Pause"]'



