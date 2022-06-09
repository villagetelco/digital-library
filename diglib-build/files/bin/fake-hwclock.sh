#!/bin/sh

{

# Wait 5 mins to see if NTP has set the time
sleep 300
# Save the time
date -Iminutes | cut -d + -f1 | sed s/T/+/ > /etc/fake-hwclock.data

# Save the time every hour
while (true); do
sleep 3600
date -Iminutes | cut -d + -f1 | sed s/T/+/ > /etc/fake-hwclock.data
done

} >/dev/null 2>&1   
