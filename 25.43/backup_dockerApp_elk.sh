#!/bin/bash
#
#每周全量备份 /usr/local/dockerApp/elk 除/usr/local/dockerApp/elk/elkdata/esdata外 to 192.168.25.100
cd /
/bin/tar zcf /tmp/dockerApp_elk.$(date +%F_%H_%M_%S).tar.gz usr/local/dockerApp/elk/ --exclude=usr/local/dockerApp/elk/elkdata/esdata
/usr/bin/rsync -avz /tmp/dockerApp_elk.*.tar.gz rsync_backup@192.168.25.100::backup/192.168.25.43/fullbackup_dockerApp --password-file=/etc/rsync.password
/bin/rm -f /tmp/dockerApp_elk.*.tar.gz
