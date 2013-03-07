require 'redis'

class RedisStorage
  ENV["REDISTOGO_URL"] ||= "redis://127.0.0.1:6379"
  attr_reader :redis
  def initialize
    @redis ||= Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)
  end

  def uri
    @uri ||= URI.parse(ENV["REDISTOGO_URL"])
  end

  def get(id)
    JSON.parse(redis.get(id))
  end

  def set(id, data, other)
    redis.set(id, (data.merge("visited" => other)).to_json)
  end

  def incr(name)
    redis.incr name
  end
end