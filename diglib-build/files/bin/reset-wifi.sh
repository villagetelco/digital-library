#!/bin/sh

# This script is intended to be run manually to restore wifi configuration to original.
# Then adjust path for actual wifi device fitted. 

# Restore original wireless config
cp /etc/config/wireless.bak /etc/config/wireless.sav

# Get default config
rm -f /etc/config/wireless
wifi config
sleep 1

# Get the 'path'
path=$(uci get wireless.radio0.path)

# Save the default config for reference
mv /etc/config/wireless /etc/config/wireless.default

# Restore the wireless config file
mv /etc/config/wireless.sav /etc/config/wireless

# Set the path and remove the phy and save.
uci set wireless.radio0.path=$path
uci set wireless.radio0.phy=""
uci commit wireless

# Start wifi
wifi
sleep 1

exit

