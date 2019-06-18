#!/bin/bash
salt 'gateway-*' state.sls saltenv='prod' facepics.zabbix
