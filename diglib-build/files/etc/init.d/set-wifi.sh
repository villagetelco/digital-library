#!/bin/sh

# Get default config
mv -n /etc/config/wireless /etc/config/wireless.sav
wifi config
sleep 1

# Get the 'path'
path=$(uci get wireless.radio0.path)

# Save the default config
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


