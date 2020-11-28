#! /bin/sh

# Wait for memory devices to be available
sleep 5

# ------------------------------

# Mount the memory devices.

# Make dirs in case it is first boot
mkdir -p /mnt/sda1
mkdir -p /mnt/sdb1
mkdir -p /mnt/sdc1
mkdir -p /mnt/sdd1

if [ -e "/dev/sda1" ]; then
mount -rw /dev/sda1  /mnt/sda1
fi
if [ -e "/dev/sdb1" ]; then
mount -rw /dev/sdb1  /mnt/sdb1
fi
if [ -e "/dev/sdc1" ]; then
mount -rw /dev/sdc1  /mnt/sdc1
fi
if [ -e "/dev/sdd1" ]; then
mount -rw /dev/sdd1  /mnt/sdd1
fi

# Remove old links
rm /www/rachel
rm /www/rachel-local2

# Find Library memory devices and link.
# Case 1. Check for a primary Library memory device on "sda1" to use for main library.
if [ -e "/dev/sda1" ] && [ -e "/mnt/sda1/##LIBRARY##" ]; then
	rm /www/rachel
	ln -s -f /mnt/sda1	/www/rachel
	mkdir -p /mnt/sda1/temp # Make temp directory for uploading
	# Check for secondary memory device on "sdb1" to use for additional local content.
	if [ -e "/dev/sdb1" ]; then 
		ln -s -f /mnt/sdb1 /www/rachel-local2
	fi
# Case 2. Check for primary Library memory device on "sdb1" to use for main library.
elif [ -e "/dev/sdb1" ] && [ -e "/mnt/sdb1/##LIBRARY##" ]; then
	rm /www/rachel
	ln -s -f /mnt/sdb1	/www/rachel
		mkdir -p /mnt/sdb1/temp # Make temp directory for uploading
	# Check for secondary memory device on "sda1" to use for additional local content.
	if [ -e "/dev/sda1" ]; then 
		ln -s -f /mnt/sda1 /www/rachel-local2
	fi
# Case 3. Check for non-Library memory device on "sda1" to use for main library.
elif [ -e "/dev/sda1" ]; then
	rm /www/rachel
	ln -s -f /mnt/sda1	/www/rachel
	mkdir -p /mnt/sda1/temp # Make temp directory for uploading
	# Check for secondary memory device on "sdb1" to use for additional local content.
	if [ -e "/dev/sdb1" ]; then 
		ln -s -f /mnt/sdb1 /www/rachel-local2
	fi
# Case 4. No memory device on "sda1" so so just use the default home page.
else
	rm /www/rachel
	ln -s -f /www/rachel-x /www/rachel
fi

exit
# -----------------------------



