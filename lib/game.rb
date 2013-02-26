require 'redis'

class Game
  ENV["REDISTOGO_URL"] ||= "redis://127.0.0.1:6379"

  attr_reader :name, :email, :redis
  def initialize(redis=nil)
    redis ||= Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)
    @redis = redis
  end

  def id
    @id ||= redis.incr "users:#{name.downcase}"
  end

  def new_game(options={})
    @name, @email = options["name"], options["email"]
    return [500, {:error => "name/email is required"}] unless name && email
    [200, {:id => "users:#{name.downcase}:#{id}", :x => 1, :y => 1}]
  end

  def uri
    @uri ||= URI.parse(ENV["REDISTOGO_URL"])
  end

  def next_move
    {"id" => id, "x" => 1, "y" => 2}
  end

  def board
    redis.get(email)
  end
end