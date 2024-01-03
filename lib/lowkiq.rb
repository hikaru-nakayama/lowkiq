# frozen_string_literal: true
require 'multi_json'
require 'redis'
require_relative "lowkiq/version"
require_relative "lowkiq/data_store"
require "lowkiq/worker"

module Lowkiq
  extend self

  def encode(object)
    if MultiJson.respond_to?(:dump) && MultiJson.respond_to?(:load)
      MultiJson.dump object
    else
      MultiJson.encode object
    end
  end

  def constantize(camel_cased_word)
    camel_cased_word = camel_cased_word.to_s
  end

  def redis=(server)
    case server
    when String
      @data_store = DataStore.new(Redis.new(url: server))
    when Hash
      @data_store = DataStore.new(Redis.new(server))
    else
      raise ArgumentError, "Invalid Redis server: #{server.inspect}"
    end
  end

  def redis
    return @data_store if @data_store
    self.redis = 'redis://localhost:6379'
    @data_store
  end
  alias :data_store :redis

  def push(queue, item)
    data_store.push_to_queue(queue, encode(item))
  end

  def pop(queue)
    data_store.pop_from_queue(queue)
  end

  def enqueue(klass, *args)
    enqueue_to(klass.instance_variable_get(:@queue), klass, *args)
  end

  def enqueue_to(queue, klass, *args)
    Job.create(queue, klass, *args)
  end

  def queues
    data_store.queue_names
  end
end
