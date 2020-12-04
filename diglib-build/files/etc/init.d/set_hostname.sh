#!/bin/sh

HOSTNAME="Digital-Library"
ipaddr=$(uci -q get network.lan.ipaddr)

# Set the hostname
uci set system.@system[0].hostname=$HOSTNAME
uci commit system

# Set the hostname as the Common Name in the SSL certificate for the web server.
#uci set uhttpd.px5g.commonname=$HOSTNAME
#uci commit uhttpd

# Set the system hostname
echo $(uci get system.@system[0].hostname) > /proc/sys/kernel/hostname

# Put hostname in hosts file to ensure it can be resolved.
# Remove old entry
sed -i "/$HOSTNAME/d" /etc/hosts
# Make new entry
echo "$ipaddr $HOSTNAME" >> /etc/hosts

# Restart dnsmasq to get hostname
/etc/init.d/dnsmasq restart
