#!/bin/sh
pc () {
  nitrogen --restore &
  pgrep -x picom > /dev/null || picom -b &
  pgrep -x dwmbar-colored > /dev/null || dwmbar-colored &
  dunst &
  xrandr --output HDMI-0 --mode 2560x1080 --rate 100 &
  nvidia-settings --load-config-only &
  nvidia-settings -a "DigitalVibrance=300" &
  brightnessctl -d "intel_backlight" set 0% &
  xinput disable "SYNA7DB5:01 06CB:CD41 Touchpad" &
  xinput disable "HD User Facing: HD User Facing" &
  xsetroot -cursor_name cross & 
  xset r rate 350 75 &
  startpage.sh &
  xsetwacom --set "Wacom One by Wacom S Pen stylus" Button 2 "pan" &
  xsetwacom --set "Wacom One by Wacom S Pen stylus" "PanScrollThreshold" 200 &
  echo "PC"
}
laptop () {
  nitrogen --restore &
  pgrep -x dwmbar-colored > /dev/null || dwmbar-colored &
  dunst &
  xsetroot -cursor_name cross & 
  xset r rate 350 75 &
  xsetwacom --set "Wacom One by Wacom S Pen stylus" Button 2 "pan" &
  xsetwacom --set "Wacom One by Wacom S Pen stylus" "PanScrollThreshold" 200 &
  startpage.sh &
  echo "LAPTOP"
}

autoStart () {
  if test -f "/etc/X11/xorg.conf.d/20-nvidia.conf"; then
    pc 
  else
    laptop
  fi
}

fuckme () {
  # xsetwacom --set "Wacom One by Wacom S Pen stylus" Button 2 "pan" &
  # xsetwacom --set "Wacom One by Wacom S Pen stylus" "PanScrollThreshold" 200 &
  notify-send "Super is back" &
}

case "$1" in
  autostart)
    autoStart
    ;;
  fuckme)
    fuckme
    ;;
  *)
    autoStart
    exit 1
    ;;
esac
