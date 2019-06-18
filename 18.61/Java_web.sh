#!/bin/bash


export RSYNC_PASSWORD="gxRya8Io"

nice -n 20 rm -rf /opt/backup/192_168_25_232/carl_$(date -d -14day +"%Y%m%d")
test -d /opt/backup/192_168_25_232/carl/ || mkdir -p /opt/backup/192_168_25_232/carl/
nice -n 20 rsync -avP --delete root@192.168.25.232::Java_web /opt/backup/192_168_25_232/carl/
wait
nice -n 20 cp -a /opt/backup/192_168_25_232/carl /opt/backup/192_168_25_232/carl_$(date +"%Y%m%d")/


unset $RSYNC_PASSWORD


