module Lowkiq
  class Job 
    def initialize(queue, payload)
        @queue = queue
        @payload = payload
    end

    def self.reserve(queue)
        return unless payload = Resque.pop(queue)
        new(queue, payload)
    end
  end
end