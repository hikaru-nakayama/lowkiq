module Lowkiq
  class Worker

    def initialize(*queues)
      self.queues = queues
    end

    def work(interval = 5.0)
      interval = Float(interval)
      loop do
        if job = reserve
            job.perform
        else
            sleep interval
        end
      end    
    end

    def reserve
      @queues.each do |queue|
        if job = Job.reserve(queue)
            return job
        end
      end
      nil
    end

    def queues=(queues)
      queues = ENV['QUEUE'].to_s.split(',') if queues.empty?
      @queues = queues.map { |queue| queue.to_s.strip }
    end
  end
end