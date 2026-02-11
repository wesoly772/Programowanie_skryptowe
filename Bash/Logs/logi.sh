#!/bin/bash

OUTPUT=/home/kali/logsssh.log

journalctl -f -t sshd | while read line ;do
    if [[ "$line" == *"Failed password"*  || "$line" == *"Invalid user"* ]]; then
        echo "$line" >> "$OUTPUT"
    fi
done