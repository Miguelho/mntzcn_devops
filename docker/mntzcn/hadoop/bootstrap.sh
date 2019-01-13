#!/bin/bash
##### ENV VARS ######
HADOOP_PREFIX=/opt/hadoop
##### ........ ######

mkdir -p /user/oozie
chown oozie -R /user/oozie
mv /etc/oozie-sharelib-4.2.0.tar.gz/** /user/oozie/
rm -rf /etc/oozie-sharelib-4.2.0.tar.gz

echo "Launch hadoop-env.sh"
chmod +x $HADOOP_HOME/etc/hadoop/hadoop-env.sh
$HADOOP_HOME/etc/hadoop/hadoop-env.sh

#rm /tmp/*.pid

# altering the core-site configuration grep -inw /opt/hadoop/logs/* -e "9000"
echo "CONFIGURING /opt/hadoop/etc/hadoop/core-site.xml"
cat /etc/core-site.xml.template > /opt/hadoop/etc/hadoop/core-site.xml.template
sed s/HOSTNAME/$HOSTNAME/ /opt/hadoop/etc/hadoop/core-site.xml.template > /opt/hadoop/etc/hadoop/core-site.xml
#cat /opt/hadoop/etc/hadoop/core-site.xml

echo "RUNNING SSH SERVER"
service ssh restart

echo "CONFIGURING /opt/hadoop/etc/hadoop/hdfs-site.xml.template"
mv /opt/hadoop/etc/hadoop/hdfs-site.xml /opt/hadoop/etc/hadoop/hdfs-site.xml.bak
# echo -e "<configuration>\n\t<property>\n\t\t<name>dfs.replication</name>\n\t\t<value>1</value>\n\t</property>\n\t<property>\n\t\t<name>dfs.permissions.enabled</name>\n\t\t<value>false</value>\n\t</property>\n<property><name>hadoop.proxyuser.oozie.hosts</name><value>*</value></property><property><name>hadoop.proxyuser.oozie.groups</name><value>*</value></property></configuration>" > /opt/hadoop/etc/hadoop/hdfs-site.xml.template
cat /etc/hdfs-site.xml.template > /opt/hadoop/etc/hadoop/hdfs-site.xml.template
sed s/HOSTNAME/$HOSTNAME/ /opt/hadoop/etc/hadoop/hdfs-site.xml.template > /opt/hadoop/etc/hadoop/hdfs-site.xml
cat /etc/yarn-site.xml.template > /opt/hadoop/etc/hadoop/yarn-site.xml

$HADOOP_HOME/bin/hdfs namenode -format
$HADOOP_HOME/sbin/start-yarn.sh
$HADOOP_HOME/sbin/start-dfs.sh

$HADOOP_HOME/sbin/mr-jobhistory-daemon.sh start historyserver

# Prepare mntzcn process
echo "LEAVING SAFE MODE, CREATING PROJECT FOLDERS AND UPLOADING DATA FILES"
$HADOOP_HOME/bin/hdfs dfsadmin -safemode leave \
&& $HADOOP_HOME/bin/hdfs dfs -mkdir /ch01-identity \
&& $HADOOP_HOME/bin/hdfs dfs -put /filesToUpHDFS/oozie/** / \
&& $HADOOP_HOME/bin/hdfs dfs -mkdir -p /user/oozie/share/lib \
&& $HADOOP_HOME/bin/hdfs dfs -put /user/oozie/share/lib /user/oozie/share/lib \
&& $HADOOP_HOME/bin/hdfs dfs -mkdir -p /user/root \
&& $HADOOP_HOME/bin/hdfs dfs -put /filesToUpHDFS/sqoop.password /user/root/sqoop.password \
&& $HADOOP_HOME/bin/hdfs dfs -mkdir -p /etl/ingest/mntzcn \
&& echo COPIED

if  $1 == "-d" ; then
  while true; do sleep 1000; done
fi

tail -f /dev/null