require 'forwardable'
module Lowkiq
  class DataStore
    extend Forwardable
    def initialize(redis)
        @redis = redis
        @queue_access = QueueAccess.new(redis)
    end

    def_delegators :@queue_access, :push_to_queue

    class QueueAccess
      def initialize(redis)
          @redis = redis
      end

      def push_to_queue(queue,encoded_item)
        @redis.pipelined do |piped|
          piped.sadd(:queues, [queue.to_s])
          piped.rpush "queue:#{queue}", encoded_item
        end
      end
    end
  end
end
