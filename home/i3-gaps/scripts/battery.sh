#!/usr/bin/env bash
BATTERY=0

# LOGO="  "

get_battery(){
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
}

get_battery

