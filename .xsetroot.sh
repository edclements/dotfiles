
if grep -qr 'Battery' /sys/class/power_supply/*/type; then
  BATT=$( acpi | sed -n "s/.* \([0-9]\+\)%,.*/\1/p" )
  if acpi | grep -q 'Discharging'; then
    if [ "$BATT" -lt "10" ]; then
      BATT=" $BATT% "
    elif [ "$BATT" -lt "20" ]; then
      BATT=" $BATT% "
    elif [ "$BATT" -lt "30" ]; then
      BATT=" $BATT% "
    elif [ "$BATT" -lt "40" ]; then
      BATT=" $BATT% "
    elif [ "$BATT" -lt "50" ]; then
      BATT=" $BATT% "
    elif [ "$BATT" -lt "60" ]; then
      BATT=" $BATT% "
    elif [ "$BATT" -lt "70" ]; then
      BATT=" $BATT% "
    elif [ "$BATT" -lt "80" ]; then
      BATT=" $BATT% "
    elif [ "$BATT" -lt "90" ]; then
      BATT=" $BATT% "
    else
      BATT=" $BATT% "
    fi
  fi
else
  BATT=""
fi

DATE=$( date +"%F %R" )

xsetroot -name "$BATT$DATE"
