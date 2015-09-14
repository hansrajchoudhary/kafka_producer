class DriverClass
    payload = '{"name":"my_name","topic_id":"my_topic","partition_id":"part1"}'
    message = KafkaMessage.new(JSON.parse(payload))
    KafkaManager.put_in_kafka(message)
end
