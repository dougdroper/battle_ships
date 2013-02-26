require 'sinatra'
require 'yajl'

require_relative 'lib/game'

configure do
  mime_type :json, "application/json"
end

before do
  content_type :json
end

post "/new" do
  status, data = Game.new.new_game(Yajl::Parser.parse(params["data"]))
  [status, Yajl::Encoder.encode(data)]
end

post "/fire" do
  game = Game.new(Yajl::Parser.parse(params["data"]))
  Yajl::Encoder.encode(game.next_move)
end