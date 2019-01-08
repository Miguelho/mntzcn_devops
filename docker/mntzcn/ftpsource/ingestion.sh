#!/bin/bash
alias hdfs=$HADOOP_PREFIX/bin/hdfs

## HADOOP HOST
HADOOP_HOST=hdfs://hadoop:9000
HADOOP_DEST="$HADOOP_HOST"/data/master/telco/events
echo Data is ingested at $HADOOP_DEST
## PATH DEFINITION
dataPath=$1
basePath=$2
date=$3

toLoadPath=$basePath/$date/toLoad/
successPath=$basePath/$date/success/
failurePath=$basePath/$date/failure/
inProgressPath=$basePath/$date/inprogress/

successReturnCode=0
failureReturnCode=1

function prepareDirectories(){
    $(mkdir -p "$toLoadPath")
    $(mkdir -p "$successPath")
    $(mkdir -p "$failurePath")
    $(mkdir -p "$inProgressPath")
}

function copyData(){
    $(cp "$dataPath"* "$toLoadPath")
}

function stageData(){
    $(mv "$toLoadPath"** "$inProgressPath")
}

function put() {
    # local dest="$HOME"/data/raw/"$2"
    $(hdfs dfs -mkdir -p "$HADOOP_DEST")>>execution.log
    $(hdfs dfs -put $1** "$HADOOP_DEST/$2")>>execution.log
}

## PREPARE
prepareDirectories
copyData
stageData
## INGESTION
put "$inProgressPath" "$date"

## INFORM STATUS
statuscode=$?
echo Status code $statuscode
if [[ $statuscode == $successReturnCode ]]; then
    echo "">"$successPath"/output
    mv execution.log "$successPath"
else
    echo "">"$failurePath"/output
    mv execution.log "$failurePath"
fi