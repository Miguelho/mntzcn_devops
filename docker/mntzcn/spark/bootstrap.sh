#!/usr/bin/env bash
HADOOP_URL=hadoop
HADOOP_HOME=/usr/local/hadoop

echo "CONFIGURING HADOOP URL"
sed s/HOSTNAME/$HADOOP_URL/ $HADOOP_HOME/etc/hadoop/core-site.xml.template > $HADOOP_HOME/etc/hadoop/core-site.xml