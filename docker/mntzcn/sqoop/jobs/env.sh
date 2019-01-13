#!/usr/bin/env bash
export MYSQL_HOST=jdbc:mysql://mtnzcn_mysql:3306/
export MYSQL_USER=root
export MYSQL_PASS=hdfs://hadoop:9000/user/root/sqoop.password
#export MYSQL_PASS=mypassword
export MYSQL_DB=mtzcn?zeroDateTimeBehavior=convert_to_null

export MNTZCN_APPLICATION_HDFS_PATH=/etl/ingest/mntzcn # TODO route definition
