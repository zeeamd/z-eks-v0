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
python -m venv .venv (in project dir)
#
source .venv/bin/activate
#
python --version
#
deactivate
#
pip install kafka-python -t .
#
wget https://www.python.org/ftp/python/3.8.12/Python-3.8.12.tgz
#
cd Python-3.8.12
#
./configure --enable-optimizations
#
make install
#
curl -O https://bootstrap.pypa.io/get-pip.py
#
python get-pip.py
#
https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/eb-cli3-install-linux.html
#
pip install aws-msk-iam-sasl-signer-python -t .
#
https://github.com/aws/aws-msk-iam-sasl-signer-python?tab=readme-ov-file#get-started
#
./kafka-delete-records.sh --bootstrap-server boot-9vnhxufq.c1.kafka-serverless.us-east-1.amazonaws.com:9098 --offset-json-file ./offsetfile.json
#
kafka/libs/aws-msk-iam-auth-1.1.1-all.jar (needed for connection cli)
#
kafka/bin/client.properties (needed for connection cli)
#
kafka/bin/offsetfile.json (needed to clear topic cli)
#
kafka_2.12-3.7.1
#
https://github.com/dpkp/kafka-python
#
Python 3.8.12
#
pip 24.2 from /usr/local/lib/python3.8/site-packages/pip (python 3.8)
#
./kafka-topics.sh --create --bootstrap-server boot-9vnhxufq.c1.kafka-serverless.us-east-1.amazonaws.com:9098 --command-config client.properties --replication-factor 1 --partitions 1 --config retention.ms=60000 --topic zt1
