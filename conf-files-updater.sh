#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
USER=/home/$(echo $DIR | cut -d/ -f3)

declare -A loc4=(
    [name]="GTK themes"
    [local]="./gtk/*"
    [remote]="$USER/.themes/"
)
declare -A loc12=(
    [name]="icon locks"
    [local]="./icons/*"
    [remote]="$USER/.local/share/icons/"
)
declare -A loc19=(
    [name]="wallpapers"
    [local]="./wallpapers/.wallpapers/*"
    [remote]="/usr/share/wallpapers/custom/"
)
RED='\033[0;31m'
GREEN='\033[0;32m'
PURPLE='\033[1;35m'
REVERSE='\033[7m'
RESET='\033[0m'

declare -n loc
for loc in ${!loc@}; do
    printf "${PURPLE} Transfering ${REVERSE}${loc[name]}${RESET}"
    mkdir -p ${loc[remote]}
    cp -f -u -r -p ${loc[local]} ${loc[remote]}
    if [ $? -eq 0 ]; then
        printf "${GREEN} OK"
    else
        printf "${RED} ERROR"
    fi
    printf "\n"
done
