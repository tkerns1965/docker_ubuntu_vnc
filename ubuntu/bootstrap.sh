#!/bin/bash
mkdir -p "$HOME/.vnc"
x11vnc -storepasswd "2hard4u" "$HOME/.vnc/passwd"
Xvfb $DISPLAY -screen 0 1366x768x24 &
sleep 5
startfluxbox &
sleep 5
x11vnc -display $DISPLAY -rfbport 5901 -usepw &
wait $!
