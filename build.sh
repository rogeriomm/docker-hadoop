#!/bin/bash

#
# FAILED Execution Error return code 2 from org apache hadoop hive ql exec mr MapRedTask
# https://www.edureka.co/community/66949/failed-execution-error-return-apache-hadoop-hive-mapredtask
# See file "entrypoint.sh"

set -e

TAG=$(git rev-parse --abbrev-ref HEAD)

build() {
    USER=$1
    PREFIX=$2
    NAME=$3
    IMAGE=$USER/$PREFIX-$NAME:$TAG
    cd $([ -z "$4" ] && echo "./$NAME" || echo "$4")
    echo '--------------------------' building $IMAGE in $(pwd)
    echo "--->docker build -t $IMAGE --build-arg USERNAME=$1 --build-arg TAG=$TAG .<---"
    docker build --no-cache -t $IMAGE --build-arg USERNAME=$1 --build-arg TAG=$TAG .
    #docker build -t $IMAGE --build-arg USERNAME=$1 --build-arg TAG=$TAG .
    cd -
}

while getopts u:a:f: flag
do
    case "${flag}" in
        u) username=${OPTARG};;
        *);;
    esac
done

if [ "$username" == "" ] ; then
  echo "Invalid user name"
  exit
fi

build "$username" hue hue
#build "$username" hadoop base
#build "$username" hadoop namenode
#build "$username" hadoop datanode
#build "$username" hadoop resourcemanager
#build "$username" hadoop historyserver
#build "$username" hadoop submit
#build "$username" hadoop nodemanager
