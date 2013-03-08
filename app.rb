require 'sinatra'
require 'yajl'
require 'json'

require_relative 'lib/redis_storage'
require_relative 'lib/game_service'
require_relative 'lib/board'
require_relative 'lib/fleet'
require_relative 'lib/game'
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
    game = Game.new
    game.new_game(@params)
    status, data = GameService.new(game).new_game
    [status, [encode(data)]]
  end
end

post "/fire" do
  wrapper do
    game = CurrentGame.new(@params).game
    game.fire(@params)
    status, data = GameService.new(game).fire
    [status, [encode(data)]]
  end
end

def wrapper
  begin
    yield
  rescue Exception => e
    puts e.backtrace
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