#!/bin/bash
mkdir -p /user/oozie
chown oozie -R /user/oozie
# mv /opt/oozie-4.2.0/conf/hadoop-config.xml /opt/oozie-4.2.0/conf/hadoop-config.xml.bak
# mv /etc/hadoop-config.xml /opt/oozie-4.2.0/conf/hadoop-config.xml
# /opt/oozie-4.2.0/conf/hadoop-conf/core-site.xml
mv /opt/oozie-4.2.0/conf/hadoop-conf/core-site.xml /opt/oozie-4.2.0/conf/hadoop-conf/core-site.xml.bak
cat /etc/hadoop-config.xml > /opt/oozie-4.2.0/conf/hadoop-conf/core-site.xml
cat /etc/core-site.xml.template > /opt/hadoop-2.7.0/etc/hadoop/core-site.xml
mkdir -p /user/oozie/share/lib
tar xvf /opt/oozie-4.2.0/oozie-sharelib-4.2.0.tar.gz -C /user/oozie/
rm -rf /opt/oozie-4.2.0/share
#-- Spark 2 config
mkdir -p /user/oozie/jobs /user/oozie/share/lib/spark2
cp /user/oozie/share/lib/spark/oozie-sharelib-spark-4.2.0.jar /user/oozie/share/lib/spark2