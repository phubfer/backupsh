#!/bin/bash
#
#每周全量备份 /usr/local/dockerApp/zabbix-server to 192.168.25.100
cd /
/bin/tar zcf /tmp/dockerApp_zabbix-server.$(date +%F_%H_%M_%S).tar.gz usr/local/dockerApp/zabbix-server/
/usr/bin/rsync -avz /tmp/dockerApp_zabbix-server.*.tar.gz rsync_backup@192.168.25.100::backup/192.168.25.43/fullbackup_dockerApp --password-file=/etc/rsync.password
/bin/rm -f /tmp/dockerApp_zabbix-server.*.tar.gz
