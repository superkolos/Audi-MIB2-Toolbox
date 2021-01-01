#!/bin/sh

# Make it writable
mount -uw /mnt/app

echo "Copying scripts from sda0"
cp -r /fs/sda0/Phone/Apps/0/default /eso/bin/PhoneCustomer 
chmod a+rwx /eso/bin/PhoneCustomer/*

echo "Copying new payload to mlbcoding.esd"
cp /fs/sda0/Menu/payload_mlb.sh /eso/hmi/engdefs/mlbcoding.esd

# Make readonly again
mount -ur /mnt/app

echo Done.
echo Please restart MMI!

exit 0
