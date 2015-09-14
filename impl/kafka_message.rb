# *-- kafka message implementation --*
require 'murmurhash3'

class KafkaMessage
  attr_reader :topic, :message, :partition
  PARTITION_COUNT = 3
  PARTITION_ID = 'partition_id'
  TOPIC_ID = 'my_topic'

  def initialize(message)
    # **-- message should contain partition_id,
    @message = JSON.generate(message).to_s

    # **-- Field in payload on which you want to assign kafka partition --**
    id = message[PARTITION_ID]  
    ints=MurmurHash3::Native128.murmur3_128_str_hash(id)

    @partition=MurmurHash3::Native128.murmur3_128_str_hash(ints[0].to_s)[0] % PARTITION_COUNT
  end

  def get_topic
    #MERGING ALL THE TOPICS IN ONE
    TOPIC_ID
  end
end
