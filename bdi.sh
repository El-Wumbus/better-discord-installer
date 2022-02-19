#!/bin/bash

printf "enter the flavor of discord you will be using. A list of options below.\n\n"
printf "Stable [default]; don't enter anything\n"
printf "PTB [ptb]\n"
printf "Canary [canary]\n"
printf "Snap [snap]\n"
printf "Flatpak [fltpk]\n"

read -rp "enter a selection, for defualt, enter nothing: " selection

curl -O https://raw.githubusercontent.com/bb010g/betterdiscordctl/master/betterdiscordctl
sudo chmod +x ./betterdiscordctl
sudo mv ./betterdiscordctl /usr/local/bin

if [ "${selection}" == "" ]; then
  betterdiscordctl install
elif [ "${selection}" == "ptb" ]; then
  betterdiscordctl --flavor PTB install
elif [ "${selection}" == "canary" ]; then
  betterdiscordctl --flavor Canary install
elif [ "${selection}" == "snap" ]; then
  betterdiscordctl --d-install snap 
elif [ "${selection}" == "fltpk" ]; then
  betterdiscordctl --d-install flatpak install
else
  printf "improper input"
fi