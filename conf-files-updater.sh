#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
USER=/home/$(echo $DIR | cut -d/ -f3)

declare -A loc5=(
    [name]="icons"
    [local]="./icons/*"
    [remote]="$USER/.icons/"
)
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
declare -A loc53=(
    [name]="anki"
    [local]="./anki/bin/aqt_data/*"
    [remote]="/usr/share/aqt_data/"
)
declare -A loc59=(
    [name]="anki2"
    [local]="./Anki2/*"
    [remote]="$USER/.local/share/Anki2/"
)
# declare -A loc60=(
#     [name]="assets"
#     [local]="./assets/*"
#     [remote]="$USER/assets/"
# )
declare -A loc61=(
    [name]="grubthemes"
    [local]="./grub/*"
    [remote]="/usr/share/grub/themes/"
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
