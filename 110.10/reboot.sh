#! /bin/bash
test_ip="192.168.100.1"
/bin/ping -c 3 $test_ip > /dev/null
result=$?
time=$(date "+%Y-%m-%d %H:%M:%S")
if [ $result != 0 ]; then
echo "$time the server is down, starting reboot" >> /tmp/reboot.log
else
echo "$time the server is running well" >> /tmp/reboot.log
/sbin/reboot
fi
