#!/usr/bin/env bash

sed s/HOSTNAME/hadoop/ /usr/local/hadoop/etc/hadoop/core-site.xml.template > /usr/local/hadoop/etc/hadoop/core-site.xml

/opt/hive/bin/hive -f /opt/hive/ddl.hql

tail -f /dev/null