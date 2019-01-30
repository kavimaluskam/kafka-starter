FROM confluentinc/cp-kafka-connect:5.1.0

ADD . .

CMD ["connect-standalone", "connect-standalone.properties", "source-postgres-incremental.properties"]