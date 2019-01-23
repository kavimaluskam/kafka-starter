# Command Line Cheat Sheet

## Topic CRUD

```sh
# Enter Kafka Shell Client
make kafka-shell

# Assign topic name in variable
TOPIC=test

# Describe all topic
kafka-topics --describe --zookeeper $ZK

# Create topic
kafka-topics --create --topic $TOPIC --partitions 4 --zookeeper $ZK --replication-factor 2

# Describe partitions, replication, leader brokers for selected topic
kafka-topics --describe --zookeeper $ZK --topic $TOPIC

# Count number of messages inside a topic
kafka-run-class kafka.tools.GetOffsetShell --broker-list=$BROKERS --topic $TOPIC --time -1

# Update retention policy of a topic
# "-1" means forever
kafka-configs --zookeeper $ZK --alter --entity-type topics --entity-name $TOPIC --add-config retention.ms=-1
kafka-configs --zookeeper $ZK --alter --entity-type topics --entity-name $TOPIC --add-config retention.bytes=-1

# Delete topics
kafka-topics --delete --topic $TOPIC --zookeeper $ZK
```

## Console (plain-text) Producer / Consumer

```sh
# Enter Kafka Shell Client
make kafka-shell

# Assign topic name in variable
TOPIC=test

# Producer for console text input
kafka-console-producer --topic=$TOPIC --broker-list=$BROKERS

# Consumer for console text output
kafka-console-consumer --topic=$TOPIC --bootstrap-server=$BROKERS --from-beginning
```

## Console (Apache Avro format) consumer

Note: must setup schema_registry first.
Also need to have topics that are using Apache Avro format.

```sh
# Enter Kafka Connect Shell Client
make avro-shell

# Assign topic name in variable
TOPIC=example_topic

kafka-avro-console-consumer --bootstrap-server $BROKERS \
  --topic $TOPIC \
  --from-beginning \
  --property print.key=true \
  --property print.value=true \
  --property schema.registry.url=$SCHEMA_REGISTRY \
  --max-messages 20
```

## Kafka Connect

```sh
# Enter Kafka Connect Shell Client
make connect

# Kafka Connect with connect-standalone setting, connecting via postgres
connect-standalone dev/connect-standalone.properties dev/source-postgres-incremental.properties

# Kafka Connect with avro-standalone setting, connecting via postgres
connect-standalone dev/connect-avro-standalone.properties dev/source-postgres-incremental.properties
```
