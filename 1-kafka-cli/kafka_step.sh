#———————————————CLI———————————————

#Note: use bin/***.sh for binary cmd and *** when downloaded by brew
#Step: 1) Start zookeeper server

zookeeper-server-start config/zookeeper.properties #— brew
Bin/zookeeper-server-start.sh config/zookeeper.properties #—binary

#Step: 2) Start Kafka server

bin/kafka-server-start.sh config/server.properties #—binary
kafka-server-start config/server.properties #—brew

#Step: 3) Create Kafka topic

kafka-topics --create --topic <event_name> -<server_type> <server_ip>
	event_name = sample_event
	server_type = bootstrap-server/zookeeper
	server_ip = zookeeper->127.0.0.0:2181 / bootstrap-server-> localhost:9092

#IMP CMD FOR TOPICS

* To get all topics
    * kafka-topics --bootstrap-server localhost:9092 --list
* To get info about specific topic
    * kafka-topics --bootstrap-server localhost:9092 --topic sample-events -describe
* To delete specific topic
    * kafka-topics --bootstrap-server localhost:9092 --topic sample-events --delete


#Step: 4) Publish a message to a topic

kafka-console-producer --topic sample-events --bootstrap-server localhost:9092

#Now start sending messages to the topic

#Step: 5) Consume a message from a topic

kafka-console-consumer --topic sample-events  --bootstrap-server localhost:9092

#Note: Use —from-beginning to get all messages from the beginning

#Consumer group
#—group

#—reset offset

# kafka-console-producer --broker-list 127.0.0.1:9092 --topic first_topic --property parse.key=true --property key.separator=,
# kafka-console-consumer --bootstrap-server 127.0.0.1:9092 --topic first_topic --from-beginning --property print.key=true --property key.separator=,