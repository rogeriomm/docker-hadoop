#!/bin/bash

set -e

TAG=$(git rev-parse --abbrev-ref HEAD)

build() {
    NAME=$2
    IMAGE=$1/spark-$NAME:$TAG
    cd $([ -z "$3" ] && echo "./$NAME" || echo "$3")
    echo '--------------------------' building $IMAGE in $(pwd)
    docker build -t $IMAGE --build-arg USERNAME=$1 --build-arg TAG=$TAG .
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

build "$username" hadoop-base
build "$username" hadoop-namenode
build "$username" hadoop-datanode
build "$username" hadoop-resourcemanager
build "$username" hadoop-historyserver
build "$username" hadoop-submit
