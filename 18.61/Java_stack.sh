#!/bin/bash


export RSYNC_PASSWORD="zynNmJoFR1ln"


nice -n 20 rm -rf /opt/backup/192_168_25_221/opt_$(date -d -14day +"%Y%m%d")
test -d /opt/backup/192_168_25_221/opt/ || mkdir -p /opt/backup/192_168_25_221/opt/
nice -n 20 rsync -avP --delete root@192.168.25.221::Java_stack /opt/backup/192_168_25_221/opt/
wait
nice -n 20 cp -a /opt/backup/192_168_25_221/opt /opt/backup/192_168_25_221/opt_$(date +"%Y%m%d")/


unset $RSYNC_PASSWORD


