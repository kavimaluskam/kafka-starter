KAFKA_CONNECT_TAG="confluentinc/cp-kafka-connect:5.1.0"

DOCKER_COMPOSE_FILE_PATH="docker/docker-compose.yml"
DOCKER_NETWORK="docker_kafka"

ZK="zookeeper:2181"
SCHEMA_REGISTRY="http://schema_registry:8081"
BROKERS="kafka1:9092,kafka2:9092"

SQL_QUERY = "SELECT '\''users'\'' as column, count(1) from users UNION SELECT '\''movies'\'' as column, count(1) from movies UNION SELECT '\''ratings'\'' as column, count(1) from ratings;"

up:
	docker-compose -f $(DOCKER_COMPOSE_FILE_PATH) up -d

down:
	docker-compose -f $(DOCKER_COMPOSE_FILE_PATH) down

zookeeper-shell:
	docker exec -it zookeeper /opt/zookeeper-3.4.9/bin/zkCli.sh

kafka-shell:
	docker run -it --rm \
		-e ZK=$(ZK) \
		-e BROKERS=$(BROKERS) \
		--network=$(DOCKER_NETWORK) \
		confluentinc/cp-kafka:5.1.0 /bin/bash

avro-shell:
	docker run -it --rm \
		-e ZK=$(ZK) \
		-e BROKERS=$(BROKERS) \
		-e SCHEMA_REGISTRY=$(SCHEMA_REGISTRY) \
		--network=$(DOCKER_NETWORK) \
		confluentinc/cp-schema-registry:5.1.0 /bin/bash

consumer-shell:
	docker run -it --rm \
		-v `pwd`/consumer:/run \
		-w /run \
		-e ZK=$(ZK) \
		-e BROKERS=$(BROKERS) \
		--network=$(DOCKER_NETWORK) \
		$(KAFKA_CLIENT_TAG) /bin/bash

streams-shell:
	docker run -it --rm \
		-v `pwd`/streams:/run \
		-w /run \
		-e ZK=$(ZK) \
		-e BROKERS=$(BROKERS) \
		-e SCHEMA_REGISTRY=$(SCHEMA_REGISTRY) \
		--network=$(DOCKER_NETWORK) \
		$(KAFKA_STREAMS_CLIENT_TAG) /bin/bash

connect-shell:
	docker run -it --rm \
		-v `pwd`/connect:/run \
		-w /run \
		-e ZK=$(ZK) \
		-e BROKERS=$(BROKERS) \
		--network=$(DOCKER_NETWORK) \
		$(KAFKA_CONNECT_TAG) /bin/bash

db-preview:
	docker exec postgres bash -c 'psql -U postgres postgres -c $(SQL_QUERY)'