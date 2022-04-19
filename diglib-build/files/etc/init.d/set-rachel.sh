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
mkdir -p /mnt/mmcblk0p3

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
if [ -e "/dev/mmcblk0p3" ]; then
mount -rw /dev/mmcblk0p3  /mnt/mmcblk0p3
fi

# Remove old links
rm /www/library
rm /www/library-local2

# Find Library memory devices and link.
# Case 1. Check for a primary Library memory device on "sda1" to use for main library.
if [ -e "/dev/sda1" ] && [ -e "/mnt/sda1/##LIBRARY##" ]; then
	rm /www/library
	ln -s -f /mnt/sda1	/www/library
	mkdir -p /mnt/sda1/temp   # Make temp directory for uploading
  mkdir -p /mnt/sda1/cache  # Make cache directory  
	# Check for secondary memory device on "sdb1" to use for additional local content.
	if [ -e "/dev/sdb1" ]; then 
		ln -s -f /mnt/sdb1 /www/library-local2
	fi
# Case 2. Check for primary Library memory device on "sdb1" to use for main library.
elif [ -e "/dev/sdb1" ] && [ -e "/mnt/sdb1/##LIBRARY##" ]; then
	rm /www/library
	ln -s -f /mnt/sdb1	/www/library
	mkdir -p /mnt/sdb1/temp   # Make temp directory for uploading
  mkdir -p /mnt/sdb1/cache  # Make cache directory  
	# Check for secondary memory device on "sda1" to use for additional local content.
	if [ -e "/dev/sda1" ]; then 
		ln -s -f /mnt/sda1 /www/library-local2
	fi
# Case 3. Check for primary Library memory device on "mmcblk0p3" (for RPi) to use for main library.
elif [ -e "/dev/mmcblk0p3" ] && [ -e "/mnt/mmcblk0p3/##LIBRARY##" ]; then
	rm /www/library
	ln -s -f /mnt/mmcblk0p3 /www/library
	mkdir -p /mnt/mmcblk0p3/temp  # Make temp directory for uploading
	mkdir -p /mnt/mmcblk0p3/cache # Make cache directory
	# Check for secondary memory device on "sdb1" to use for additional local content.
	if [ -e "/dev/sda1" ]; then 
		ln -s -f /mnt/sda1 /www/library-local2
	fi
# Case 4. Check for non-Library memory device on "sda1" to use for main library.
elif [ -e "/dev/sda1" ]; then
	rm /www/library
	ln -s -f /mnt/sda1	/www/library
	mkdir -p /mnt/sda1/temp   # Make temp directory for uploading
	mkdir -p /mnt/sda1/cache  # Make cache directory
	# Check for secondary memory device on "sdb1" to use for additional local content.
	if [ -e "/dev/sdb1" ]; then 
		ln -s -f /mnt/sdb1 /www/library-local2
	fi
# Case 5. No memory device on "sda1" or "mmcblk0p3" so so just use the default home page. No cache or temp.
else
	rm /www/library
	ln -s -f /www/library-x /www/library
	if [ -e "/dev/sdb1" ]; then 
		ln -s -f /mnt/sdb1 /www/library-local2
	fi
fi

exit
# -----------------------------



