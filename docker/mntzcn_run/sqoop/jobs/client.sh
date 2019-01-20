#!/usr/bin/env bash
MYSQL_TABLE=client
# https://stackoverflow.com/questions/36190726/sqoop-export-specific-columns-from-hdfs-to-mysql-is-not-working-properly
sqoop job --create $MYSQL_TABLE -- import --connect $MYSQL_HOST$MYSQL_DB --username $MYSQL_USER --password-file $MYSQL_PASS --table $MYSQL_TABLE --warehouse-dir $MNTZCN_APPLICATION_HDFS_PATH  --columns "clientId,age,gender,nationality,civilstatus,socioeconomiclevel" --m 1
sqoop job --exec $MYSQL_TABLE