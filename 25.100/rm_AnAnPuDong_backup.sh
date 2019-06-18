#!/bin/bash
#
#删除ananpudong数据库一月之前的备份
/bin/find /mnt/data1/mongo_shard/ananpudong/mongobackup.*.tar.gz -type f  -mtime +30 -exec rm {} \;
