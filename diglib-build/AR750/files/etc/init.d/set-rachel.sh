#! /bin/sh

# Wait for memory devices to be available
sleep 10

# ------------------------------

# Mount the memory devices
# /dev/sda is the USB and /dev/mmcblk0p1 is the MMC/SD card 

# Make dirs in case it is first boot
mkdir -p /mnt/sda1
mkdir -p /mnt/mmcblk0p1

# Un-mount the RACHEL memory devices.
umount  /mnt/sda1
umount  /mnt/mmcblk0p1

# Remove old links
rm /www/rachel
rm /www/rachel-local2

# Mount MMC/SD and USB memory devices and check for library flag
SDA=0
# Mount the memory devices and check for Library flag.                                     
if mount -rw /dev/sda1 /mnt/sda1; then
  if [ -e "/mnt/sda1/##LIBRARY##" ]; then
    SDA=1
  fi
fi  

MMC=0                                                                 
if mount -rw /dev/mmcblk0p1 /mnt/mmcblk0p1; then
  if [ -e "/mnt/mmcblk0p1/##LIBRARY##" ]; then
    MMC=1
  fi
fi

# Find contents directories and force link to /www/rachel

# Check for MMC/SD library alone
if [ $MMC == 1 ] && [ $SDA != 1 ]; then
	ln -s -f /mnt/mmcblk0p1 /www/rachel                                     
	if [ -e "/dev/sda1" ]; then # Check for secondary USB device to use for additional local content
		ln -s -f /mnt/sda1 /www/rachel-local2
	fi
                                                           
# Check for USB library alone
elif [ $MMC != 1 ] && [ $SDA == 1 ]; then 
	ln -s -f /mnt/sda1   /www/rachel

# Check for both USB and MMC/SD libraries present
elif [ $MMC == 1 ] && [ $SDA == 1 ]; then
	ln -s -f /mnt/sda1   /www/rachel  # Use just the USB library
	
else
	# There is no library memory device present
	if [ -e "/dev/sda1" ]; then # Check for non-library USB device to use for web content 
		ln -s -f /mnt/sda1 /www/rachel
	else
		ln -s -f /www/rachel-x   /www/rachel # No memory device at all - link to dummy menu page.
		ln -s -f /www/rachel/rachel.index.html   /www/rachel/index.html		
	fi
fi

exit
# -----------------------------



