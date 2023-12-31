# frozen_string_literal: true

source "https://rubygems.org"

# Specify your gem's dependencies in lowkiq.gemspec
gemspec

case redis_version = ENV.fetch("REDIS_VERSION", "latest")
when "latest"
  gem "redis", "~> 5.0"
else
    gem "redis", "~> #{redis_version}.0"
end

gem "rake", "~> 13.0"
