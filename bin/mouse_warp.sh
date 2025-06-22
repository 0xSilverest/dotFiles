#!/bin/bash

while true; do
  eval $(xdotool getmouselocation --shell)
  if [ $Y -gt 1440 ] && [ $X -lt 1080 ]; then
    xdotool mousemove 1080 $Y
  fi
  sleep 0.01
done
