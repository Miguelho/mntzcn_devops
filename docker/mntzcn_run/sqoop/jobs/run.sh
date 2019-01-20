#!/usr/bin/env bash
# https://stackoverflow.com/questions/496702/can-a-shell-script-set-environment-variables-of-the-calling-shell/28489593#28489593
SQOOP_JOBS_HOME=/opt/sqoop/jobs
. $SQOOP_JOBS_HOME/env.sh
. $SQOOP_JOBS_HOME/antenna.sh
. $SQOOP_JOBS_HOME/city.sh
. $SQOOP_JOBS_HOME/client.sh