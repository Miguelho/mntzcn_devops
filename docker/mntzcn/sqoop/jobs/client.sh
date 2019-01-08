#!/usr/bin/env bash
MYSQL_TABLE=client

sqoop job --create $MYSQL_TABLE -- import --connect $MYSQL_HOST$MYSQL_DB --username $MYSQL_USER --password-file $MYSQL_PASS --table $MYSQL_TABLE --warehouse-dir $MNTZCN_APPLICATION_HDFS_PATH --m 1
sqoop job --exec $MYSQL_TABLE