#! /bin/sh

# Purge the on-disk cache
		polipo-pid=$(cat /var/run/polipo.pid)
		kill -USR1 polipo-pid
		sleep 1
		polipo -c /tmp/etc/polipo.conf -x > /dev/null
		kill -USR2 polipo-pid


