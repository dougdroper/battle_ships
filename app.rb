require 'sinatra'
require 'yajl'
require 'json'

require_relative 'lib/redis_storage'
require_relative 'lib/game_service'
require_relative 'lib/board'
require_relative 'lib/fleet'
require_relative 'lib/new_game'
require_relative 'lib/current_game'
require_relative 'lib/coordinates'
require_relative 'lib/game_logic'

configure do
  mime_type :json, "application/json"
end

before do
  content_type :json
  @params = parse(request.body.read)
end

post "/new" do
  wrapper do
    new_game = NewGame.new(RedisStorage.new, @params)
    status, data = GameService.new(new_game).new_game
    [status, [encode(data)]]
  end
end

post "/fire" do
  wrapper do
    current_game = CurrentGame.new(RedisStorage.new, @params)
    status, data = GameService.new(current_game).fire
    [status, [encode(data)]]
  end
end

def wrapper
  begin
    yield
  rescue Exception => e
    # puts e.backtrace
    [500, [encode({:error => "#{e.message}"})]]
  end
end

def encode(data)
  Yajl::Encoder.encode data
end

def parse(data)
  JSON.parse data
  # Yajl::Parser.parse data
end