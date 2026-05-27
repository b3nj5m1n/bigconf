#!/usr/bin/env sh

if [ "$(id -u)" -ne 0 ]; then
  echo "This script must be run as root"
  exit 1
fi

WALLPAPER_LOCATION="/usr/local/share/wallpaper"

mkdir -p "$WALLPAPER_LOCATION"

cp "./blackhole-smooth-240x67.dur" "$WALLPAPER_LOCATION/blackhole.dur"
