#!/bin/bash

mkdir -p /user/oozie
chown oozie -R /user/oozie
mv /etc/oozie-sharelib-4.2.0.tar.gz/** /user/oozie/

HADOOP_PREFIX=/usr/local/hadoop

$HADOOP_PREFIX/etc/hadoop/hadoop-env.sh

rm /tmp/*.pid

# altering the core-site configuration
cat /etc/core-site.xml.template > /usr/local/hadoop/etc/hadoop/core-site.xml.template
sed s/HOSTNAME/$HOSTNAME/ /usr/local/hadoop/etc/hadoop/core-site.xml.template > /usr/local/hadoop/etc/hadoop/core-site.xml

mv /usr/local/hadoop/etc/hadoop/hdfs-site.xml /usr/local/hadoop/etc/hadoop/hdfs-site.xml.bak
# echo -e "<configuration>\n\t<property>\n\t\t<name>dfs.replication</name>\n\t\t<value>1</value>\n\t</property>\n\t<property>\n\t\t<name>dfs.permissions.enabled</name>\n\t\t<value>false</value>\n\t</property>\n<property><name>hadoop.proxyuser.oozie.hosts</name><value>*</value></property><property><name>hadoop.proxyuser.oozie.groups</name><value>*</value></property></configuration>" > /usr/local/hadoop/etc/hadoop/hdfs-site.xml
cat /etc/hdfs-site.xml > /usr/local/hadoop/etc/hadoop/hdfs-site.xml

service sshd start
#$HADOOP_PREFIX/sbin/start-dfs.sh

$HADOOP_PREFIX/sbin/start-all.sh

$HADOOP_PREFIX/sbin/mr-jobhistory-daemon.sh start historyserver

$HADOOP_PREFIX/bin/hadoop dfsadmin -safemode leave && $HADOOP_PREFIX/bin/hdfs dfs -mkdir /ch01-identity && $HADOOP_PREFIX/bin/hdfs dfs -put /filesToUpHDFS/oozie/** / && $HADOOP_PREFIX/bin/hdfs dfs -mkdir -p /user/oozie/share/lib && $HADOOP_PREFIX/bin/hdfs dfs -put /user/oozie/share/lib /user/oozie/share/lib && echo COPIED && tail -f /dev/null

if [[ $1 == "-d" ]]; then
  while true; do sleep 1000; done
fi