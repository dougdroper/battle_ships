require 'sinatra'
require 'yajl'

require_relative 'lib/game'
require_relative 'lib/board'

configure do
  mime_type :json, "application/json"
end

before do
  content_type :json
end

post "/new" do
  begin
    status, data = Game.new.new_game(parse(params["data"]))
    [status, [encode(data)]]
  rescue
    [500, [encode("Something went wrong")]]
  end
end

post "/fire" do
  begin
    status, data = Game.new.fire(parse(params["data"]))
    [status, [encode(data)]]
  rescue
    [500, [encode("Something went wrong")]]
  end
end

def encode(data)
  Yajl::Encoder.encode data
end

def parse(data)
  Yajl::Parser.parse data
end