# Date and time
date=$(date "+%a, %d %b")
current_time=$(date "+%T")

# Battery or charger
battery_charge=$(upower --show-info $(upower --enumerate | grep 'BAT') | egrep "percentage" | awk '{print $2}')

# Temperature
temp=$(head -c 2 /sys/class/thermal/thermal_zone0/temp)

# Fan
fanRPM=$(sensors | grep fan | cut -d: -f2 | tr -s ' ')

#Wifi
wifiessid="$(iw dev wlp2s0 link | grep SSID | cut -d: -f2)"
wifiawk="$(echo $wifiessid | awk -F',' '{gsub(/"/, "", $1); print $1}')"
wificut="$(echo $wifiawk | cut -d' ' -f1)"

# echo -e "[WIFI: $wificut] [FAN:$fanRPM] [TEMP: $temp°C] [BAT: $battery_charge] | $date $current_time "
echo -e "WIFI: $wificut | FAN:$fanRPM | TEMP: $temp°C | BAT: $battery_charge | $date $current_time "
