#!/usr/bin/env bash

# use nmcli to see if a vpn is --active

function anyActiveVPN(){
  local stat="$(nmcli c show --active  | grep vpn |  awk '{print $3}' )"
  if [ $(wc -c <<<"${stat}") -gt 1 ]; then
    # string "vpn" found in nmcli c show == VPN is active
    return 0
  else
    # not active
    return 1
  fi
}

## assumes a VPN (and only one) is active
## TODO: support multiple VPNs
function getVpnName(){
  nmcli c show --active | grep vpn | awk '{print $1}' | head -1
}

if anyActiveVPN ; then
  names="$(getVpnName)"
  echo " $names"
  # echo "#33CC00"
else
  echo ""
  # echo "#CC0000"
fi
