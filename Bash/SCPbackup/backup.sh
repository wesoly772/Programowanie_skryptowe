#!/bin/bash

BACKUP_FILES="/home/kali/Documents"
SERVER="192.168.158.129"
USERNAME="kali"
DST_BACKUP_FOLDER="/home/backups_remote"
BACKUP_DIR="$HOME/all_backups"
BACKUP_NAME="${USER}_$(date +%Y-%m-%d_%H-%M-%S).tar.gz"


if [ ! -d "$BACKUP_DIR" ]; then
    mkdir -p "$BACKUP_DIR"
fi


tar -czf "$BACKUP_DIR/$BACKUP_NAME" "$BACKUP_FILES"


scp "$BACKUP_DIR/$BACKUP_NAME" "$USERNAME@$SERVER:$DST_BACKUP_FOLDER"


if [ $? -eq 0 ]; then
    echo "Success."
else
    echo "Error occured."
fi




