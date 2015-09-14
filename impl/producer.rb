# *-- producer implementation --*
 
require 'poseidon'

class KafkaManager
  def self.put_in_kafka(message)
    messages = []
    PRODUCER = Poseidon::Producer.new(<array of broker ips>, <client_name>, :type => :sync, :partitioner => Proc.new { |key, partition_count| key.to_i }, :required_acks => -1)
    messages << Poseidon::MessageToSend.new(message.topic, message.message.to_s, message.partition)
    result = PRODUCER.send_messages(messages)
  end
end
