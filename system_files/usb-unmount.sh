#!/bin/sh

DEVICE="/dev/$1"
MOUNT_POINT="/mnt/usb"

MOUNT_POINT="$MOUNT_POINT/$(basename $DEVICE)"

if mountpoint -q "$MOUNT_POINT"; then
    umount "$MOUNT_POINT"

    rmdir "$MOUNT_POINT" 2>/dev/null
else
    echo "Unmount failed"
fi