require_relative '../lib/lowkiq'
require 'pry'

Lowkiq.redis = 'redis://localhost:6379'
Lowkiq.push('archive', 'hello world')