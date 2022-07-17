#! /bin/sh

# Purge the Polipo on-disk cache
		polipo_pid=$(cat /var/run/polipo.pid)
		kill -USR1 $polipo_pid
		sleep 1
		polipo -c /tmp/etc/polipo.conf -x > /dev/null
		kill -USR2 $polipo_pid


