#!/bin/sh

choice=$(echo "shutdown\nreboot\nexit" | dmenu)

[ $choice = "shutdown" ] && doas poweroff
[ $choice = "reboot" ] && doas reboot
[ $choice = "exit" ] && pkill dwm
