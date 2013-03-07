require 'spec_helper'

describe "Sinatra App" do
  it "creates a new game" do
    GameLogic.any_instance.stub(:xy => [1,1])
    RedisStorage.any_instance.stub(:incr => 1, :set => stub)
    data = Yajl::Encoder.encode({:name => "doug", :email => "dougdroper"})
    post '/new', data
    Yajl::Parser.parse(last_response.body).should == {"id" => "users:doug:1", "x"=>1, "y"=>1}
  end

  it "receives a fire request" do
    GameLogic.any_instance.stub(:xy => [1,1])
    RedisStorage.any_instance.stub(:incr => 1, :get => ({"visited" => ["11"]}), :set => Board.new)
    data = Yajl::Encoder.encode({:id => 'users:doug:1', :x => 1, :y => 1})
    post '/fire', data
    Yajl::Parser.parse(last_response.body).should ==  {"id"=>"users:doug:1", "x"=>1, "y"=>1, "status"=>"miss"}
  end

  it "404 receives a fire request with no game" do
    Board.any_instance.stub(:status => "miss")
    RedisStorage.any_instance.stub(:incr => 1, :get => nil, :set => stub)
    data = Yajl::Encoder.encode({:id => 'users:doug:1', :x => 1, :y => 1})
    post '/fire', data
    Yajl::Parser.parse(last_response.body).should == {"error"=>"No Game Found"}
  end

  it "receives a fire request with a status" do
    GameLogic.any_instance.stub(:xy => [1,1])
    RedisStorage.any_instance.stub(:incr => 1, :get => ({"visited" => ["11"]}), :set => Board.new)
    data = Yajl::Encoder.encode({:id => 'users:doug:1', :x => 1, :y => 1, :status => "miss"})
    post '/fire', data
    Yajl::Parser.parse(last_response.body).should ==  {"id"=>"users:doug:1", "x"=>1, "y"=>1, "status"=>"miss"}
  end
end