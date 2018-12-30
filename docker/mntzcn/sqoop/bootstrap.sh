#!/bin/bash
: ${HADOOP_HOME:=/usr/local/hadoop}
HADOOP_URL=hadoop

$HADOOP_HOME/etc/hadoop/hadoop-env.sh

rm /tmp/*.pid

# installing libraries if any - (resource urls added comma separated to the ACP system variable)
# cd $HADOOP_HOME/share/hadoop/common ; for cp in ${ACP//,/ }; do  echo == $cp; curl -LO $cp ; done; cd -

# Configure remote hdfs
cat /etc/yarn-site.xml.template > /usr/local/hadoop/etc/hadoop/yarn-site.xml

# Connection to its own hdfs
#sed s/HOSTNAME/$HOSTNAME/ $HADOOP_HOME/etc/hadoop/core-site.xml.template > /usr/local/hadoop/etc/hadoop/core-site.xml
sed s/HOSTNAME/$HADOOP_URL/ $HADOOP_HOME/etc/hadoop/core-site.xml.template > /usr/local/hadoop/etc/hadoop/core-site.xml
/usr/sbin/sshd
# HADOOP_HOME/sbin/start-dfs.sh
# $HADOOP_HOME/sbin/start-yarn.sh
#$HADOOP_HOME/bin/mapred --daemon start historyserver
# $HADOOP_HOME/sbin/mr-jobhistory-daemon.sh start historyserver
# $HADOOP_HOME/bin/hdfs dfsadmin -safemode leave

#cp /jdbc/* $SQOOP_HOME/lib
cp /etc/sqoop-libs/mysql-connector-java-8.0.12.jar $SQOOP_HOME/lib

sqoop-version

/bin/bash && tail -f /dev/null