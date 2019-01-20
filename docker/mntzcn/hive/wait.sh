#!/usr/bin/env bash
# https://docs.docker.com/compose/startup-order/
# wait-for-hadoop.sh

set -e

host="$1"
shift
cmd="$@"

# status
function_name () {
   res=$(curl $host'/jmx?qry=Hadoop:service=NameNode,name=NameNodeStatus' |grep "State"|awk '{print $3}')
   echo $res
   if [[ "$res" == *"active"* ]]
   then
     echo "0"
     return 0
   else
     echo "1"
     return 1
   fi
}

until function_name == 1 ; do
  >&2 echo "Hadoop is unavailable - sleeping"
  sleep 4
done

>&2 echo "Hadoop is up - executing command"
exec $cmd

tail -f /dev/null