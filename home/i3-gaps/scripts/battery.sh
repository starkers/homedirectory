#!/usr/bin/env bash
BATTERY=0

# LOGO="  "


while true ; do
  DATA1="$(/usr/bin/upower -i /org/freedesktop/UPower/devices/battery_BAT${BATTERY} | grep percent)"
  DATA2="$(/usr/bin/upower -i /org/freedesktop/UPower/devices/battery_BAT${BATTERY} | grep "time to empty")"
  DATA3="$(/usr/bin/upower -i /org/freedesktop/UPower/devices/battery_BAT${BATTERY} | grep "state")"

  if ! grep -q "discharging" <<<$DATA3 ; then
    PERCENT="$(echo $DATA1 | awk '{print $2}')"
    echo "$PERCENT (Charging)"
  else
    PERCENT="$(echo $DATA1 | awk '{print $2}')"
    TIME_LEFT="$(echo $DATA2 | awk '{print $4, $5}')"
    echo "$PERCENT ($TIME_LEFT)"
  fi
  sleep 10
done

# i3status -c $HOME/.config/i3blocks/i3status.conf | while IFS= read -r line; do
#     PARTS=($line)

#     CHARGE="${PARTS[1]}"
#     CHARGE="${CHARGE%\%*}"
#     [[ "${CHARGE}" -gt 100 ]] && {
#         CHARGE="100"
#     }

#     STATE=""
#     [[ "${PARTS[0]}" = "BAT" ]] && {
#         STATE="${PARTS[2]}"
#         [[ -z "${STATE}" ]] && STATE="??:??:00"

#         STATE="${STATE:0:-3}"
#         STATE=" (${STATE})"
#     }

#     LEVEL=$(( (CHARGE - 1) / 20 ))
#     ICON="f$(( 244 - LEVEL ))"

#     echo -e "  \u${ICON}  ${CHARGE}${STATE} "

#     [[ "${LEVEL}" = "0" ]] && {
#         [[ -z "${STATE}" ]] || i3-msg "fullscreen disable"
#     }
# done
