AWS MSK
#
client
#
yum install java-1.8.0
#
https://kafka.apache.org/downloads
#
wget 'https://downloads.apache.org/kafka/3.7.1/kafka_2.12-3.7.1.tgz'
#
tar -xvf kafka_2.12-3.7.1.tgz
#
bin/kafka-topics.sh (list/create topic)
#
bin/kafka-console-producer.sh (produce to topic)
#
kafka-console-consumer.sh (consume from topic)
#
bootstrap servers use in producer/consumer configs
#
boot-9vnhxufq.c1.kafka-serverless.us-east-1.amazonaws.com:9098
#
https://docs.aws.amazon.com/msk/latest/developerguide/create-topic.html
#
./kafka-topics.sh --create --bootstrap-server boot-9vnhxufq.c1.kafka-serverless.us-east-1.amazonaws.com:9098 --command-config client.properties --replication-factor 3 --partitions 1 --topic zt0
#
./kafka-topics.sh --bootstrap-server boot-9vnhxufq.c1.kafka-serverless.us-east-1.amazonaws.com:9098 --command-config client.properties --list
#
./kafka-console-producer.sh --broker-list boot-9vnhxufq.c1.kafka-serverless.us-east-1.amazonaws.com:9098 --producer.config client.properties --topic zt0
#
./kafka-console-consumer.sh --bootstrap-server boot-9vnhxufq.c1.kafka-serverless.us-east-1.amazonaws.com:9098 --consumer.config client.properties --topic zt0 --from-beginning
#
