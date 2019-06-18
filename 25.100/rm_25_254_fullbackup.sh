#!/bin/bash
#
#删除25.254/fullbackup两个月之前的备份
/bin/find /mnt/data2/192.168.25.254/full_backup/ -type f  -mtime +60 -exec rm {} \;

