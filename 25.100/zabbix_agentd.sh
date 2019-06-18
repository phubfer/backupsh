#!/bin/sh

ZABBIX_AGENTD_BIN="/usr/local/sbin/zabbix_agentd"
CONF="/etc/zabbix/zabbix_agentd.conf"
PID="/tmp/zabbix_agentd.pid"

[ ! -f $ZABBIX_AGENTD_BIN ] && echo "zabbix_agentd does not exist!" && exit 1

start(){
  [ -f $PID ] && echo "zabbix_agentd is already running" && exit 1
  su zabbix -c "$ZABBIX_AGENTD_BIN -c $CONF"
}

stop(){
  [ -f $PID ] && kill -2 `cat $PID` && exit 0
}

restart(){
  [ -f $PID ] && kill -2 `cat $PID` && sleep 2
  start
}

status(){
  [ -f $PID ] && echo "zabbix_agentd is already running" && exit 0 || echo "zabbix_agentd is not running" && exit 0
}

case "$1" in
  start)
    start
    ;;
  stop)
    stop
    ;;
  restart)
    restart
    ;;
  status)
    status
    ;;
  *)
    echo "Usage: $0 {start|stop|restart|status}"
esac
