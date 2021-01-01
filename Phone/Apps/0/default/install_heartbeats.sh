#!/bin/sh
TOPIC=Heartbeats

#info
DESCRIPTION="This script will install a new Welcomesound."

#Firmware/unit info:
VERSION="$(cat /net/rcc/dev/shmem/version.txt | grep "Current train" | sed 's/Current train = //g' | sed -e 's|["'\'']||g' | sed 's/\r//')"
FAZIT=$(cat /tmp/fazit-id);

echo "---------------------------"
echo $DESCRIPTION
echo FAZIT of this unit: $FAZIT
echo Firmware version: $VERSION
echo "---------------------------"
echo ""
sleep .5

#Is there any SD-card inserted?
if [ -d /net/mmx/fs/sda0 ]; then
    echo SDA0 found
    VOLUME=/net/mmx/fs/sda0
elif [ -d /net/mmx/fs/sdb0 ] ; then
    echo SDB0 found
    VOLUME=/net/mmx/fs/sdb0
else 
    echo No SD-cards found.
    exit 0
fi

sleep .5

echo Mounting SD-card.
mount -uw $VOLUME

sleep .5

#Make backup folder
BACKUPFOLDER=$VOLUME/Backup/$VERSION/$FAZIT/$TOPIC/

# Make app volume writable
echo Mounting app folder.
mount -uw /mnt/app

echo Making backup folders on SD-card.
mkdir -p $BACKUPFOLDER

echo Copying file to backup folder on SD-card.
cp /net/mmx/mnt/app/hb/ringtones/Heartbeat_48kHz.wav $BACKUPFOLDER

echo Copying modified files from SD folder to MIB.
cp /$VOLUME/$TOPIC/Heartbeat_48kHz.wav /net/mmx/mnt/app/hb/ringtones/Heartbeat_48kHz.wav
# Make readonly again
mount -ur /mnt/app
mount -ur $VOLUME

echo Done. 
echo "Please restart the unit to apply the new audio"
echo "Backups are placed at $BACKUPFOLDER"

exit 0
