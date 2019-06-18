#!/bin/bash
#
#删除dockerApp三个月之前的备份
/bin/find /mnt/data1/192.168.25.43/fullbackup_dockerApp -type f  -mtime +90 -exec rm {} \;
