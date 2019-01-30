#!/usr/bin/env bash

while getopts h:b:d: option
do
case "${option}"
in
h) DOCKER_HUB=${OPTARG};;
b) STG_BROKERS=${OPTARG};;
d) DOMAIN=${OPTARG};;
esac
done

cd "${0%/*}"

CONNECTION="jdbc:postgresql://$DOMAIN:5432/postgres?user=postgres&password=postgres"
sh update.sh bootstrap.servers $STG_BROKERS connect-standalone.properties
sh update.sh connection.url $CONNECTION source-postgres-incremental.properties

docker build -t kafka-connect-demo .
docker tag kafka-connect-demo $DOCKER_HUB/kafka-connect-demo
docker push $DOCKER_HUB/kafka-connect-demo
