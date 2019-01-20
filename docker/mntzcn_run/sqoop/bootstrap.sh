#!/bin/bash
: ${HADOOP_HOME:=/usr/local/hadoop}
HADOOP_URL=hadoop

$HADOOP_HOME/etc/hadoop/hadoop-env.sh

rm /tmp/*.pid

# Configure remote hdfs
cat /etc/yarn-site.xml.template > /usr/local/hadoop/etc/hadoop/yarn-site.xml

# Connection to its own hdfs
sed s/HOSTNAME/$HADOOP_URL/ $HADOOP_HOME/etc/hadoop/core-site.xml.template > /usr/local/hadoop/etc/hadoop/core-site.xml
/usr/sbin/sshd

#cp /jdbc/* $SQOOP_HOME/lib
cp /etc/sqoop-libs/mysql-connector-java-8.0.12.jar $SQOOP_HOME/lib

sqoop-version

echo "RUNNING SQOOP JOB"
cd opt/sqoop/jobs/ && . run.sh

echo "LEAVE BASH SHELL OPEN"
tail -f /dev/null