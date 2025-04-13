#!/bin/sh

DEVICE="/dev/$1"
MOUNT_POINT="/mnt/usb"

MOUNT_POINT="$MOUNT_POINT/$(basename $DEVICE)"

mkdir -p "$MOUNT_POINT"

mount "$DEVICE" "$MOUNT_POINT"