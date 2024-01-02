# frozen_string_literal: true
require 'redis'
require_relative "lowkiq/version"
require_relative "lowkiq/data_store"

module Lowkiq
  extend self

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

  def push(queue, item)
    redis.push_to_queue(queue, item)
  end
end
