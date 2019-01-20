#!/usr/bin/env bash
# -- Configure Spark for Oozie
/usr/local/hadoop/bin/hdfs dfs -put /opt/spark/jars/* hdfs://hadoop:9000/user/oozie/share/lib/lib_*/spark2
/usr/local/hadoop/bin/hdfs dfs -put /classpath/mntzn-assembly-0.1-SNAPSHOT.jar hdfs://hadoop:9000/user/oozie/jobs/mntzn-assembly-0.1-SNAPSHOT.jar
/usr/local/hadoop/bin/hdfs dfs -put /conf/hive-site.xml hdfs://hadoop:9000/user/oozie/share/lib/lib_*/spark2