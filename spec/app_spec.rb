require 'spec_helper'

describe "Sinatra App" do
  it "creates a new game" do
    RedisStorage.stub(:new => stub(:set => "OK"))
    Game.any_instance.stub(:next_coordiantes => [1,1], :id => 1)
    post '/new', Yajl::Encoder.encode({:name => "doug", :email => "dougdroper"})
    Yajl::Parser.parse(last_response.body).should == {"id" => 1, "x"=>1, "y"=>1}
  end

  it "receives a fire request with a game id and status" do
    RedisStorage.stub(:new => stub(:set => "OK", :get => Marshal.dump(Game.new)))
    Game.any_instance.stub(:next_coordiantes => [1,1], :id => 1, :status => "miss")
    # id = create_new_game
    id = 1
    post '/fire', Yajl::Encoder.encode({:id => id, :x => 1, :y => 1, :status => "miss"})
    Yajl::Parser.parse(last_response.body).should == {"id" => id, "x"=>1, "y"=>1, "status" => "miss"}
  end

  def create_new_game
    RedisStorage.new.redis.flushdb
    post '/new', Yajl::Encoder.encode({:name => "doug", :email => "dougdroper"})
    Yajl::Parser.parse(last_response.body)["id"]
  end
end
