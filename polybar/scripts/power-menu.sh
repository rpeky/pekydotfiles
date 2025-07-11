#!/bin/bash

case "$1" in
  lock) ~/.local/bin/lockscreen ;;
  logout) i3-msg exit ;;
  reboot) systemctl reboot ;;
  shutdown) systemctl poweroff ;;
  suspend) systemctl suspend ;;
esac
