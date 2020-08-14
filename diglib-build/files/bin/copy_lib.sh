#!/bin/sh

# Start copy process in background
echo "0" > /tmp/copy_success.txt

echo "Starting copy process" > /tmp/copy.txt

# Start rsync and append output to file so that it can be read concurrently by display process.
rsync -ra --info=progress2 /mnt/sda1/* /mnt/sdb1   >> /tmp/copy.txt; COPY_SUCCESS=$?
#rsync -ra --info=progress2 /mnt/sda1/art /mnt/sdb1 >> /tmp/copy.txt; COPY_SUCCESS=$?   # Testing

if [ "$COPY_SUCCESS" == "0" ]; then
	echo "1" > /tmp/copy_success.txt # Success
else
	echo "2" > /tmp/copy_success.txt # Fail
fi

rm /tmp/copying.txt  # Remove copying flag


