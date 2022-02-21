#!/bin/bash

printf "enter the flavor of discord you will be using. A list of options below.\n\n"
printf "Stable [default]; don't enter anything\n"
printf "PTB [ptb]\n"
printf "Canary [canary]\n"
printf "Snap [snap]\n"
printf "Flatpak [fltpk]\n"

read -rp "enter a selection, for defualt, enter nothing: " selection

function dInstall {
curl -O https://raw.githubusercontent.com/bb010g/betterdiscordctl/master/betterdiscordctl
sudo chmod +x ./betterdiscordctl
sudo mv ./betterdiscordctl /usr/local/bin
}
bdc="betterdiscordctl"
if [ "${selection}" == "" ]; then
  dInstall
  ${bdc} install
elif [ "${selection}" == "ptb" ]; then
  dInstall
  ${bdc} --flavor PTB install
elif [ "${selection}" == "canary" ]; then
  dInstall
  ${bdc} --flavor Canary install
elif [ "${selection}" == "snap" ]; then
  dInstall
  ${bdc} --d-install snap 
elif [ "${selection}" == "fltpk" ]; then
  dInstall
  ${bdc} --d-install flatpak install
else
  printf "improper input, cannot continue"
fi
