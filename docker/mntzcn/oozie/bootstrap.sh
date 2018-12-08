#!/bin/bash

# mv /opt/oozie-4.2.0/conf/hadoop-config.xml /opt/oozie-4.2.0/conf/hadoop-config.xml.bak
# mv /etc/hadoop-config.xml /opt/oozie-4.2.0/conf/hadoop-config.xml
# /opt/oozie-4.2.0/conf/hadoop-conf/core-site.xml
mv /opt/oozie-4.2.0/conf/hadoop-conf/core-site.xml /opt/oozie-4.2.0/conf/hadoop-conf/core-site.xml.bak
cat /etc/hadoop-config.xml > /opt/oozie-4.2.0/conf/hadoop-conf/core-site.xml

mkdir -p /user/oozie/share/lib
chown -R oozie /user/oozie
tar xvf /opt/oozie-4.2.0/oozie-sharelib-4.2.0.tar.gz -C /user/oozie/
rm -rf /opt/oozie-4.2.0/share