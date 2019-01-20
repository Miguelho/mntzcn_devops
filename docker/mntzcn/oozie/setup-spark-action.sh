#!/usr/bin/env bash
#-- Upload libs and spark workflow as service user 'oozie'
#su oozie
/opt/oozie-4.2.0/bin/oozie-setup.sh sharelib create -fs hdfs://hadoop:9000 -locallib /user/oozie/share/
hdfs dfs -put /user/oozie/jobs/workflow.xml /user/oozie/jobs
oozie admin -sharelibupdate