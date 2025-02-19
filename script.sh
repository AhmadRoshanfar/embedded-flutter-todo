#!/bin/bash
export XDG_SESSION_TYPE=x11
export DISPLAY=:0
export PATH=$PATH:/opt/flutter-elinux/bin
xrandr --output HDMI-1 --rotate right
cd ~/Documents/flutter_todo || exit 1
flutter-elinux run -d elinux-x11
