# Fill with your docker hub repo
DOCKER_HUB=""

KAFDROP_DIR="docker/kafdrop"
KAFDROP_TAG="kafdrop"

POSTGRES_DIR="docker/postgres-demo"
POSTGRES_TAG="postgres-demo"

KAFKA_CONNECT_TAG="confluentinc/cp-kafka-connect:5.1.0"

DOCKER_COMPOSE_FILE_PATH="docker/docker-compose.yml"
DOCKER_NETWORK="docker_kafka"

ZK="zookeeper:2181"
SCHEMA_REGISTRY="http://schema_registry:8081"
BROKERS="kafka1:9092,kafka2:9092"

SQL_QUERY = "SELECT '\''users'\'' as column, count(1) from users UNION SELECT '\''movies'\'' as column, count(1) from movies UNION SELECT '\''ratings'\'' as column, count(1) from ratings;"

build-images:
	# kafdrop docker
	docker build -t $(KAFDROP_TAG) $(KAFDROP_DIR)
	# postgres docker
	docker build -t $(POSTGRES_TAG) $(POSTGRES_DIR)

push-images:
	# kafdrop docker
	docker tag $(KAFDROP_TAG) $(DOCKER_HUB)/$(KAFDROP_TAG)
	docker push $(DOCKER_HUB)/$(KAFDROP_TAG)
	# postgres docker
	docker tag $(POSTGRES_TAG) $(DOCKER_HUB)/$(POSTGRES_TAG)
	docker push $(DOCKER_HUB)/$(POSTGRES_TAG)

pull-images:
	# kafdrop docker
	docker pull $(DOCKER_HUB)/$(KAFDROP_TAG)
	docker tag $(KAFDROP_TAG) $(DOCKER_HUB)/$(KAFDROP_TAG)
	# postgres docker
	docker pull $(DOCKER_HUB)/$(POSTGRES_TAG)
	docker tag $(POSTGRES_TAG) $(DOCKER_HUB)/$(POSTGRES_TAG)

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