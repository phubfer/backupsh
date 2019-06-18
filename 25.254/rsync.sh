#!/bin/bash
#author:
#每天增量备份 ip route,/etc/iptables  差异备份/etc/nginx/,/etc/openvpn/ to 192.168.25.100
#
/usr/bin/rsync -avz  /etc/iptables rsync_backup@192.168.25.100::backup/192.168.25.254/sysinfo --password-file=/etc/rsync.password
/usr/bin/rsync -avz --delete /etc/nginx rsync_backup@192.168.25.100::backup/192.168.25.254/sysinfo --password-file=/etc/rsync.password
/usr/bin/rsync -avz --delete /etc/openvpn rsync_backup@192.168.25.100::backup/192.168.25.254/sysinfo --password-file=/etc/rsync.password
/sbin/ip route > /tmp/iproute.txt
/usr/bin/rsync -avz /tmp/iproute.txt rsync_backup@192.168.25.100::backup/192.168.25.254/sysinfo --password-file=/etc/rsync.password
