#!/usr/bin/env sh
install_betterdiscordctl() {
  bindir="/opt/betterdiscordctl/bin"
  sudo mkdir -P ${bindir} || return 1                                                                                    # Make the bindir else return failure
  curl https://raw.githubusercontent.com/bb010g/betterdiscordctl/master/betterdiscordctl -o "${bindir}/betterdiscordctl" # Download the executable to bindir
  sudo chmod +x "${bindir}"/betterdiscordctl                                                                             # ensure the executable has executable permissions

}

find_discord_version() {
  flatpak_discord_location_sys="/var/lib/flatpak/app/com.discordapp.Discord/"
  flatpak_discord_location_usr="${HOME}/.local/share/flatpak/app/com.discordapp.Discord/"
  snap_discord_file_location="/var/lib/snapd/snap/bin/discord"
  discord_location="/opt/discord"
  discord_canary_location="/opt/discord-canary"
  discord_ptb_location="/opt/discord-ptb"

  if [ -d "${discord_location}" ]; then discord=true; fi
  if [ -d "${discord_canary_location}" ]; then discord_canary=true; fi
  if [ -d "${discord_ptb_location}" ]; then discord_ptb=true; fi
  if [ -d "${snap_discord_file_location}" ]; then discord_snap=true; fi
  if [ -d "${flatpak_discord_location_sys}" ] || [ -d "${flatpak_discord_location_usr}" ]; then discord_flatpak=true; fi
}

if [ "${1}" = "list-types" ]; then
  echo "Stable"
  echo "ptb"
  echo "canary"
  echo "snap"
  echo "flatpak"
elif [ "${1}" -eq "" ]; then
  if [ "${1}" = "stable" ]; then discord=true; fi
  if [ "${1}" = "canary" ]; then discord_canary=true; fi
  if [ "${1}" = "ptb" ]; then discord_ptb=true; fi
  if [ "${1}" = "snap" ]; then discord_snap=true; fi
  if [ "${1}" = "flatpak" ]; then discord_flatpak=true; fi
else
  {
    find_discord_version || exit 1
  }
fi

install_betterdiscordctl || exit 1
bdc="${bindir}/betterdiscordctl"

if [ ${discord} ]; then
  ${bdc} install
elif [ ${discord_canary} ]; then
  ${bdc} --flavor Canary install
elif [ ${discord_ptb} ]; then
  ${bdc} --flavor PTB install
elif [ ${discord_snap} ]; then
  ${bdc} --d-install snap
elif [ ${discord_flatpak} ]; then
  ${bdc} --d-install flatpak install
else echo "Couldn't detect a discord install, manually declare an installation type with ${0} [type], to view types use ${0} list-types"; fi
