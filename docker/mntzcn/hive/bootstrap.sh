#!/usr/bin/env bash
sed s/HOSTNAME/hadoop/ /usr/local/hadoop/etc/hadoop/core-site.xml.template > /usr/local/hadoop/etc/hadoop/core-site.xml

tail -f /dev/null