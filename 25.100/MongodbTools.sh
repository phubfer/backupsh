#!/bin/bash

backup_db_host="192.168.25.25"
backup_db_port="27017"

reduction_db_host="127.0.0.1"
reduction_db_port="27017"

db_name="$2"
now_time=$(date +"%Y_%m_%d")
backup_dir="/mnt/data1/mongo_shard/ananpudong/backup_${db_name}_${now_time}"

##定义不要的collection
no_collection="BindingRfid|ElderlyPersistenceSession|InstantTrack|MessageTempleteRecord|MonitorOnOffLine|MonitorRestart|TrackStatus|TrackHistory|OperationLogBack|StolenBicyclePush|WeiXinUserInfo2|androidExceptionLog"
#no_collection="ApWifiNew|MobileWifiNew|ApWifi|MobileWifi|InstantTrack|AndroidVersion|Maxtime|BicycleArea|TrackHistory|MBindingRfid|TrackUpload|MonitorOnOffLine|system.js|system.profile"

backup(){
##取出ananpudong数据库中的表名
local db_tables=$(mongo ${db_name} --host ${backup_db_host} --port ${backup_db_port} --eval "printjson(db.getCollectionNames())" | grep -i '"' | awk -F'"' '{print $2}')
mkdir -p ${backup_dir}
for i in $db_tables;do
  ##排除上面定义的不要的collection
  echo ${i} | grep -qE ''${no_collection}'' && continue
  
  echo $i
  mongodump --host ${backup_db_host} --port ${backup_db_port} -d ${db_name} -c ${i} --out=${backup_dir}/
  #mongoexport --host ${backup_db_host} --port ${backup_db_port} -d ${db_name} -c ${i} -o ${backup_dir}/${i}.json

done
}

##以下部分在本脚本中没有使用
##################################
reduction(){
test -d ${backup_dir} || echo "${backup_dir} is error !!!"
local db_tables=$(mongo ${db_name} --host ${backup_db_host} --port ${backup_db_port} --eval "printjson(db.getCollectionNames())" | grep -i '"' | awk -F'"' '{print $2}')
#local db_tables=$(ls ${backup_dir}/ | sort | awk -F '.' '{print $1}')
for i in $db_tables;do

  echo ${i} | grep -qE ''${no_collection}'' && continue
  echo $i

  mongorestore --host ${reduction_db_host} --port ${reduction_db_port} -d ${db_name} --drop -c ${i} --dir=${backup_dir}/${db_name}/${i}.bson
  #mongoimport --host ${reduction_db_host} --port ${reduction_db_port} -d ${db_name} --drop -c ${i} --file ${backup_dir}/${i}.json

done
}

case "$1" in
  'backup')
  backup
  ;;
  'reduction')
  reduction
  ;;
  *)
  echo "usage:$0  "\$1" 1.backup or 2.reduction and "\$2" db name "
  ;;
esac

exit 0
