#!/bin/bash
/bin/tar zcf /tmp/prometheus.`date -d -60day +"%Y%m%d"`to`date +"%Y%m%d"`.tar.gz /var/lib/prometheus /etc/prometheus
/usr/bin/rsync -avz /tmp/prometheus.*.tar.gz rsync_backup@192.168.25.100::backup/192.168.25.43/backup_prometheus --password-file=/etc/rsync.password
/bin/rm -f /tmp/prometheus.*.tar.gz
