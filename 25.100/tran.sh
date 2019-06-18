#!/bin/bash

MongodbTool_path="/usr/local/sbin/MongodbTools.sh"


#bash /opt/bearhunting_db/stop.sh 
#wait
#rm -rf /opt/temp/backup_*
#sleep 10
#bash /opt/bearhunting_db/start.sh

#wait

bash ${MongodbTool_path} backup AnAnPuDong
#bash ${MongodbTool_path} backup HiveJDBC
#bash ${MongodbTool_path} backup Wifi
#
wait
/bin/tar zcf /mnt/data1/mongo_shard/ananpudong/mongobackup.$(date +%F_%H_%M_%S).tar.gz /mnt/data1/mongo_shard/ananpudong/backup_*/
rm -rf /mnt/data1/mongo_shard/ananpudong/backup_*
#/usr/bin/rsync -avz /opt/temp/backup_* rsync_backup@192.168.25.100::backup/192.168.18.61/temp --password-file=/etc/rsync.password
#bash ${MongodbTool_path} reduction AnAnPuDong
#bash ${MongodbTool_path} reduction HiveJDBC
#bash ${MongodbTool_path} reduction Wifi

#wait

#rm -rf /opt/temp/backup_*

