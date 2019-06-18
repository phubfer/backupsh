#!/bin/bash
#
#备份opt至另外一块硬盘
#
dd if=/dev/sdb1 of=/dev/??sdc1??
/usr/bin/inotifywait -mrq --timefmt "%F %T" --format "%T %w%f 事件信息:%e" -e create,delete,moved_to,close_write  /opt|while read file
do
    /usr/bin/rsync -avz --delete /opt /????? && echo "$file is rsyncd" >>/var/log/backup_opt.log 2>&1
done
