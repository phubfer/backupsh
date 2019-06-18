#!/bin/bash
#author:
#实时同步/mnt/data1 to /mnt/data2
#
/usr/bin/inotifywait -mrq --timefmt "%F %T" --format "%T %w%f 事件信息:%e" -e create,delete,moved_to,close_write  /mnt/data1|while read file
do
    /usr/bin/rsync -avz --delete /mnt/data1/ /mnt/data2/
    echo "$file is rsyncd" >>/var/log/rsyncd.log 2>&1
done
