module Lowkiq
  class Job 
    def initialize(queue, payload)
        @queue = queue
        @payload = payload
    end

    def self.create(queue, klass)
      Lowkiq.push(queue, klass.to_s)
    end

    def self.reserve(queue)
        return unless payload = Lowkiq.pop(queue)
        new(queue, payload)
    end
  end
end