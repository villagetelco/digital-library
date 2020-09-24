#! /bin/sh

# Wait for memory devices to be available
sleep 5

# ------------------------------

# Mount the memory device in case auto mount did not work.
# /dev/sda is primary and /dev/sdb is secondary. 

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

#Set up default Library directory in case there are no memory devices installed
ln -s -f /www/rachel-x /www/rachel

# Find library memory devices and link.
# Check for primary memory device on "sda1" to use for main library.
if [ -e "/dev/sda1" ]; then
	rm /www/rachel
	ln -s -f /mnt/sda1	/www/rachel
fi

# Check for secondary memory device on "sdb1" to use for additional local content.
if [ -e "/dev/sdb1" ]; then 
	ln -s -f /mnt/sdb1 /www/rachel-local2
fi

exit
# -----------------------------



