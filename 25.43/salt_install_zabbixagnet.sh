#!/bin/bash
salt 'gateway-*' state.sls saltenv='prod' cluster.zabbix-agent-gateway
