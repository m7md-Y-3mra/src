#!/bin/bash

# Function to get network speed
get_network() {
  interface=$(ip route | grep '^default' | awk '{print $5}')
  rx_bytes_before=$(cat /sys/class/net/$interface/statistics/rx_bytes)
  tx_bytes_before=$(cat /sys/class/net/$interface/statistics/tx_bytes)
  sleep 1
  rx_bytes_after=$(cat /sys/class/net/$interface/statistics/rx_bytes)
  tx_bytes_after=$(cat /sys/class/net/$interface/statistics/tx_bytes)

  rx_speed=$(((rx_bytes_after - rx_bytes_before) / 1024))
  tx_speed=$(((tx_bytes_after - tx_bytes_before) / 1024))

  # Avoid showing 0 KB/s if no data is transmitted
  if [ "$rx_speed" -eq 0 ] && [ "$tx_speed" -eq 0 ]; then
    echo "NET: No activity"
  else
    echo "NET: ${rx_speed}KB/s ↓ ${tx_speed}KB/s ↑"
  fi
}

# Function to get Bluetooth status
get_bluetooth() {
  bt_status=$(bluetoothctl show | grep "Powered:" | awk '{print $2}')
  if [ "$bt_status" = "yes" ]; then
    echo "BT: On"
  else
    echo "BT: Off"
  fi
}

# Function to get CPU usage
get_cpu() {
  echo "CPU: $(grep -o "^[^ ]*" /proc/loadavg)"
}

# Function to get memory usage
get_memory() {
  echo "MEM: $(free -h | awk '/^Mem:/ { print $3 "/" $2 }')"
}

# Function to get battery status
get_battery() {
  if [ -d /sys/class/power_supply/BAT0 ]; then
    battery=$(cat /sys/class/power_supply/BAT0/capacity)
    battery_status=$(cat /sys/class/power_supply/BAT0/status)
    echo "BAT: ${battery}% $battery_status"
  fi
}

# Function to get date and time
get_datetime() {
  echo "$(date +"%Y-%m-%d %H:%M")"
}

# Function to get volume (PulseAudio)
get_volume() {
  volume=$(pactl list sinks | grep 'Volume:' | head -n 1 | awk '{print $5}')
  mute=$(pactl list sinks | grep 'Mute:' | head -n 1 | awk '{print $2}')
  if [ "$mute" = "yes" ]; then
    echo "VOL: Muted"
  else
    echo "VOL: ${volume}"
  fi
}

# Main loop
while true; do
  network=$(get_network)
  bluetooth=$(get_bluetooth)
  cpu=$(get_cpu)
  memory=$(get_memory)
  battery=$(get_battery)
  datetime=$(get_datetime)
  volume=$(get_volume)

  # Combine the information
  xsetroot -name "$network | $bluetooth | $cpu | $memory | $battery | $volume | $datetime"

  # Update every 10 seconds
  sleep 10
done
