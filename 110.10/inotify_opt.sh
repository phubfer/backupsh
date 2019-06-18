#!/bin/bash
#实时同步/mnt/data1 to /mnt/data2
#
rsync -avz --delete /opt/* rsync_backup@192.168.110.21::backup --password-file=/etc/rsync.password
/usr/bin/inotifywait -mrq --timefmt "%F %T" --format "%T %w%f 事件信息:%e" -e create,delete,moved_to,close_write  /mnt/data1|while read file
do
  rsync -avz --delete /opt/* rsync_backup@192.168.110.21::backup --password-file=/etc/rsync.password 
  echo "$file is rsyncd" >>/var/log/rsyncd.log 2>&1
done
