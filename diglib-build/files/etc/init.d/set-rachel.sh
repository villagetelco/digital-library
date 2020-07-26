#! /bin/sh

# Wait for memory devices to be available
sleep 10

# ------------------------------

# Mount the memory device in case auto mount did not work.
# /dev/sda is primary USB and /dev/sdb is secondary USB 

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

#Set up default Rachel directory in case there are no memory devices installed
ln -s -f /www/rachel-x /www/rachel

# Find library memory device and link to it
# Check for primary USB library on "sda1"
if [ -e "/mnt/sda1/##LIBRARY##" ]; then
	rm /www/rachel
	ln -s -f /mnt/sda1	/www/rachel

	if [ -e "/dev/sdb1" ]; then # Check for secondary USB device to use for additional local content
		ln -s -f /mnt/sdb1 /www/rachel-local2
	fi
fi

exit
# -----------------------------



