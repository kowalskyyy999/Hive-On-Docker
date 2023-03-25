#!/bin/bash
. ./.env

docker build --build-arg HADOOP_VERSION=$HADOOP_VERSION -t hive:3.1.3 ./images/base/


