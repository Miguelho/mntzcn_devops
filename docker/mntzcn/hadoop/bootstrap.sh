#!/bin/bash
##### ENV VARS ######
HADOOP_PREFIX=/opt/hadoop
##### ........ ######

##### OOZIE SETUP ######
mkdir -p /user/oozie
chown oozie -R /user/oozie
#mv /etc/oozie-sharelib-4.2.0.tar.gz/** /user/oozie/
#rm -rf /etc/oozie-sharelib-4.2.0.tar.gz

echo "Launch hadoop-env.sh"
chmod +x $HADOOP_HOME/etc/hadoop/hadoop-env.sh
$HADOOP_HOME/etc/hadoop/hadoop-env.sh

#rm /tmp/*.pid

# altering the core-site configuration grep -inw /opt/hadoop/logs/* -e "9000"
echo "CONFIGURING /opt/hadoop/etc/hadoop/core-site.xml"
cat /etc/core-site.xml.template > /opt/hadoop/etc/hadoop/core-site.xml.template
sed s/HOSTNAME/$HOSTNAME/ /opt/hadoop/etc/hadoop/core-site.xml.template > /opt/hadoop/etc/hadoop/core-site.xml

echo "RUNNING SSH SERVER"
service ssh restart

echo "CONFIGURING /opt/hadoop/etc/hadoop/hdfs-site.xml.template"
mv /opt/hadoop/etc/hadoop/hdfs-site.xml /opt/hadoop/etc/hadoop/hdfs-site.xml.bak
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
&& $HADOOP_HOME/bin/hdfs dfs -mkdir -p /user/oozie/jobs \
&& $HADOOP_HOME/bin/hdfs dfs -mkdir -p /user/oozie/share/lib \
&& $HADOOP_HOME/bin/hdfs dfs -mkdir -p /user/root \
&& $HADOOP_HOME/bin/hdfs dfs -mkdir -p /etl/ingest/telco/mntzcn/activity_pattern/in \
&& $HADOOP_HOME/bin/hdfs dfs -mkdir -p /etl/process/telco/mntzcn/activity-pattern/out \
&& $HADOOP_HOME/bin/hdfs dfs -put /filesToUpHDFS/sqoop.password /user/root/sqoop.password \
&& $HADOOP_HOME/bin/hdfs dfs -chmod +rw /etl/ingest/telco/mntzcn/activity_pattern/in \
&& $HADOOP_HOME/bin/hdfs dfs -chmod -R +x /tmp \
&& $HADOOP_HOME/bin/hdfs dfs -chmod +rw /etl/process/telco/mntzcn/activity-pattern/out \
&& echo COPIED

tail -f /dev/null