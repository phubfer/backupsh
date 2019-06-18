#!/bin/bash
#author:scott
#每周全量备份 ip route,/etc/iptables,/etc/nginx/,/etc/openvpn/ to 192.168.25.100
#
/usr/bin/zip -r /tmp/backup/sysinfo.`date \+%F_%H_%M_%S`.zip /etc/iptables /etc/nginx /etc/openvpn /tmp/iproute.txt 
/usr/bin/rsync -avz /tmp/backup/sysinfo.*.zip rsync_backup@192.168.25.100::backup/192.168.25.254/full_backup/ --password-file=/etc/rsync.password
