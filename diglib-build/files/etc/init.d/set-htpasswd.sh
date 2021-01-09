#!/bin/sh /etc/rc.common
START=99

start()
{	
grep -E "^(admin|root)"  /etc/shadow | cut -d : -f 1,2 > /etc/lighttpd/htpasswd

}

