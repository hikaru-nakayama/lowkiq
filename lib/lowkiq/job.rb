require 'pry'
module Lowkiq
  class Job 
    def initialize(queue, payload)
        @queue = queue
        @payload = payload
    end

    def self.create(queue, klass, *args)
      Lowkiq.push(queue, :class => klass.to_s, :args => args)
    end

    def self.reserve(queue)
        return unless payload = Lowkiq.pop(queue)
        new(queue, payload)
    end

    def perform
        job = payload_class
        args = @payload['args']
        job.perform(*args)
    end

    def payload_class
        @payload_class ||= constantize(@payload['class'])
    end

    def constantize(camel_cased_word)
        Lowkiq.constanize(camel_cased_word)
    end
  end
end